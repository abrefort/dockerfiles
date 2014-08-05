FROM adrien/nginx
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# install grafana
RUN apt-get update
RUN apt-get install -q -y wget ca-certificates

WORKDIR /srv/www
RUN wget https://grafanarel.s3.amazonaws.com/grafana-1.7.0-rc1.tar.gz -O - | tar --strip 1 -x -z -f -

ADD config.js /srv/www/config.js
ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
ADD grafana.htpasswd /etc/nginx/grafana.htpasswd
ADD start.sh /root/start.sh
RUN chmod u+x /root/start.sh

CMD []
ENTRYPOINT ["/root/start.sh"]
