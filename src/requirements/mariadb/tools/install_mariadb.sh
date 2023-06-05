#!/bin/sh

service mariadb start 

mysql_secure_installation <<EOF

y
${DB_PASSWORD}
${DB_PASSWORD}
y
y
y
y
EOF

mariadb -e "CREATE DATABASE ${DB_NAME};"
mariadb -e "CREATE USER '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}' ;"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USERNAME}'@'%' ;"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "SHOW DATABASES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld