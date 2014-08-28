FROM debian:wheezy
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# install wget
RUN apt-get update
RUN apt-get install -y -q wget ca-certificates

# create influxdb user
RUN useradd -m influxdb

# install influxdb
EXPOSE 8083
EXPOSE 8086
EXPOSE 8090
EXPOSE 8099

USER influxdb
WORKDIR /home/influxdb

RUN wget https://s3.amazonaws.com/influxdb/influxdb-0.7.3.amd64.tar.gz -O - | tar --strip 1 -x -z -f -

CMD []
ENTRYPOINT ["/bin/bash"]
