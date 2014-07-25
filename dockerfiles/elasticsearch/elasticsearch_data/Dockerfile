FROM debian:wheezy
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# create elasticsearch user
RUN useradd -m elasticsearch

# create volume
USER elasticsearch
WORKDIR /home/elasticsearch
RUN mkdir /home/elasticsearch/data

VOLUME /home/elasticsearch/data

CMD []
ENTRYPOINT ["/bin/bash"]
