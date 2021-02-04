#!/bin/sh
# sh的判断
echo '===开始判断==='
echo $1
if [ $1 -eq 8000 ]; then
  echo 'prod => 8000 => demo1项目'
  echo '>>>>>开始执行<<<<<'
  cd /www/wwwroot/demo1
  git pull
  npm install
  npm run load
  chmod +x /www/wwwroot/demo1
  sudo chown -R root:root /www/wwwroot/demo1
  echo '>>>>>执行结束<<<<<'
elif [ $1 -eq 8001 ]; then
  echo 'prod => 8001 => demo2项目'
  echo '>>>>>开始执行<<<<<'
  cd /www/wwwroot/demo2
  git pull
  npm install
  npm run stop
  npm run start
  chmod +x /www/wwwroot/demo2
  sudo chown -R root:root /www/wwwroot/demo2
  echo '>>>>>执行结束<<<<<'
elif [ $1 -eq 8002 ]; then
  echo 'prod => 8002 => demo3项目'
  echo '>>>>>开始执行<<<<<'
  cd /www/wwwroot/demo3
  git pull
  npm install
  npm run build
  chmod +x /www/wwwroot/demo3
  sudo chown -R root:root /www/wwwroot/demo3
  echo '>>>>>执行结束<<<<<'
else
  echo '出错了，参数没有传递'
fi
