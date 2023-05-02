#! /bin/bash
echo -e "deb http://mirror.yandex.ru/debian bullseye main \ndeb-src http://mirror.yandex.ru/debian bullseye main \ndeb http://mirror.yandex.ru/debian bullseye-updates main \ndeb-src http://mirror.yandex.ru/debian bullseye-updates main \ndeb https://mirror.yandex.ru/debian-security bullseye-security main \ndeb-src https://mirror.yandex.ru/debian-security bullseye-security main" > /etc/apt/sources.list
apt update
systemctl restart networking.service
echo -e "auto lo \niface lo inet loopback \nauto eth0 \niface eth0 inet dhcp \n\tpost-up /usr/sbin/update-hostname-from-ip \n\tpost-up /usr/share/debian-edu-config/tools/update-proxy-from-wpad \nauto eth1 \niface eth1 inet static \naddress 192.168.200.100 \nnetmask 255.255.255.0 \n" > /etc/network/interfaces
hostnamectl set-hostname WEB-L.demo.wsr
apt install -y mariadb nginx

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftp.pem -out /etc/ssl/private/vsftpd.pem

systemctl restart networking

