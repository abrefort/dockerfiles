FROM abrefort/logstash
MAINTAINER Adrien Bréfort <adrien@padisha.org>

USER logstash
WORKDIR /home/logstash

ADD collectd.conf /home/logstash/collectd.conf

CMD []
ENTRYPOINT ["bin/logstash","agent","-f","collectd.conf"]
