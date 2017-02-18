#!/bin/bash
today=`date +"%Y%m%d"`

printenv | sed 's/^\(.*\)$/export \1/g' | grep 'MYSQL' > /code/project_env.sh
cat /code/project_env.sh
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#mount host:/data10g/app to container: /code/vol
cp /code/vol/pstockAuto/trading.py /usr/local/lib/python2.7/site-packages/tushare/stock/trading.py

service cron restart

python /code/demo/manage.py runserver 0.0.0.0:8000
