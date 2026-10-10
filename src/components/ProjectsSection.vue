<script setup>
import { ref } from 'vue'
import { projects, videos, videoBase } from '../data/site.js'
import AppIcon from './AppIcon.vue'
import GlassCard from './GlassCard.vue'

// 播放地址集中在 data/site.js 配置，空格统一编码成 %20
function toSrc(file) {
  return encodeURI(`${videoBase}/${file}`)
}

// 没配 name 时用文件名（去掉扩展名）作展示名，避免出现空标题
function videoTitle(v) {
  return v.name || (v.file || '').replace(/\.[^.]+$/, '')
}

// 播放失败的视频 id → true；以及各视频的时长（秒），都按 id 存
const failed = ref({})
const durations = ref({})

function markFailed(id) {
  failed.value[id] = true
}

function readDuration(e, id) {
  durations.value[id] = e.target.duration || 0
}

function fmt(seconds) {
  if (!seconds || !Number.isFinite(seconds)) return ''
  const s = Math.round(seconds)
  const m = Math.floor(s / 60)
  return `${String(m).padStart(2, '0')}:${String(s % 60).padStart(2, '0')}`
}
</script>

<template>
  <section id="projects" class="section">
    <div class="container">
      <div v-reveal class="section__head">
        <span class="section__icon"><AppIcon name="icon-RepoOutlined" :size="24" /></span>
        <div>
          <div class="section__kicker">Projects</div>
          <h2 class="section__title">开源与练手项目</h2>
        </div>
      </div>
      <p v-reveal="40" class="section__desc">
        一些自认为还算拿得出手的作品，欢迎 Star，也欢迎来交流。
      </p>

      <div class="projects__grid">
        <GlassCard
          v-for="(p, i) in projects"
          :key="p.name"
          v-reveal="(i % 3) * 70"
          max-tilt="4"
        >
          <article class="project-card">
            <div class="project-card__top">
              <AppIcon name="icon-FolderOutlined" :size="30" />
              <div class="project-card__links">
                <a
                  v-if="p.repo && p.repo !== '#'"
                  :href="p.repo"
                  target="_blank"
                  rel="noreferrer noopener"
                  title="GitHub 仓库"
                  aria-label="GitHub 仓库"
                >
                  <AppIcon name="icon-GithubFilled" :size="17" />
                </a>
                <a
                  v-if="p.demo"
                  :href="p.demo"
                  target="_blank"
                  rel="noreferrer noopener"
                  title="在线预览"
                  aria-label="在线预览"
                >
                  <AppIcon name="icon-DirectionOutlined" :size="17" />
                </a>
              </div>
            </div>

            <h3 class="project-card__name">{{ p.name }}</h3>
            <p class="project-card__desc">{{ p.desc }}</p>

            <div class="project-card__tags">
              <span v-for="t in p.tags" :key="t" class="pill">{{ t }}</span>
            </div>

            <div class="project-card__foot">
              <span><AppIcon name="icon-StarFilled" :size="15" />{{ p.stars }}</span>
              <span><AppIcon name="icon-GithubFilled" :size="15" />Open Source</span>
            </div>
          </article>
        </GlassCard>
      </div>

      <!-- 视频作品：与项目共用同一容器，排在最后 -->
      <div v-reveal="160" class="videos-block">
        <div class="videos-block__head">
          <AppIcon name="icon-BilibiliOutlined" :size="20" />
          <span>视频作品</span>
          <span class="videos-block__hint">
            <AppIcon name="icon-CloudOutlined" :size="15" />服务器位于海外，视频加载缓慢，请耐心等待
          </span>
        </div>

        <div class="videos__grid">
          <article v-for="v in videos" :key="v.id" class="video-card glass glass--strong">
            <div class="video-player">
              <video
                v-show="!failed[v.id]"
                class="video-player__el"
                controls
                playsinline
                preload="metadata"
                :src="toSrc(v.file)"
                @error="markFailed(v.id)"
                @loadedmetadata="readDuration($event, v.id)"
              ></video>

              <div v-if="failed[v.id]" class="video-player__error">
                <AppIcon name="icon-InfoCircleOutline" :size="22" />
                <p class="video-player__error-title">视频加载失败</p>
                <p class="video-player__error-text">服务器位于海外，可能是网络暂时无法连接该资源。</p>
                <code class="video-player__error-code">{{ toSrc(v.file) }}</code>
              </div>
            </div>

            <div class="video-card__meta">
              <h3 class="video-card__title">{{ videoTitle(v) }}</h3>
              <p v-if="v.desc" class="video-card__desc">{{ v.desc }}</p>
              <div v-if="v.tags && v.tags.length || durations[v.id]" class="video-card__foot">
                <span v-for="t in v.tags || []" :key="t" class="pill">{{ t }}</span>
                <span v-if="durations[v.id]" class="video-card__stat">
                  <AppIcon name="icon-TimeOutlined" :size="14" />{{ fmt(durations[v.id]) }}
                </span>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>
  </section>
</template>