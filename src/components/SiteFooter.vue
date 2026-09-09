<script setup>
import { profile, nav, references } from '../data/site.js'
import AppIcon from './AppIcon.vue'

function go(id) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}
</script>

<template>
  <footer class="footer">
    <div class="container">
      <div class="footer__grid">
        <div>
          <h4 class="footer__title">{{ profile.brand }}</h4>
          <p class="footer__about">
            {{ profile.tagline }}
            <br />
            天空蓝 × 毛玻璃 × 简洁 —— 这套主页本身就是一份作品。
          </p>
        </div>

        <div>
          <h4 class="footer__title">快速导航</h4>
          <ul class="footer__links">
            <li v-for="item in nav" :key="item.id">
              <a href="#" @click.prevent="go(item.id)">
                {{ item.label }}
              </a>
            </li>
          </ul>
        </div>

        <div>
          <h4 class="footer__title">友情链接</h4>
          <ul class="footer__refs">
            <li v-for="r in references" :key="r.name">
              <a :href="r.href" target="_blank" rel="noreferrer noopener">
                {{ r.name }} <AppIcon name="icon-GotoOutline" :size="13" />
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div class="footer__bottom">
        <span>© {{ new Date().getFullYear() }} {{ profile.name }} · 用 Vue 3 + Vite 构建</span>
        <span>Icons by 阿里巴巴矢量图标库 iconfont.cn</span>
      </div>
    </div>
  </footer>
</template>