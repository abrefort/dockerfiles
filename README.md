# ELK for collectd

**Note** : Docker should be started with --icc=false.

Setup elastic search data volume containers :

```bash
sudo docker run --name metro_es1_data -d adrien/elasticsearch_data
sudo docker run --name metro_es2_data -d adrien/elasticsearch_data
```

Start elasticsearch containers and connect them to br1 :

```bash
sudo docker run -d -e "CLUSTER_IP=10.0.0.1" --name metro_es1 --volumes-from metro_es1_data  adrien/elasticsearch:cluster
sudo docker run -d -e "CLUSTER_IP=10.0.0.2" --name metro_es2 --volumes-from metro_es2_data  adrien/elasticsearch:cluster

sudo pipework br1 metro_es1 10.0.0.1/24
sudo pipework br1 metro_es2 10.0.0.2/24
```

Start logstash and kibana :

```bash
sudo docker run -d --name metro_logstash1 --link metro_es1:es -p 127.0.0.1:25826:25826/udp adrien/logstash:collectd
sudo docker run -d --name metro_kibana1 --link metro_es2:es -p 81:80 adrien/nginx:kibana
```
