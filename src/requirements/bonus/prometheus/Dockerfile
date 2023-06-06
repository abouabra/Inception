FROM debian:bullseye

RUN apt-get update && apt-get install -y vim wget

WORKDIR /home/

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.44.0/prometheus-2.44.0.linux-amd64.tar.gz && \
    tar -xvf prometheus-2.44.0.linux-amd64.tar.gz
# rm prometheus-2.44.0.linux-amd64.tar.gz \
WORKDIR /home/prometheus-2.44.0.linux-amd64/

CMD ./prometheus --config.file=prometheus.yml