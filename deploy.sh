#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github
echo 'blog.yuki520.cn' > CNAME
if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:yuki0320/yuki0320.github.io.git
else
  msg='来自github actions的自动部署'
  githubUrl=https://yuki0320:${GITHUB_TOKEN}githubUrl=git@github.com:yuki0320/yuki0320.github.io.git
  git config --global user.name "yukitan"
  git config --global user.email "yukitan0202@gmail.com"
fi
git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github

# deploy to coding
# echo 'www.xugaoyi.com\nxugaoyi.com' > CNAME  # 自定义域名
# echo 'google.com, pub-7828333725993554, DIRECT, f08c47fec0942fa0' > ads.txt # 谷歌广告相关文件

#

cd - # 退回开始所在目录
rm -rf docs/.vuepress/dist
