<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'
import { nav, profile } from '../data/site.js'

const scrolled = ref(false)
const open = ref(false)
const active = ref('home')

function onScroll() {
  scrolled.value = window.scrollY > 12
  // 滚动定位当前板块
  const limit = window.scrollY + window.innerHeight * 0.3
  let current = 'home'
  const secs = document.querySelectorAll('main section[id]')
  for (const s of secs) {
    if (s.offsetTop <= limit) current = s.id
  }
  active.value = current
}

function go(id) {
  open.value = false
  const el = document.getElementById(id)
  if (el) el.scrollIntoView({ behavior: 'smooth' })
}

let ticking = false
function onScrollRaf() {
  if (!ticking) {
    ticking = true
    requestAnimationFrame(() => {
      onScroll()
      ticking = false
    })
  }
}

onMounted(() => {
  window.addEventListener('scroll', onScrollRaf, { passive: true })
  onScroll()
})
onBeforeUnmount(() => window.removeEventListener('scroll', onScrollRaf))
</script>

<template>
  <header class="nav" role="banner">
    <nav class="nav__bar" :class="{ glassy: scrolled || open }">
      <a class="nav__brand" href="#home" @click.prevent="go('home')">
        <span class="nav__logo">A</span>
        {{ profile.brand }}
      </a>

      <div class="nav__links">
        <a
          v-for="item in nav"
          :key="item.id"
          class="nav__link"
          :class="{ 'is-active': active === item.id }"
          href="#"
          @click.prevent="go(item.id)"
        >{{ item.label }}</a>
      </div>

      <button
        class="nav__burger"
        :class="{ 'is-open': open }"
        :aria-expanded="open"
        aria-label="菜单"
        @click="open = !open"
      >
        <span></span>
      </button>
    </nav>

    <Transition name="fade">
      <div v-if="open" class="nav__mobile is-open">
        <div class="nav__mobile-panel" @click="open = false">
          <a
            v-for="item in nav"
            :key="item.id"
            class="nav__mobile-link"
            :class="{ 'is-active': active === item.id }"
            href="#"
            @click.prevent="go(item.id)"
          >{{ item.label }}</a>
        </div>
      </div>
    </Transition>
  </header>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.28s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>