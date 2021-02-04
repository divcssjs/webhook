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
