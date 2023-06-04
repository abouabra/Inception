FROM debian:bullseye

RUN apt update && apt install -y vim php-fpm wget php-cgi bash

COPY ./tools/install_wordpress.sh /home
RUN chmod +x /home/install_wordpress.sh
RUN sh /home/install_wordpress.sh
RUN service php7.4-fpm start

#CMD /usr/sbin/php-fpm7.4 -F


# apt install -y php-fpm wget
# service php7.4-fpm start
# service php7.4-fpm status
