FROM debian:bullseye

RUN apt-get update && apt-get install -y vim php-fpm wget php-cgi php-mysql curl redis-server php-redis

RUN mkdir /run/php

COPY ./tools/install_wordpress.sh /home
RUN chmod +x /home/install_wordpress.sh

CMD /home/install_wordpress.sh