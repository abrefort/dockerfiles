#!/bin/bash

sed -i -e "s/graphite_db_user/$GRAPHITE_DB_USER/" \
       -e "s/graphite_db_password/$GRAPHITE_DB_PASSWORD/" \
       -e "s/grafana_db_user/$GRAFANA_DB_USER/" \
       -e "s/grafana_db_password/$GRAFANA_DB_PASSWORD/" \
/srv/www/config.js

nginx
