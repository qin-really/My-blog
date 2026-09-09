<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'

const el = ref(null)
let raf = 0
let x = -500
let y = -500
let tx = -500
let ty = -500

function onMove(e) {
  tx = e.clientX
  ty = e.clientY
}

function loop() {
  x += (tx - x) * 0.14
  y += (ty - y) * 0.14
  if (el.value) el.value.style.transform = `translate3d(${x.toFixed(1)}px, ${y.toFixed(1)}px, 0)`
  raf = requestAnimationFrame(loop)
}

onMounted(() => {
  const canHover = window.matchMedia('(hover: hover) and (pointer: fine)').matches
  const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches
  if (!canHover || reduce || !el.value) return
  window.addEventListener('mousemove', onMove, { passive: true })
  raf = requestAnimationFrame(loop)
})

onBeforeUnmount(() => {
  window.removeEventListener('mousemove', onMove)
  cancelAnimationFrame(raf)
})
</script>

<template>
  <div ref="el" class="cursor-glow" aria-hidden="true"></div>
</template>