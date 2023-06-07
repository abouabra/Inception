FROM debian:bullseye

RUN apt-get update && apt-get install -y vim curl php-fpm wget php-cgi php-mysql 

WORKDIR /home/

RUN mkdir /run/php

RUN curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf 

CMD /usr/sbin/php-fpm7.4 -F