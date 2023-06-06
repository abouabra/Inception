FROM debian:bullseye

RUN apt-get update && apt-get install -y vim curl python3

COPY ./website/  /var/www/html/

WORKDIR /var/www/html/

CMD python3 -m http.server 8080

# CMD sleep 99999999