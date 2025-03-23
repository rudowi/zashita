#!/bin/bash

#Установка prometheus
echo "Установка prometheus"
apt install -y prometheus
systemctl enable --now prometheus-node-exporter
cp -r ~/yee/projects/Configs/serv4/prometheus/prometheus.yml /etc/prometheus/
systemctl restart prometheus
echo "prometheus установлен"

#Установка grafana
echo "Установка grafana_11.4.0_amd64"
apt install -y adduser libfontconfig1
apt install -y musl
dpkg -i /home/yee/grafana_11.4.0_amd64.deb
systemctl daemon-reload
systemctl enable --now grafana-server
echo "grafana_11.4.0_amd64 установлен"

#Установка ELK
#Установка ES
echo "Установка elasticsearch_8.9.1_amd64"
dpkg -i /home/yee/elasticsearch_8.9.1_amd64-224190-ed0378.deb
#Память+конфиги
cp -r ~/yee/projects/Configs/serv4/elasticsearch/* /etc/elasticsearch/
systemctl daemon-reload
systemctl enable --now elasticsearch.service
echo "elasticsearch_8.9.1_amd64 установлен"

#Установка kibana
echo "Установка kibana_8.9.1_amd64"
dpkg -i /home/yee/kibana_8.9.1_amd64-224190-939c28.deb
systemctl daemon-reload
systemctl enable --now kibana.service
cp ~/yee/projects/Configs/serv4/kibana/kibana.yml /etc/kibana/
systemctl restart kibana
echo "kibana_8.9.1_amd64 установлен"

#Установка logstash
echo "Установка logstash_8.9.1_amd64"
dpkg -i /home/yee/logstash_8.9.1_amd64-224190-d5e2e9.deb
systemctl enable --now logstash.service
cp -r ~/yee/projects/Configs/serv4/logstash/* /etc/logstash/
systemctl restart logstash.service
echo "logstash_8.9.1_amd64 установлен"
