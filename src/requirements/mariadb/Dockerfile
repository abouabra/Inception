FROM debian:bullseye

RUN apt-get update && apt-get install -y vim mariadb-server php-mysql

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/install_mariadb.sh /home
RUN chmod +x /home/install_mariadb.sh

CMD /home/install_mariadb.sh