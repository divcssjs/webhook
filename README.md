# node and webhook

> nodejs+linux 环境+pm2 监控

```js
pm2 start ./load-api.js --watch // 监听任务,发生改变自动刷新

// prot:5000  http://url:5000
```

在`github`/`gitee`项目的`Settings`中找到`Webhooks`添加记录

webhook 地址填写你监听的服务地址`http://url:5000`

Content type 类型选 application/json

Secret 密码是`webhook` 在 load-api.js 中 6/8 行的 secret/token 处修改

# 执行顺序

本地开发完毕提交代码

项目对应填写的地址会被监听到执行 post 请求（请求`http://url:5000`）

load-api.js 执行对应 sh 文件

开始执行代码

```sh
#!/bin/sh
echo '开始执行'
cd /www/wwwroot/load-api
git pull
yarn install
yarn stop
yarn start
chmod +x /www/wwwroot/load-api
sudo chown -R root:root /www/wwwroot/load-api
echo '执行结束'
```
# pm2常用命令
```js
pm2 start ./test.js --watch // 监听某任务
pm2 stop id // 停止某id的任务
pm2 stop name // 停止对用name的任务
pm2 stop all // 停止所有
pm2 reload id // 重启
pm2 reload all // 重启所有
pm2 monit // 查看打印日志
pm2 list // 任务列表
```