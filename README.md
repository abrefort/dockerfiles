# Basic ELK with syslog udp input

**Note** : Docker should be started with --icc=false.

Setup elastic search data volume containers :

```bash
sudo docker run --name syslog_es1_data -d abrefort/elasticsearch:data
sudo docker run --name syslog_es2_data -d abrefort/elasticsearch:data
```

Start elasticsearch containers and connect them to br1 :

```bash
sudo docker run -d -e "CLUSTER_IP=10.0.0.1" --name syslog_es1 --volumes-from syslog_es1_data  abrefort/elasticsearch:cluster
sudo docker run -d -e "CLUSTER_IP=10.0.0.2" --name syslog_es2 --volumes-from syslog_es2_data  abrefort/elasticsearch:cluster

sudo pipework br1 syslog_es1 10.0.0.1/24
sudo pipework br1 syslog_es2 10.0.0.2/24
```

Start logstash and kibana :

```bash
sudo docker run -d --name syslog_logstash1 --link syslog_es1:es -p 127.0.0.1:10514:10514/udp abrefort/logstash:syslog
sudo docker run -d --name syslog_kibana1 -e "HTPASSWD_USER=user" -e "HTPASSWD_PASSWORD=password" --link syslog_es2:es -p 81:80 abrefort/nginx:kibana
```

# ELK for collectd

**Note** : Docker should be started with --icc=false.

Setup elastic search data volume containers :

```bash
sudo docker run --name metro_es1_data -d abrefort/elasticsearch:data
sudo docker run --name metro_es2_data -d abrefort/elasticsearch:data
```

Start elasticsearch containers and connect them to br1 :

```bash
sudo docker run -d -e "CLUSTER_IP=10.0.0.1" --name metro_es1 --volumes-from metro_es1_data  abrefort/elasticsearch:cluster
sudo docker run -d -e "CLUSTER_IP=10.0.0.2" --name metro_es2 --volumes-from metro_es2_data  abrefort/elasticsearch:cluster

sudo pipework br1 metro_es1 10.0.0.1/24
sudo pipework br1 metro_es2 10.0.0.2/24
```

Start logstash and kibana :

```bash
sudo docker run -d --name metro_logstash1 --link metro_es1:es -p 127.0.0.1:25826:25826/udp abrefort/logstash:collectd
sudo docker run -d --name metro_kibana1 -e "HTPASSWD_USER=user" -e "HTPASSWD_PASSWORD=password" --link metro_es2:es -p 81:80 abrefort/nginx:kibana
```

# InfluxDB/Grafana for collectd

**Note** : Docker should be started with --icc=false.

Setup influxdb data volume containers :

```bash
sudo docker run --name metro_influxdb1_data -d abrefort/influxdb:data
sudo docker run --name metro_influxdb2_data -d abrefort/influxdb:data
```

Start influxdb containers and connect them to br2 :

```bash
sudo docker run -d -e "CLUSTER_IP=10.0.0.1" --name metro_influxdb1 --volumes-from metro_influxdb1_data -p 8083:8083 -p 8086:8086 -p 127.0.0.1:2003:2003 abrefort/influxdb:graphite_cluster
sudo docker run -d -e "CLUSTER_IP=10.0.0.2" -e "SEED_SERVER_DOCKER=10.0.0.1:8090" --name metro_influxdb2 --volumes-from metro_influxdb2_data abrefort/influxdb:graphite_cluster

sudo pipework br2 metro_influxdb1 10.0.0.1/24
sudo pipework br2 metro_influxdb2 10.0.0.2/24
```

**Note** : InfluxDB root password should be modified and users and databases (graphite and grafana) configured by using metro_influxdb1 admin interface. (http://myhost:8086)

Start grafana :

```bash
sudo docker run -d --name metro_grafana1 --link metro_influxdb2:influxdb -p 81:80 -e "GRAPHITE_DB_USER=user" -e "GRAFANA_DB_USER=user" -e "GRAPHITE_DB_PASSWORD=password" -e "GRAFANA_DB_PASSWORD=password" -e "HTPASSWD_USER=user" -e "HTPASSWD_PASSWORD=password" abrefort/nginx:grafana
```
