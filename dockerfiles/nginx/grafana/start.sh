#!/bin/bash

HTPASSWD_USER=${HTPASSWD_USER:-user}
HTPASSWD_PASSWORD=${HTPASSWD_PASSWORD:-password}

htpasswd -b -c /etc/nginx/grafana.htpasswd $HTPASSWD_USER $HTPASSWD_PASSWORD

sed -i -e "s/graphite_db_user/$GRAPHITE_DB_USER/" \
       -e "s/graphite_db_password/$GRAPHITE_DB_PASSWORD/" \
       -e "s/grafana_db_user/$GRAFANA_DB_USER/" \
       -e "s/grafana_db_password/$GRAFANA_DB_PASSWORD/" \
/srv/www/config.js

sed -i -e "s/influxdb_ip/$INFLUXDB_IP/" /etc/nginx/sites-enabled/default

nginx
