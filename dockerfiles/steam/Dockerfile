FROM debian:wheezy
MAINTAINER Adrien Bréfort <adrien@padisha.org>

# install wget
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y -q wget ia32-libs

# create steam user
RUN useradd -m steam

# install steam
USER steam
WORKDIR /home/steam
RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz -O - | tar -xzf -
