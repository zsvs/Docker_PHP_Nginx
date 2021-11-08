#!/bin/bash

mkdir 1
if [ $? == 0 ]
then
  nginx -t
  echo "+++++++++++++++++CHEKING nginx+++++++++++++++++++++++++"
  ls -la /etc/nginx/conf.d/
  echo "++++++++++++++++++++CHEKING nginx vhost+++++++++++++++++++++++"
  cat /etc/nginx/sites-enabled/vhost
  echo "++++++++++++++++++++++++++++++++++++++++++"
  cat /etc/php/7.4/fpm/pool.d/www.conf | grep listen
  echo "+++++++++++++++CHEKING PHP-FPM STATUS++++++++++++++++++++"
  service php7.4-fpm start
  service php7.4-fpm status
  echo "++++++++++++++++++++++++++++++++++++++++++"
  echo "Starting nginx"
  nginx -g "daemon off;"
fi