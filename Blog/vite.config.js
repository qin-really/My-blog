import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  // 相对路径基础，方便部署到任意静态托管（GitHub Pages / Netlify / Vercel / OSS 等）
  base: './',
  server: {
      host: '0.0.0.0',
      port: 5172
  }
})