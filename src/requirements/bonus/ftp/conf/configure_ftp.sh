!/bin/sh


service vsftpd start

sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

mkdir /var/ftp_home

useradd ${FTP_USER}

chown ${FTP_USER}:${FTP_USER} /var/ftp_home

usermod -d /var/ftp_home/ ${FTP_USER}

echo -e "${FTP_PASSWORD}\n${FTP_PASSWORD}" | passwd ${FTP_USER}

sleep 9999999999