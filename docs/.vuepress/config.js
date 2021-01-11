const head = require('./config/head.js');
const plugins = require('./config/plugins.js');
const themeConfig = require('./config/themeConfig.js');

module.exports = {
  theme: 'vdoing', // 使用依赖包主题
  // theme: require.resolve('../../theme-vdoing'), // 使用本地主题

  title: "Yuki's blog",
  description: '',
  // plugins: [
  //   [
  //     'vuepress-plugin-comment',
  //     {
  //       // choosen: 'gitalk',
  //       // options: {
  //       //   clientID: 'bb72658f22a0593ef696',
  //       //   clientSecret: '8d4d4fe0733a375c3668c91eb0526892dd559b2b',
  //       //   repo: 'https://github.com/yuki0320/yuki0320.github.io',
  //       //   owner: 'yukitan',
  //       //   admin: ['yukitan'],
  //       //   distractionFreeMode: false
  //       // }
  //     }
  //   ]
  // ],
  // base: '/', // 格式：'/<仓库名>/'， 默认'/'
  markdown: {
    lineNumbers: true, // 代码行号
  },

  head,
  plugins,
  themeConfig,
}
