<script setup>
import { goals } from '../data/site.js'
import AppIcon from './AppIcon.vue'
import GlassCard from './GlassCard.vue'
</script>

<template>
  <section id="goals" class="section">
    <div class="container">
      <div v-reveal class="section__head">
        <span class="section__icon"><AppIcon name="icon-mubiao" :size="24" /></span>
        <div>
          <div class="section__kicker">Goals</div>
          <h2 class="section__title">我的目标清单</h2>
        </div>
      </div>
      <p v-reveal="40" class="section__desc">
        把大目标拆成小步走。进度条会骗人，但方向感不骗人。
      </p>

      <div class="goals__list">
        <GlassCard
          v-for="(g, gi) in goals"
          :key="g.phase"
          v-reveal="gi * 90"
          max-tilt="2"
        >
          <div class="goal-card">
            <div class="goal-card__node">
              <AppIcon :name="g.icon" :size="26" />
            </div>
            <div>
              <span class="goal-card__phase">{{ g.phase }}</span>
              <div v-for="item in g.items" :key="item.text" v-reveal="gi * 90 + 60" class="goal-item">
                <span class="goal-item__icon"><AppIcon :name="item.icon" :size="16" /></span>
                <p class="goal-item__text">{{ item.text }}</p>
              </div>
            </div>
          </div>
        </GlassCard>
      </div>
    </div>
  </section>
</template>