!/bin/sh


service vsftpd start

sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

mkdir /var/ftp_home

useradd ${FTP_USER}
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

chown ${FTP_USER}:${FTP_USER} /var/ftp_home

usermod -d /var/ftp_home/ ${FTP_USER}


sleep 9999999999