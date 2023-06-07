FROM debian:bullseye

RUN apt-get update && apt-get install -y vim vsftpd ftp

COPY ./conf/configure_ftp.sh /home
RUN chmod +x /home/install_wordpress.sh

CMD /home/install_wordpress.sh