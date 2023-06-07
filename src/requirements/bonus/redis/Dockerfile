FROM debian:bullseye

RUN apt-get update && apt-get install -y vim redis-server php-redis

COPY ./conf/configure_redis.sh /home
RUN chmod +x /home/configure_redis.sh

CMD /home/configure_redis.sh