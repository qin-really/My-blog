<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'

const props = defineProps({
  // 允许的最大倾斜角度（度），0 表示仅悬浮不做倾斜
  maxTilt: { type: Number, default: 5 },
  // 是否开启倾斜交互（触摸设备自动关闭）
  tiltable: { type: Boolean, default: true }
})

const el = ref(null)
let cleanup = () => {}

onMounted(() => {
  if (!props.tiltable || !el.value) return
  const canHover = window.matchMedia('(hover: hover) and (pointer: fine)').matches
  const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches
  if (!canHover || reduce) return

  const card = el.value

  function onMove(e) {
    const r = card.getBoundingClientRect()
    const px = (e.clientX - r.left) / r.width - 0.5
    const py = (e.clientY - r.top) / r.height - 0.5
    card.style.transition = 'transform .08s ease-out'
    card.style.transform = `perspective(900px) rotateX(${(-py * props.maxTilt).toFixed(2)}deg) rotateY(${(px * props.maxTilt).toFixed(2)}deg) translateY(-4px)`
  }

  function onLeave() {
    card.style.transition = 'transform .4s ease, box-shadow .4s ease'
    card.style.transform = ''
  }

  card.addEventListener('mousemove', onMove, { passive: true })
  card.addEventListener('mouseleave', onLeave, { passive: true })
  cleanup = () => {
    card.removeEventListener('mousemove', onMove)
    card.removeEventListener('mouseleave', onLeave)
  }
})

onBeforeUnmount(() => cleanup())
</script>

<template>
  <div ref="el" class="glass glass-tilt">
    <slot></slot>
  </div>
</template>