### 简介

这是一个让你快速基于 `docker swarm` 运行 `misskey` 的仓库

### 如何使用

1. `git clone https://github.com/shynome/misskey-compose.git /misskey && cd /misskey`
1. 安装 `nodejs` 
1. 添加 `127.0.0.1   misskey.lcoal` 到 hosts 文件
1. 执行 `npm start`
1. 
  1. 进行数据库初始化 `npm run start -- init && npm run logs -- init` 
  1. 等待完成后执行 `npm run stop -- init`
1. 运行 misskey `npm run start -- core`
1. 打开浏览器访问 http://misskey.lcoal
