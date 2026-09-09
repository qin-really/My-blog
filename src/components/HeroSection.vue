<script setup>
import { profile, socials } from '../data/site.js'
import AppIcon from './AppIcon.vue'

function go(id) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}
</script>

<template>
  <section id="home" class="hero">
    <div class="container hero__box">
      <p class="hero__comment">/* {{ profile.sloganComment }} */</p>
      <h1 class="hero__title">{{ profile.slogan }}</h1>
      <p class="hero__role">{{ profile.role }}</p>
      <p class="hero__tagline">{{ profile.tagline }}</p>

      <div class="hero__actions">
        <button class="btn btn--primary" @click="go('projects')">
          查看项目
          <AppIcon name="icon-GotoOutline" :size="18" />
        </button>
        <button class="btn btn--ghost" @click="go('contact')">
          与我联系
        </button>
      </div>

      <div class="hero__socials">
        <a
          v-for="s in socials.filter((x) => x.type === 'link')"
          :key="s.label"
          class="social-round"
          :href="s.value"
          target="_blank"
          rel="noreferrer noopener"
          :title="s.label"
          :aria-label="s.label"
        >
          <AppIcon :name="s.icon" :size="19" />
        </a>
      </div>

      <div class="hero__stats">
        <div v-for="st in profile.stats" :key="st.label" class="stat glass">
          <div class="stat__value">{{ st.value }}</div>
          <div class="stat__label">{{ st.label }}</div>
        </div>
      </div>
    </div>

    <div class="hero__cue" @click="go('about')">
      <span>向下滚动</span>
      <AppIcon name="icon-ArrowRightOutlined" :size="17" class="icon-down" />
    </div>
  </section>
</template>