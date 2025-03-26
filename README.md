#Репозиторий для проектной работы

Система состоит из 4 серверов на базе ubuntu 22.04

1.Nginx, Mysql(master), filebeat, prometheus-node-exporter 192.168.0.7

2.Apache2 , Mysql(slave), prometheus-node-exporter 192.168.0.9

3.Apache2 , prometheus-node-exporter 192.168.0.8

4.Prometheus + grafana , elasticsearch + kibana + logstash , prometheus-node-exporter 192.168.0.10

Клонируем репозиторий на каждом сервере с помощью скрипта 

wget https://raw.githubusercontent.com/rudowi/zashita/refs/heads/main/gitsetup.sh

Настраиваем сервер 1 
bash /root/yee/projects/serv_p1.sh

Настраиваем сервер 2 
bash /root/yee/projects/serv_p2.sh

Настраиваем сервер 3
bash /root/yee/projects/serv_p3.sh

Настраиваем сервер 4
bash /root/yee/projects/serv_p4.sh


Для потабличного бекапа со slave , выполняем скрипт

bash /root/yee/projects/backupmysql.sh


