FROM debian:bullseye

RUN apt-get update && apt-get install -y vim wget

RUN wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --non-interactive

CMD netdata -t 1 -D