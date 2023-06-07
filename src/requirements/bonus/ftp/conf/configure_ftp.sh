!/bin/sh


service vsftpd start

sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

sleep 9999999999