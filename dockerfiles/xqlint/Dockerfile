FROM ubuntu:18.04
MAINTAINER Adrien Bréfort <adrien@padisha.org>

RUN apt-get update && \
    apt-get install -y -q nodejs npm && \
    npm install xqlint -g && \
    apt-get purge -y -q npm && \
    apt-get autoremove -y -q && \
    apt-get clean -y -q && \
    rm -rf /var/lib/apt/lists/*
