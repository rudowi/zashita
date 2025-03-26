#!/bin/bash

#Установка nginx, копирование конфигов
echo "Установка nginx"
apt install -y nginx
systemctl enable nginx.service
cp -r /root/yee/projects/Configs/serv1/nginx* /etc/nginx/
cp -r /root/yee/projects/Configs/serv1/nginx/conf.d/* /etc/nginx/conf.d/
systemctl restart nginx.service
echo "nginx установлен"

#Установка prometheus-node-exporter
echo "Установка prometheus-node-exporter"
apt install -y prometheus-node-exporter
systemctl enable --now prometheus-node-exporter
echo "prometheus-node-exporter установлен"

#Установка filebeat_8.9.1
echo "Установка filebeat_8.9.1_amd64"
dpkg -i /home/yee/filebeat_8.9.1_amd64-224190-507082.deb
systemctl enable filebeat.service
cp ~/yee/projects/Configs/serv1/filebeat/filebeat.yml /etc/filebeat/
systemctl restart filebeat
echo "filebeat_8.9.1_amd64 установлен"

#Установка и настройка MySQL
"Установка mysql-server-8.0"
apt install -y mysql-server-8.0
systemctl start mysql
#mysql_secure_installation
cp ~/yee/projects/Configs/serv1/mysql/mysql.cnf /etc/mysql/mysql.conf.d/
systemctl restart mysql
mysql -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY '11';"
mysql -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%';"
echo "mysql-server-8.0 установлен"
