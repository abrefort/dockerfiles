#!/bin/sh

while ! ip addr | grep eth1
do
    sleep 1
done

bin/elasticsearch -Des.network.publish_host=$CLUSTER_IP -Des.discovery.zen.ping.multicast.address=$CLUSTER_IP
