FROM debian:bullseye

RUN apt-get update && apt-get install -y vim wget

RUN wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --non-interactive && \
    echo "    daemonize = no" >> /etc/netdata/netdata.conf
    # && netdata -t 1

CMD sleep 99999999