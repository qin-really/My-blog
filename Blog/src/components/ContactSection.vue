<script setup>
import { ref } from 'vue'
import { socials } from '../data/site.js'
import AppIcon from './AppIcon.vue'
import GlassCard from './GlassCard.vue'

const toast = ref('')
const toastVisible = ref(false)
let timer = null

async function onCard(s) {
  if (s.type === 'link') {
    window.open(s.value, '_blank', 'noopener,noreferrer')
    return
  }
  try {
    await navigator.clipboard.writeText(s.value)
    showToast(`${s.label} 已复制`)
  } catch {
    showToast(`请手动复制：${s.value}`)
  }
}

function showToast(msg) {
  toast.value = msg
  toastVisible.value = true
  clearTimeout(timer)
  timer = setTimeout(() => (toastVisible.value = false), 2200)
}
</script>

<template>
  <section id="contact" class="section">
    <div class="container">
      <div v-reveal class="section__head">
        <span class="section__icon"><AppIcon name="icon-CommentOutlined" :size="24" /></span>
        <div>
          <div class="section__kicker">Contact</div>
          <h2 class="section__title">保持联系</h2>
        </div>
      </div>
      <p v-reveal="40" class="section__desc">
        技术交流，或者只是想打个招呼，都欢迎找到我。点击卡片即可打开链接或复制信息。
      </p>

      <div class="contact__grid">
        <GlassCard v-for="(s, i) in socials" :key="s.label" v-reveal="i * 60" max-tilt="3">
          <div class="contact-card" @click="onCard(s)">
            <span class="contact-card__icon"><AppIcon :name="s.icon" :size="26" /></span>
            <div class="contact-card__body">
              <div class="contact-card__label">{{ s.label }}</div>
              <div class="contact-card__value">{{ s.value }}</div>
            </div>
            <span class="contact-card__action">
              <AppIcon :name="s.type === 'link' ? 'icon-GotoOutline' : 'icon-CopyOutlined'" :size="18" />
            </span>
          </div>
        </GlassCard>
      </div>
    </div>

    <Transition name="toast">
      <div v-if="toastVisible" class="toast is-show">{{ toast }}</div>
    </Transition>
  </section>
</template>

<style scoped>
.toast-enter-active,
.toast-leave-active {
  transition: opacity 0.3s ease, transform 0.3s ease;
}
.toast-enter-from,
.toast-leave-to {
  opacity: 0;
  transform: translateX(-50%) translateY(20px);
}
</style>