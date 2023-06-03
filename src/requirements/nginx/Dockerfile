FROM debian:bullseye

RUN apt update && apt install -y nginx vim openssl && cd /home/ && openssl genpkey -algorithm RSA -out private.key && \
    openssl req -new -key private.key -out csr.csr -subj "/C=MA/ST=CASA/L=Casa-Settat/O=1337/CN=abouabra.42.fr" && \
    openssl req -x509 -sha256 -days 365 -key private.key -in csr.csr -out certificate.crt && \
    openssl x509 -text -noout -in certificate.crt  && bash && \
    sed -i 's/listen 80 default_server;/#listen 80 default_server;/' /etc/nginx/sites-available/default && \
    sed -i 's/listen \[::\]:80 default_server;/#listen [::]:80 default_server;/' /etc/nginx/sites-available/default && \
    sed -i 's/# listen 443 ssl default_server;/listen 443 ssl default_server;/' /etc/nginx/sites-available/default && \
    sed -i 's/# listen \[::\]:443 ssl default_server;/listen [::]:443 ssl default_server;\n\tssl_certificate \/home\/certificate.crt;\n\tssl_certificate_key \/home\/private.key;\n\tssl_protocols TLSv1.2 TLSv1.3;\n/' /etc/nginx/sites-available/default

CMD nginx -g "daemon off;"