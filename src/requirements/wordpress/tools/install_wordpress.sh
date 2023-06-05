#!/bin/sh

cd /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html --locale=en_US --allow-root

cp wp-config-sample.php wp-config.php
sed -i 's/database_name_here/wordpress/' /var/www/html/wp-config.php
sed -i 's/username_here/abouabra/' /var/www/html/wp-config.php
sed -i 's/password_here/1598753246/' /var/www/html/wp-config.php
sed -i 's/localhost/mariadb/' /var/www/html/wp-config.php

sed -i 's/;extension=curl/extension=mysqli/' /etc/php/7.4/cgi/php.ini
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F