FROM debian:wheezy
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# create influxdb user
RUN useradd -m influxdb

USER influxdb
WORKDIR /home/influxdb
RUN mkdir -p /home/influxdb/data/raft /home/influxdb/data/db /home/influxdb/data/wal

VOLUME /home/influxdb/data

CMD []
ENTRYPOINT ["/bin/bash"]
