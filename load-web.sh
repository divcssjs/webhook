#!/bin/sh
echo '开始执行'
cd /www/wwwroot/load-web
git pull
yarn install
yarn load
chmod +x /www/wwwroot/load-web
sudo chown -R root:root /www/wwwroot/load-web
echo '执行结束'
