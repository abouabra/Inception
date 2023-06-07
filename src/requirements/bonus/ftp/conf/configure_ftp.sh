!/bin/sh

service vsftpd start

sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

mkdir -p /var/ftp_home

useradd ${FTP_USER}
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

chown ${FTP_USER}:${FTP_USER} /var/ftp_home

usermod -d /var/ftp_home/ ${FTP_USER}

chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

vsftpd -D