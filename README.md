### 简介

这是一个让你快速基于 `docker swarm` 运行 `misskey` 的仓库

### misskey 我无法解决的问题

- 浏览器通知不能正常工作 https://github.com/syuilo/misskey/issues/3228
- <del>设置-隐私-autoAcceptFollowed 显示的状态永远是 false ， 但是数据库里已经修改了</del> (11.20.0 解决了)

### 前置条件

- 安装`docker`    
  一键安装脚本 `curl -sSL https://g.wsl.fun/docker/install | VERSION="18.06.0-ce" CHANNEL="stable" sh`    
  **注意** 不要轻信任何一键脚本，因为它有可能损坏你的机器，你需要自己检查一遍脚本再执行
- 设置 `docker` 为 `swarm` 模式     
  `docker swarm init --advertise-addr 127.0.0.1`

### 如何使用

1. `git clone https://github.com/shynome/misskey-compose.git /misskey && cd /misskey`
1.  1. 编辑配置文件
    1. 编辑 `docker-compose.yml`     
      `proxy`(caddy web server) 这个如果你有其他前置代理的话可以去掉，直接使用你自己的前置代理    
      `pg` (postgres数据库) 可更换成云数据库，数据库现在是弱密码建议修改    
      `files` 容器卷可更换成云服务的 `nfs` 或 `cifs` 之类的云存储
    1.  `cp conf/example.default.yml conf/default.yml` 开始编辑配置文件 `conf/default.yml`    
        这个是 `misskey` 的配置文件，根据实际情况修改
1.  - 安装 `npm` 命令，下面是两种安装方式 (可选，如果不安装的话得手动跑 docker 的命令，怎么跑可参考 `package.json` 中定义的命令)
    - 安装 `nodejs`，已安装了的可以直接使用
    - 使用 [`snpm`](https://github.com/shynome/snpm) 代替 `npm` 执行脚本 (如果你不是 `nodejs` 用户的话可以试试这个， 只实现了 `npm run` 的相关命令，更小速度更快)    
      `wget -O /usr/local/bin/npm https://github.com/shynome/snpm/releases/download/0.0.1/snpm-linux-amd64 && chmod +x /usr/local/bin/npm`
1. 添加 `127.0.0.1   misskey.lcoal` 到 hosts 文件
1. 执行 `npm start`
1.  1. 执行 `npm run ls` 查看服务是否正常运行，等待服务全部运行成功
    1. 进行数据库初始化 `npm run start -- init && npm run logs -- init` 
    1. 等待完成后执行 `npm run stop -- init`
1. 运行 misskey `npm run start -- core`
1. 打开浏览器访问 http://misskey.lcoal
