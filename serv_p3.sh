#!/bin/bash

#Установка apache2
echo "Установка apache2"
apt install -y apache2
cp /root/yee/projects/Configs/serv3/apache2/*.conf /etc/apache2/
cp -r /root/yee/projects/Configs/serv3/apache2/sites-* /etc/apache2/
cp -r /root/yee/projects/Configs/serv3/apache2/html /var/www/
systemctl enable --now apache2.service
echo "apache2 установлен"

#Установка prometheus-node-exporter
echo "Установка prometheus-node-exporter"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
echo "prometheus-node-exporter установлен"
