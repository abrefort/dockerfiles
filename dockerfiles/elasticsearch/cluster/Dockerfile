FROM abrefort/elasticsearch
MAINTAINER Adrien Bréfort <adrien@padisha.org>

EXPOSE 9200
EXPOSE 9300

USER root
ADD start.sh /home/elasticsearch/start.sh
RUN chown elasticsearch: /home/elasticsearch/start.sh
RUN chmod u+x /home/elasticsearch/start.sh

USER elasticsearch
WORKDIR /home/elasticsearch

CMD []
ENTRYPOINT ["./start.sh"]
