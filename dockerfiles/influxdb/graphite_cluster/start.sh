#!/bin/sh

if ! [ -z $SEED_SERVER_DOCKER ]
then
    sed -i -e "s/#SEED_SERVER_DOCKER/seed-servers = [\"$SEED_SERVER_DOCKER\"]/" config.toml
fi

./influxdb -config="config.toml" -hostname="$CLUSTER_IP"
