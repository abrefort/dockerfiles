FROM abrefort/logstash
MAINTAINER Adrien Bréfort <adrien@padisha.org>

USER logstash
WORKDIR /home/logstash

ADD syslog.conf /home/logstash/syslog.conf

CMD []
ENTRYPOINT ["bin/logstash","agent","-f","syslog.conf"]
