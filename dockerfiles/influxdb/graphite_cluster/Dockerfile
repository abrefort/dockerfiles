FROM adrien/influxdb
MAINTAINER Adrien Bréfort <adrien@padisha.org>

EXPOSE 8083
EXPOSE 8086

USER root
ADD config.toml /home/influxdb/config.toml
ADD start.sh /home/influxdb/start.sh
RUN chown influxdb: /home/influxdb/start.sh
RUN chmod u+x /home/influxdb/start.sh

USER influxdb
WORKDIR /home/influxdb

CMD []
ENTRYPOINT ["./start.sh"]
