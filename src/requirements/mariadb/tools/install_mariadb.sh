#!/bin/sh

service mariadb start 

mysql_secure_installation <<EOF

y
1598753246
1598753246
y
y
y
y
EOF

mariadb -e "CREATE DATABASE wordpress;"
mariadb -e "CREATE USER 'abouabra'@'%' IDENTIFIED BY '1598753246' ;"
mariadb -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'abouabra'@'%' ;"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "SHOW DATABASES;"

kill $(cat /var/run/mysqld/mysqld.pid)

# sleep 999999
mysqld