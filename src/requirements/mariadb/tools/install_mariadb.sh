#!/bin/sh

service mysql start 

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
mariadb -e "GRANT ALL ON wordpress.* TO 'abouabra'@'%' IDENTIFIED BY '1598753246' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES"
mariadb -e "SHOW DATABASES;"

kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld