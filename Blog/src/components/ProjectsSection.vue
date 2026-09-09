<script setup>
import { projects } from '../data/site.js'
import AppIcon from './AppIcon.vue'
import GlassCard from './GlassCard.vue'
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
    </div>
  </section>
</template>