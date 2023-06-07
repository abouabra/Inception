!/bin/sh

service redis-server start

sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/"  /etc/redis/redis.conf

sleep 99999999999