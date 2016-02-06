FROM ubuntu:15.10
MAINTAINER adrien@padisha.org

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y                                   \
            -o Dpkg::Options::="--force-confdef" \
            -o Dpkg::Options::="--force-confold" \
            install                              \
            git python-pip
RUN pip install sphinx

RUN groupadd -g 2000 sphinx-builder
RUN useradd -u 2000 -g 2000 -ms /bin/bash sphinx-builder
USER sphinx-builder
WORKDIR /home/sphinx-builder

ENTRYPOINT /bin/bash
