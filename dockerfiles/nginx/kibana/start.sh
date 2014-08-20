#!/bin/bash

HTPASSWD_USER=${HTPASSWD_USER:-user}
HTPASSWD_PASSWORD=${HTPASSWD_PASSWORD:-password}

htpasswd -b -c /etc/nginx/kibana.htpasswd $HTPASSWD_USER $HTPASSWD_PASSWORD

nginx
