FROM debian:bullseye

RUN apt update && apt install -y nginx

CMD service nginx start && nginx -g daemon off;