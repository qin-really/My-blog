// ============================================================
// Cloudflare Pages Functions：把 R2 对象流式输出到 /media/**
//
// ⚠ 绑定的环境变量名必须和控制台「项目设置 → Resources」里填的「名称」完全一致。
// 上次这里写的是 MY_BUCKET，实际绑定叫 video，env.MY_BUCKET 为 undefined，
// .get() 直接抛 TypeError → 500，表现为视频完全无法访问。
// 现在 BUCKET_NAMES 里全部列上，谁存在用谁；都不存在就报错并打印 env 实际内容。
//
// 路径映射：/media/videos/video1.mp4  →  R2 对象键 videos/video1.mp4
// 桶里若直接放根目录，也会自动补试不带 videos/ 前缀的键。
//
// 两个关键点：
// 1. Range 分片（206 Partial Content）—— 视频能拖动进度条、边下边播
// 2. 显式补全 Content-Type —— 否则浏览器按 application/octet-stream 处理会直接下载
// ============================================================

const BUCKET_NAMES = ['video', 'videos', 'MY_BUCKET']

// R2 上传时若未设置 contentType 元数据，会回落到 application/octet-stream，
// 所以这里以扩展名为准，扩展名识别不出来再用 R2 上存的元数据。
const CONTENT_TYPES = {
  '.mp4': 'video/mp4',
  '.m4v': 'video/mp4',
  '.mov': 'video/quicktime',
  '.webm': 'video/webm',
  '.ogv': 'video/ogg',
  '.mkv': 'video/x-matroska',
  '.ts': 'video/mp2t',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.gif': 'image/gif',
  '.svg': 'image/svg+xml',
  '.webp': 'image/webp',
  '.avif': 'image/avif',
  '.ico': 'image/x-icon',
  '.json': 'application/json',
  '.txt': 'text/plain; charset=utf-8'
}

function contentTypeFor(key, stored) {
  const name = (key.split('/').pop() || '').toLowerCase()
  const ext = name.includes('.') ? '.' + name.split('.').pop() : ''
  return CONTENT_TYPES[ext] || stored || 'application/octet-stream'
}

function resolveBucket(env) {
  for (const name of BUCKET_NAMES) {
    if (env && env[name]) return { bucket: env[name], name }
  }
  return { bucket: null, name: null }
}

// 桶里可能带 videos/ 前缀，也可能直接放根目录
function keyCandidates(key) {
  const list = [key]
  const stripped = key.replace(/^videos\//, '')
  if (stripped !== key) list.push(stripped)
  return list
}

async function findObject(bucket, key) {
  for (const candidate of keyCandidates(key)) {
    const object = await bucket.get(candidate)
    if (object) return { object, key: candidate }
  }
  return { object: null, key }
}

export async function onRequest(context) {
  const { request, env, params } = context

  const { bucket, name: bindingName } = resolveBucket(env)
  if (!bucket) {
    const available = Object.keys(env || {})
    return text(
      `R2 绑定不存在：env 里找不到 ${BUCKET_NAMES.join(' / ')}。\n` +
        `当前 env 可用键：${available.join(', ') || '(空)'}\n` +
        `请去 Pages 项目设置 → Resources 确认 R2 绑定的「名称」，并加入 BUCKET_NAMES。`,
      500
    )
  }

  // 捕获出的路径段数组按文件名取值，应为 params.all；
  // 不同运行时版本的取键名略有出入，这里两个都读，取不到就直接 404 提示排查。
  const segs = params.all || params.path || []
  const key = segs.join('/')
  if (!key) return notFound(bindingName, ['(未取到路径段，params 为空)'])

  const { object, key: hitKey } = await findObject(bucket, key)
  if (!object) return notFound(bindingName, keyCandidates(key))

  const headers = new Headers()
  object.writeHttpMetadata(headers)
  headers.set('etag', object.httpEtag)
  headers.set('Content-Type', contentTypeFor(hitKey, object.httpMetadata && object.httpMetadata.contentType))
  headers.set('Accept-Ranges', 'bytes')
  headers.set('Access-Control-Allow-Origin', '*')

  const range = request.headers.get('Range')
  // 完整下载才走缓存；分片响应每次按需取，避免拖进度条反复命中过期片段
  if (!range && !headers.has('Cache-Control')) {
    headers.set('Cache-Control', 'public, max-age=3600')
  }

  // workerd 原生支持 httpRange 时优先用它
  if (typeof object.httpRange === 'function') {
    const { body, status, headers: rangeHeaders } = object.httpRange(range, headers)
    return new Response(body, { status, headers: rangeHeaders })
  }

  // 老版本运行时没有 httpRange，手写一份等价的 Range 处理
  if (request.method === 'HEAD') {
    return new Response(null, { status: 200, headers })
  }
  if (!range) {
    return new Response(object.body, { status: 200, headers })
  }

  const m = /^bytes=(\d*)-(\d*)$/.exec(range)
  const size = object.size
  const start = m && m[1] ? Number(m[1]) : 0
  const end = m && m[2] ? Math.min(Number(m[2]), size - 1) : size - 1

  if (Number.isNaN(start) || Number.isNaN(end) || start > end || start >= size) {
    headers.set('Content-Range', `bytes */${size}`)
    return new Response(null, { status: 416, headers })
  }

  headers.set('Content-Range', `bytes ${start}-${end}/${size}`)
  headers.set('Content-Length', String(end - start + 1))
  return new Response(object.slice(start, end + 1).body, { status: 206, headers })
}

// 返回体里带上实际尝试过的对象键，方便确认 R2 桶内的真实路径
function notFound(binding, tried) {
  const detail = `已尝试的对象键：\n${tried.map((t) => `  ${t}`).join('\n')}`
  return text(`R2 中未找到对象（绑定名：${binding}）。\n${detail}\n请检查 R2 桶内实际的文件路径。`, 404)
}

function text(body, status) {
  return new Response(body, {
    status,
    headers: new Headers({
      'Content-Type': 'text/plain; charset=utf-8',
      'Cache-Control': 'no-store'
    })
  })
}
