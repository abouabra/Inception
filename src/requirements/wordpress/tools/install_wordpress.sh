#!/bin/sh

cd /var/www/html/
wget http://wordpress.org/latest.tar.gz
tar -xzf /var/www/html/latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz wordpress
cp wp-config-sample.php wp-config.php

sed -i 's/;extension=curl/extension=mysqli/' /etc/php/7.4/cgi/php.ini
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf