FROM adrien/nginx
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# install kibana
RUN apt-get update
RUN apt-get install -q -y wget ca-certificates

WORKDIR /srv/www
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-3.1.0.tar.gz -O - | tar --strip 1 -x -z -f -

ADD config.js /srv/www/config.js
ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
ADD kibana.htpasswd /etc/nginx/kibana.htpasswd

CMD []
ENTRYPOINT ["nginx"]
