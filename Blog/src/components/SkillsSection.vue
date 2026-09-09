<script setup>
import { skillGroups } from '../data/site.js'
import AppIcon from './AppIcon.vue'
import GlassCard from './GlassCard.vue'
</script>

<template>
  <section id="skills" class="section">
    <div class="container">
      <div v-reveal class="section__head">
        <span class="section__icon"><AppIcon name="icon-CPUOutlined" :size="24" /></span>
        <div>
          <div class="section__kicker">Skills</div>
          <h2 class="section__title">我的技术栈</h2>
        </div>
      </div>
      <p v-reveal="40" class="section__desc">
        前端打底，后端补位，AI 拓宽视野。这里是我的常用武器库，数值随时间滚动更新。
      </p>

      <div class="skills__grid">
        <GlassCard v-for="(g, i) in skillGroups" :key="g.title" v-reveal="i * 60" max-tilt="3">
          <div class="skill-card">
            <div class="skill-card__head">
              <span class="skill-card__icon"><AppIcon :name="g.icon" :size="22" /></span>
              <h3 class="skill-card__title">{{ g.title }}</h3>
            </div>
            <p class="skill-card__desc">{{ g.desc }}</p>

            <div class="skill-item" v-for="item in g.items" :key="item.name">
              <span class="skill-item__name">{{ item.name }}</span>
            </div>
          </div>
        </GlassCard>
      </div>
    </div>
  </section>
</template>