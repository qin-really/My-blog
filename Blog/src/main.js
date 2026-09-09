import { createApp } from 'vue'
import App from './App.vue'
import './style.css'

const app = createApp(App)

// 滚动入场动画指令：元素进入视口后淡入上浮
app.directive('reveal', {
  mounted(el, binding) {
    if (!('IntersectionObserver' in window)) {
      el.classList.add('revealed')
      return
    }
    const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    if (reduce) {
      el.classList.add('revealed')
      return
    }
    el.classList.add('reveal')
    const delay = Number(binding.value) || 0
    if (delay) el.style.transitionDelay = delay + 'ms'
    const io = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            el.classList.add('revealed')
            io.unobserve(el)
          }
        })
      },
      { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
    )
    io.observe(el)
    el.__revealIO__ = io
  },
  unmounted(el) {
    if (el.__revealIO__) el.__revealIO__.disconnect()
  }
})

app.mount('#app')