FROM adrien/steam
MAINTAINER Adrien Bréfort <adrien@padisha.org>

WORKDIR /home/steam
USER steam
ENV HOME /home/steam
ENV LD_LIBRARY_PATH bin

# install tf2
RUN ./steamcmd.sh +login anonymous +force_install_dir tf2_server +app_update 232250 validate +quit
ADD server.cfg /home/steam/tf2_server/tf/cfg/server.cfg
RUN mkdir -p /home/steam/.steam/sdk32/
RUN ln -s /home/steam/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

# run tf2
EXPOSE 27015 27015/udp
WORKDIR /home/steam/tf2_server
ENTRYPOINT ["./srcds_linux","-steam_dir","/home/steam","-steamcmd_script","/home/steam/steamcmd.sh","-game","tf"]
