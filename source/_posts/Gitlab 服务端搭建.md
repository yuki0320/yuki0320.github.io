> GitLab 是一款使用 MIT 许可证的基于网络的 Git 仓库管理工具，我们可以使用它来搭建自己的 Git 仓库，本文将介绍如何使用 Gitlab 在 Linux 下快速搭建 Git 仓库。

<!-- more -->

Gitlab 服务端搭建
------------

> 在 Linux（CenterOS7.6）下我们会以 Docker 的方式来安装 Gitlab，对 Docker 不了解的朋友可以参考：[开发者必备 Docker 命令](https://mp.weixin.qq.com/s?__biz=MzU1Nzg4NjgyMw==&mid=2247483776&idx=1&sn=736fb79ad59257d1f1e83394ca27e711&scene=21#wechat_redirect)。

### 下载 Gitlab 的 Docker 镜像

```
docker pull gitlab/gitlab-ce


```

### 运行如下命令来启动 Gitlab

> 需要注意的是我们的 Gitlab 的 http 服务运行在宿主机的 1080 端口上，这里我们将 Gitlab 的配置，日志以及数据目录映射到了宿主机的指定文件夹下，防止我们在重新创建容器后丢失数据。

```bash
docker run --detach \
  --publish 10443:443 --publish 1080:80 --publish 1022:22 \
  --name gitlab \
  --restart always \
  --volume /mydata/gitlab/config:/etc/gitlab \
  --volume /mydata/gitlab/logs:/var/log/gitlab \
  --volume /mydata/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest


```

### 开启防火墙的指定端口

> 由于 Gitlab 运行在 1080 端口上，所以我们需要开放该端口，注意千万不要直接关闭防火墙，否则 Gitlab 会无法启动。

```bash
# 开启1080端口
firewall-cmd --zone=public --add-port=1080/tcp --permanent
# 重启防火墙才能生效
systemctl restart firewalld
# 查看已经开放的端口
firewall-cmd --list-ports


```

### 访问 Gitlab

*   访问地址：http://192.168.3.101:1080/

*   由于 Gitlab 启动比较慢，需要耐心等待 10 分钟左右，如果 Gitlab 没有启动完成访问，会出现如下错误。

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHG5AibdJnNpGgOCnsTsWDEiazWkgervbMpJZshxDsnwZcGB9pudAHegfCg/640?wx_fmt=png)

*   可以通过 docker 命令动态查看容器启动日志来知道 gitlab 是否已经启动完成。

```
docker logs gitlab -f


```

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGfOwLAHP9X36Jz2QtSUeibtc5pb5jMWXiciapdBvwyDlpJVzayUHOMf9ibw/640?wx_fmt=png)

Gitlab 的使用
----------

### Gitlab 启动完成后第一次访问，会让你重置 root 帐号的密码

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGuia7X5xkwqbPQNkKEkNqDwGnomxkatulYLtTfXHtWZMwenrLqDuKI0A/640?wx_fmt=png)

### 重置完成后输入帐号密码登录

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGbHMvhA9qL014zNruiaztHEvXgGAwChV3ibfiaRzRIGtCAic3KSNxDDMo9Q/640?wx_fmt=png)

### 选择创建项目、创建组织、创建帐号

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGyTq206JzEUDuibo6EPpicOPVOXB72GibuYkF0TPNbaSCYO9FPSGVlZ7Qw/640?wx_fmt=png)

### 创建组织

首先我们需要创建一个组织，然后在这个组织下分别创建用户和项目，这样同组织的用户就可以使用该组织下的项目了。![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHG5df1oIRsV0XdWufHJtgKGrHP6MFiaWzEbzs8jick743VONYY17DYsbHg/640?wx_fmt=png)

### 创建用户并修改密码

#### 找到添加用户的按钮

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGhlgHf0pkN3lTDhQQUmTM7KlMKhEcytC5LMGPOGggia47hiatWKuy8upw/640?wx_fmt=png)

#### 输入用户名密码添加用户

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGictnic4xicqNnm3l5ylr58YAH36eTHHGme9tw4n2RVbZqLaTfzFZvzEqQ/640?wx_fmt=png)

#### 在编辑界面中修改用户密码

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGOAfmXib1qezQJ7aaE99Oc12sW0NxkRRyaJrlIhxS4mltwBiaMibQG1ZfA/640?wx_fmt=png)![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGia1O2aRjOTzAgkMVQRv5geJh6W4xKafx9sefv1PQ3DGThbficLtrkRWw/640?wx_fmt=png)

### 创建项目并添加 README 文件

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGMsvSmqYVbuk7M24f62D6V4w6kZGiaqJ93icfL1r5zWIV9kwpexBP2HdQ/640?wx_fmt=png)![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGzWH5z4a1Fz5CfvAicBXib0LIRdd5mXMFvgFFfUsGAicAibu0kp25vSalxA/640?wx_fmt=png)

### 将用户分配到组织

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGb2aOBvLaqrZ6L3bicr11hCWZNGvoPR9ibY0jT4CBicUlA1t0sMv0JkZgQ/640?wx_fmt=png)

Git 客户端安装及使用
------------

### 下载 Git 客户端并安装

*   下载地址：https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe

*   下载完成后，一路点击 Next 安装即可。

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGcr0nDgBzEicctffGYRk9wuicdM9aIDgpzibtNyHg0TiaG20XYNZYxVjf8w/640?wx_fmt=png)

### clone 项目

*   找到项目 clone 的地址：

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGOz1QVibF3ZDoiaVrsa3mlVVfJBP65qV5vR1XclibWobwmNd5B6Fgces1w/640?wx_fmt=png)

*   打开 Git 命令行工具：

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGbboeq0kcslW4Gqf3zp7qC2eCwkUrrhXaicSt56Pp8Jya1kZnmzWsWJg/640?wx_fmt=png)

*   执行以下命令 clone 项目到本地：

```
git clone http://192.168.3.101:1080/macrozheng/hello.git



```

### 提交代码

进入项目目录，修改一下 README.md 并提交：

```
# 进入项目工程目录
cd hello/
# 将当前修改的文件添加到暂存区
git add .
# 提交代码
git commit -m "first commit"


```

### 推送到远程仓库

```
git push


```

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGFibvyYpQxPibryNFYiaUXDDp2Vm8ma1vh1VBfr2rhDELKoicyqb5jQ7Fuw/640?wx_fmt=png)

### 拉取远程仓库代码

*   在 Gitlab 上修改 readme 中的文件内容：

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGaic1ml39Pia6MEol2ccciaeML7r6bxdTXRbbxQRict3pnicxesrSRzCEt7g/640?wx_fmt=png)

*   拉取代码：

```
git pull


```

### 本地创建并提交分支

```
# 切换并从当前分支创建一个dev分支git checkout -b dev# 将新创建的dev分支推送到远程仓库git push origin dev
```

![](https://mmbiz.qpic.cn/mmbiz_png/CKvMdchsUwkLKgUhRUWnDkfy2L7J0QHGPgrmAdiasFXmdicNjtfZeYMO0xqctZmC9HnbuDfHPxKNw0DcS5HxF8dw/640?wx_fmt=png)

### 其他常用命令

```
# 切换到dev分支
git checkout dev
# 查看本地仓库文件状况
git status
# 查看本地所有分支
git branch
# 查看提交记录
git log


```

