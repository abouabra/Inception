FROM debian:bullseye

RUN apt update && apt install -y vim php-fpm wget php-cgi

COPY ./tools/install_wordpress.sh /home
RUN chmod +x /home/install_wordpress.sh && ./home/install_wordpress.sh && service php7.4-fpm start


CMD /usr/sbin/php-fpm7.4 -F

#CMD nginx -g "daemon off;"

#docker volume create --driver local --opt type=none --opt device=/home/abouabra/data/wordpress --opt o=bind wordpress


# apt install -y php-fpm wget
# service php7.4-fpm start
# service php7.4-fpm status
