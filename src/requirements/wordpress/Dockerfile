FROM debian:bullseye

RUN apt update && apt install -y vim php-fpm wget

WORKDIR /var/www/html/

COPY ./tools/install_wordpress.sh /bin/
RUN chmod +x /bin/install_wordpress.sh
RUN ./bin/install_wordpress.sh

WORKDIR /var/www/html/

#CMD nginx -g "daemon off;"

#docker volume create --driver local --opt type=none --opt device=/home/abouabra/data/wordpress --opt o=bind wordpress


# apt install -y php-fpm wget
# service php7.4-fpm start
# service php7.4-fpm status
