<script setup>
import { bgImage } from './data/site.js'
import SiteNav from './components/SiteNav.vue'
import HeroSection from './components/HeroSection.vue'
import AboutSection from './components/AboutSection.vue'
import SkillsSection from './components/SkillsSection.vue'
import ProjectsSection from './components/ProjectsSection.vue'
import GoalsSection from './components/GoalsSection.vue'
import ContactSection from './components/ContactSection.vue'
import SiteFooter from './components/SiteFooter.vue'
import CursorGlow from './components/CursorGlow.vue'
</script>

<template>
  <div class="page">
    <!-- 背景底图（预留）：src/data/site.js 中 bgImage 指向 public/ 下图片 -->
    <div class="bg-cover" :style="{ backgroundImage: `url(${bgImage})` }"></div>

    <div class="blobs" aria-hidden="true">
      <span class="blob blob-a"></span>
      <span class="blob blob-b"></span>
      <span class="blob blob-c"></span>
    </div>

    <CursorGlow />
    <SiteNav />

    <main style="position: relative; z-index: 2">
      <HeroSection />
      <AboutSection />
      <SkillsSection />
      <ProjectsSection />
      <GoalsSection />
      <ContactSection />
    </main>

    <SiteFooter />
  </div>
</template>