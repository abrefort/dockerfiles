FROM debian:wheezy
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# install java
RUN apt-get update && apt-get install -y -q wget openjdk-7-jre-headless

# create logstash user
RUN useradd -m logstash

# install logstash
EXPOSE 25826/udp

USER logstash
WORKDIR /home/logstash

RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O - | tar --strip 1 -x -z -f -
CMD []
ENTRYPOINT ["/bin/bash"]
