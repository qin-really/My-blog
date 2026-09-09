# Aether Blog · 纯 Vue3 个人主页（计算机实习生）

一套可部署到任意静态托管的个人主页 / 作品集。**简洁 · 白 + 天空蓝浅色系 · 毛玻璃（高斯模糊）**，响应式适配手机与 PC。
主页结构以 [maorx.cn](https://maorx.cn/) 为参考（首屏大标题 + 代码注释、关于我的身份标签、作品网格、页脚友链等），代码与文案均为原创。

## 功能特性

- ✅ 纯 Vue3（Composition API）+ Vite，零额外运行时依赖
- ✅ **毛玻璃 / 高斯模糊**：`backdrop-filter: blur() + saturate()` 玻璃卡片，背景底图 + 漂浮光斑提供“可被模糊的底色”
- ✅ **白 + 天空蓝浅色系**：`#FFFFFF / #F2F9FF` 页面 + `#2FA8E0 / #7ECFEF` 天空蓝强调
- ✅ **圆角克制**：卡片 8–14px，不做过圆
- ✅ **背景底图预留**：`public/bg.svg` 为占位渐变，放入真实照片后改一行配置即可（见下）
- ✅ **响应式**：移动端汉堡菜单 + 全屏毛玻璃抽屉；栅格自动坍缩
- ✅ 板块：**技能**（分类卡片 + 进度条）、**项目**（GitHub 卡片）、**目标**（分阶段清单）、关于 / 联系 / 页脚
- ✅ **鼠标互动**（克制版）：柔和光晕跟随光标 + 卡片轻微 3D 倾斜；触屏设备与 `prefers-reduced-motion` 下自动关闭
- ✅ 滚动入场动画（IntersectionObserver，渐进增强）
- ✅ 图标来自**阿里巴巴矢量图标库 iconfont.cn**（symbol 模式，已本地化）
- ✅ `base: './'` 相对路径，`npm run build` 产物 `dist/` 可扔进任意静态托管

## 快速开始

```bash
npm install        # 安装依赖
npm run dev        # 本地开发 http://localhost:5173
npm run build      # 产出静态站点到 dist/
npm run preview    # 本地预览构建产物
```

## 身份与文案

所有文字、链接、技能 / 项目 / 目标数据集中在 **`src/data/site.js`**（当前为“计算机实习生 · 陈屿”示例），改这里即可，无需碰组件。

## 替换背景底图

默认使用 `public/bg.svg`（白 + 天空蓝浅色渐变占位图）。换真实照片：

1. 把你的图片放到 `public/`（例如命名 `bg.jpg`）；
2. 在 `src/data/site.js` 顶部把 `bgImage` 改为 `'./bg.jpg'`。

> 底图只做 `background-size: cover` 铺底，不遮挡内容；毛玻璃会自然“糊”出底图的颜色。

## 部署（静态托管）

示例均为 `dist/` 上传或一键构建：

- **GitHub Pages**：Settings → Pages → Deploy from branch `gh-pages`；或直接推送 `dist/`。
- **Netlify / Vercel**：Build command `npm run build`，Output directory `dist`。
- **Gitee Pages / CODING / 阿里云 OSS / 任意云存储**：上传 `dist/` 即可（相对路径，无需改 `base`）。
- 本地也可直接双击 `dist/index.html` 打开。

## 项目结构

```
├─ index.html                    # 入口；加载本地 iconfont.js
├─ public/
│  ├─ iconfont.js                # 阿里 iconfont symbol 图标雪碧图（本地化）
│  └─ bg.svg                     # 背景底图占位（可替换成真实照片 bg.jpg）
└─ src/
   ├─ main.js                    # 应用入口 + v-reveal 滚动动画指令
   ├─ App.vue                    # 页面骨架（背景底图 / 光斑 / 鼠标光晕 / 各板块）
   ├─ style.css                  # 全局样式：天空蓝变量 / 毛玻璃 / 响应式
   ├─ data/site.js               # ★ 全部站点内容
   └─ components/
      ├─ SiteNav.vue             # 顶部导航（滚动吸顶 + 移动抽屉）
      ├─ HeroSection.vue         # 首屏：大标题 + 代码注释 + 统计
      ├─ AboutSection.vue        # 关于：身份标签 + 简介
      ├─ SkillsSection.vue       # 技能
      ├─ ProjectsSection.vue     # 项目
      ├─ GoalsSection.vue        # 目标
      ├─ ContactSection.vue      # 联系（点击复制 / 跳转）
      ├─ SiteFooter.vue          # 页脚：导航 / 友情链接 / 版权
      ├─ CursorGlow.vue          # 鼠标跟随光晕
      ├─ GlassCard.vue           # 毛玻璃卡片 + 3D 倾斜
      └─ AppIcon.vue             # 图标封装（<use href="#icon-xxx">）
```

## 图标库（阿里巴巴矢量图标库 iconfont.cn）

`public/iconfont.js` 为 iconfont.cn **Symbol 模式**导出的雪碧图并本地化，
来源项目：InternLM / MindSearch 官方图标项目（`font_3858115_p8dw9q83s0h`）。

- 用法：`<AppIcon name="icon-GithubFilled" :size="20" />` 或原生
  `<svg class="icon"><use href="#icon-Xxx"></use></svg>`
- 含 33 个常用图标（社交 / 技术 / 项目 / 目标等）及补充的靶心图标 `icon-mubiao`。
- **换成自己的图标**：iconfont.cn → 我的项目 → 「Symbol」下载 `iconfont.js`，替换 `public/iconfont.js` 即可。

## 配色方案

白 + 天空蓝浅色系（依据 Glassmorphism 通用实践与扁平化规范）：

- 页面基底：`#F2F9FF → #FFFFFF → #E7F5FE` 柔和渐变
- 天空蓝：`#2FA8E0`（主）/ `#57B9EA→#2FA8E0`（渐变）/ `#7ECFEF`（光斑）/ `#8AC6EC`（浅强调）
- 玻璃：`rgba(255,255,255,.6~.78)` + `blur(18px) saturate(160%)` + 白色描边
- 文字：`#14334A`（标题）/ `#3E566B`（正文）/ `#7C92A6`（次要）
- 背景光斑仅用天空蓝色系，保证毛玻璃“糊”的是白 + 浅蓝，干净不脏

## 设计依据（GitHub / 网络调研）

- [maorx.cn](https://maorx.cn/) — 主页结构主参考（大标题 + 注释、身份标签、作品网格、页脚友链）
- [ryanbalieiro/vue-resume-template](https://github.com/ryanbalieiro/vue-resume-template) — Vue3 简历/作品集结构参考
- [0xbul1/portfolio](https://github.com/0xbul1/portfolio) — Vue3 + Vite 极简作品集范例
- [InternLM/MindSearch](https://github.com/InternLM/MindSearch) — 图标素材来源项目（阿里 iconfont）

## 许可证

MIT