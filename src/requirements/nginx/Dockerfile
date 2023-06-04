FROM debian:bullseye

RUN apt update && apt install -y nginx vim openssl && mkdir -p /etc/nginx/ssl/

WORKDIR /etc/nginx/ssl/

RUN openssl genpkey -algorithm RSA -out private.key && \
    openssl req -new -key private.key -out csr.csr -subj "/C=MA/ST=CASA/L=Casa-Settat/O=1337/CN=abouabra.42.fr" && \
    openssl req -x509 -sha256 -days 365 -key private.key -in csr.csr -out certificate.crt && \
    openssl x509 -text -noout -in certificate.crt

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
CMD nginx -g "daemon off;"

#to build the image: docker build --no-cache -t nginx:nginx .
#to run the container: docker run -d -p 443:443 nginx:nginx
