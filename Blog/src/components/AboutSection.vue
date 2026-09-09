<script setup>
import { profile } from '../data/site.js'
import AppIcon from './AppIcon.vue'
import GlassCard from './GlassCard.vue'
</script>

<template>
  <section id="about" class="section">
    <div class="container">
      <div v-reveal class="section__head">
        <span class="section__icon"><AppIcon name="icon-PersonalOutlined" :size="22" /></span>
        <div>
          <div class="section__kicker">About</div>
          <h2 class="section__title">关于我</h2>
        </div>
      </div>

      <GlassCard v-reveal="60" max-tilt="2" class="about-card">
        <div class="about__tags">
          <span v-for="t in profile.identities" :key="t" class="pill">{{ t }}</span>
        </div>

        <div class="about__bio">
          <p v-for="(p, i) in profile.about" :key="i">{{ p }}</p>
        </div>

        <div class="about__interests">
          <div v-for="it in profile.interests" :key="it.text" class="about__interest">
            <AppIcon :name="it.icon" :size="18" />
            <span>{{ it.text }}</span>
          </div>
        </div>
      </GlassCard>
    </div>
  </section>
</template>