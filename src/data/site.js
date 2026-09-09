// ============================================================
// 站点内容配置：修改这里即可换掉整站文案，无需改动组件
// ============================================================

export const bgImage = './bg.svg'
// 背景底图（预留）：把真实照片命名为 bg.jpg 放入 public/ 后，改为 './bg.jpg'
// 或填写任意在线图片地址。想使用未压缩的本地图，也可 import 后引用。

export const nav = [
  { id: 'home', label: '首页' },
  { id: 'about', label: '关于' },
  { id: 'skills', label: '技能' },
  { id: 'projects', label: '项目' },
  { id: 'goals', label: '目标' },
  { id: 'contact', label: '联系' }
]

export const profile = {
  name: '繁花',
  brand: 'Fanhua.dev',
  slogan: '笃行致远.',
  sloganComment: '这里是繁花的个人主页',
  role: '计算机专业实习生',
  tagline: '认真实习、勤恳学习的计算机专业学生，正在努力把代码写得像样，把每一步踩过的坑都记录下来。',
  location: '中国 · 广西',
  identities: ['计算机专业', '前端开发实习生', 'GitHub 玩家', 'AI 爱好者', '成长中的 全栈工程师'],
  about: [
    '你好，我是一名计算机专业的学生，目前在正在准备实习。业余时间喜欢折腾开源、写技术笔记，也在学习把大模型接进真实产品里。',
    '我相信好用的工具应当简单、克制且有质感。这套主页就是我期望的审美——白色与天空蓝之间的毛玻璃，干净清爽，不喧宾夺主。'
  ],
  interests: [
    { icon: 'icon-LightOutlined', text: '保持好奇，追着 AI新技术学习' },
    { icon: 'icon-CloudOutlined', text: '重视代码规范、可读性与文档沉淀' },
    { icon: 'icon-CommentOutlined', text: '把实习中的踩坑写成笔记，乐于分享' }
  ],
  stats: [
    { value: '0+', label: '个月实习' },
    { value: '2', label: '课程与个人项目' },
    { value: '0.0k', label: 'GitHub Commits' },

  ]
}

export const socials = [
  { icon: 'icon-GithubFilled', label: 'GitHub', value: 'https://github.com/qin-really', type: 'link' },
  { icon: 'icon-MailFilled', label: '邮箱', value: 'qin_really@163.com', type: 'copy' },
  { icon: 'icon-WechatFilled', label: '微信', value: 'qin_really', type: 'copy' }
]

export const skillGroups = [
  {
    icon: 'icon-BrowserOutlined',
    title: '前端开发',
    desc: '构建圆润、流畅、可维护的界面与交互。',
    items: [
      { name: 'Vue 3 ', level: 43 },
      { name: 'TypeScript', level: 31 },
      { name: 'Vite / 构建工具', level: 35 },

    ]
  },
  {
    icon: 'icon-ConsoleOutlined',
    title: '后端基础',
    desc: '能写 API、调性能，够用且在路上。',
    items: [
      { name: 'Spring-Boot', level: 55 },
      { name: 'Python&Java基础 ', level: 61 },
      { name: 'MySQL ', level: 49 },

    ]
  },
  {
    icon: 'icon-RobotOutlined',
    title: '人工智能',
    desc: '把大模型接进产品，学习如何落地。',
    items: [
      { name: 'AI LLM 应用开发', level: 55 },
      { name: '本地部署私有化AI', level: 66 },
      { name: 'Prompt', level: 45 },

    ]
  },
  {
    icon: 'icon-GPUOutlined',
    title: '工程与工具',
    desc: '规范的协作方式与自动化习惯。',
    items: [
      { name: 'Git ', level: 41 },
      { name: 'Docker 基础', level: 35 },
      { name: 'Linux 日常使用', level: 55 }
    ]
  }
]

export const projects = [
  {
    name: 'Aether 个人主页',
    desc: '就是本站在这里。Vue3 + Vite，扁平化与毛玻璃的实践，一份构建随处部署。',
    tags: ['Vue 3', 'Vite', '毛玻璃'],
    repo: 'https://github.com/qin-really',
    demo: null,
    stars: 0
  },
  {
    name: '中国象棋在线对战',
    desc: '基于spring-boot+vue开发的在线象棋对战平台',
    tags: ['Spring-Boot', 'WebSocket ', 'AI开发'],
    repo: 'https://github.com/qin-really',
    demo: null,
    stars: 0
  },



]

export const goals = [
  {
    phase: '短期',
    icon: 'icon-huoyan',
    items: [
      { icon: 'icon-KnowledgeOutlined', text: '啃透 Vue3 + TypeScript', progress: 62 },
      { icon: 'icon-RepoOutlined', text: '把第一段实习里负责的模块做成可复用组件', progress: 78 },
      
      { icon: 'icon-DirectionOutlined', text: '把工位安排得明明白白：规律作息与锻炼', progress: 65 }
    ]
  },
  {
    phase: '中期',
    icon: 'icon-TrophyOutlined',
    items: [
      { icon: 'icon-GithubFilled', text: '完成 3 个拿得出手的开源项目并沉淀简历', progress: 28 },
      { icon: 'icon-mubiao', text: '独立跑通全栈，做一款带知识库的 AI 小产品', progress: 35 },
      { icon: 'icon-TrophyOutlined', text: '通过软考', progress: 22 }
    ]
  },
  {
    phase: '长期',
    icon: 'icon-LightOutlined',
    items: [
      { icon: 'icon-KnowledgeOutlined', text: '成长为「前端 × 全栈 × AI」的独立开发者', progress: 12 },
      { icon: 'icon-TotopOutlined', text: '持续开源与写作，积累自己的技术影响力', progress: 18 },
      { icon: 'icon-StarFilled', text: '保持热爱：玩得下去，也走得够远', progress: 30 }
    ]
  }
]

export const references = [

  { name: 'vue-resume-template', owner: 'ryanbalieiro', href: 'https://github.com/ryanbalieiro/vue-resume-template' },
  { name: 'portfolio (vue3+vite)', owner: '0xbul1', href: 'https://github.com/0xbul1/portfolio' },
  { name: 'MindSearch（iconfont 图标来源）', owner: 'InternLM', href: 'https://github.com/InternLM/MindSearch' }
]