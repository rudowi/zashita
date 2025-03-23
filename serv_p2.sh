#!/bin/bash

#Установка apache2
echo "Установка apache2"
apt install -y apache2
cp /root/yee/projects/Configs/serv2/apache2/*.conf /etc/apache2/
cp -r /root/yee/projects/Configs/serv2/apache2/sites-* /etc/apache2/
cp -r /root/yee/projects/Configs/serv2/apache2/html /var/www/
systemctl enable --now apache2.service
echo "apache2 установлен"

#Установка prometheus-node-exporter
echo "Установка prometheus-node-exporter"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
echo "prometheus-node-exporter установлен"

#Установка и настройка MySQL
"Установка mysql-server-8.0 (slave)"
apt install -y mysql-server-8.0
systemctl start mysql
#mysql_secure_installation
cp ~/yee/projects/Configs/serv2/mySQL/mysql.cnf /etc/mysql/mysql.conf.d/
systemctl restart mysql
mysql -e "STOP REPLICA;"
mysql -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.0.7', SOURCE_USER='repl', SOURCE_PASSWORD='11', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"
mysql -e "START REPLICA;"

echo "mysql-server-8.0 установлен (slave)"
