FROM debian:bullseye

RUN apt-get update && apt-get install -y vim php-fpm wget php-cgi php-mysql bash

RUN mkdir /run/php

COPY ./tools/install_wordpress.sh /home
RUN chmod +x /home/install_wordpress.sh
RUN /home/install_wordpress.sh

CMD sleep 9000000
# CMD /usr/sbin/php-fpm7.4 -F


# apt install -y php-fpm wget
# service php7.4-fpm start
# service php7.4-fpm status
