#!/bin/sh

cd /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/html --locale=en_US --allow-root

cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php
sed -i "s/username_here/${DB_USERNAME}/" /var/www/html/wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" /var/www/html/wp-config.php
sed -i 's/localhost/mariadb/' /var/www/html/wp-config.php

sed -i 's/;extension=curl/extension=mysqli/' /etc/php/7.4/cgi/php.ini
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

wp core install --url="${WORDPRESS_URL}" --title="${WORDPRESS_TITLE}" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_EMAIL} --allow-root

wp plugin install redis-cache --activate --allow-root

wp config set WP_CACHE_KEY_SALT wp_salt_key --raw --allow-root
wp config set WP_REDIS_CLIENT redis --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root

wp redis enable --allow-root

wp theme activate twentytwentytwo  --allow-root

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

/usr/sbin/php-fpm7.4 -F 