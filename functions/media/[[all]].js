// ============================================================
// Cloudflare Pages Functions：把 R2 对象流式输出到 /media/**
// 仅部署到 Cloudflare Pages 时生效（需在 Pages 设置里绑定 R2 bucket：MY_BUCKET）
// 路径映射：/media/videos/Timeline%201.mp4  →  R2 对象键 videos/Timeline 1.mp4
//
// 两个关键点：
// 1. Range 分片（206 Partial Content）—— 视频能拖动进度条、边下边播
// 2. 显式补全 Content-Type —— 否则浏览器按 application/octet-stream 处理会直接下载
// ============================================================

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

export async function onRequest(context) {
  const { request, env, params } = context

  // 捕获出的路径段数组按文件名取值，应为 params.all；
  // 不同运行时版本的取键名略有出入，这里两个都读，取不到就直接 404 提示排查。
  const segs = params.all || params.path || []
  const key = segs.join('/')
  if (!key) return notFound('(未取到路径段，params 为空)')

  const object = await env.MY_BUCKET.get(key)
  if (!object) return notFound(key)

  const headers = new Headers()
  object.writeHttpMetadata(headers)
  headers.set('etag', object.httpEtag)
  headers.set('Content-Type', contentTypeFor(key, object.httpMetadata && object.httpMetadata.contentType))
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

// 404 里带上对象键，方便确认 R2 里的实际路径
function notFound(key) {
  const headers = new Headers({
    'Content-Type': 'text/plain; charset=utf-8',
    'Cache-Control': 'no-store'
  })
  return new Response(`R2 中未找到对象：${key}\n请检查 R2 bucket 内的实际路径（含 videos/ 前缀）。`, {
    status: 404,
    headers
  })
}
