FROM debian:wheezy
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# install java
RUN apt-get update && apt-get install -y -q wget openjdk-7-jre-headless

# create elasticsearch user
RUN useradd -m elasticsearch

# install elasticsearch
EXPOSE 9200
EXPOSE 9300

USER elasticsearch
WORKDIR /home/elasticsearch

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz -O - | tar --strip 1 -x -z -f -
CMD []
ENTRYPOINT ["bin/elasticsearch"]
