FROM debian:bullseye

RUN apt-get update && apt-get install -y vim vsftpd ftp

COPY ./conf/configure_ftp.sh /home
RUN chmod +x /home/configure_ftp.sh

CMD /home/configure_ftp.sh