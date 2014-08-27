FROM abrefort/tf2:base
MAINTAINER Adrien Bréfort <adrien@padisha.org>

ADD server.cfg /home/steam/tf2_server/tf/cfg/server.cfg
CMD []
ENTRYPOINT ["./srcds_linux","-steam_dir","/home/steam","-steamcmd_script","/home/steam/steamcmd.sh","-game","tf","+rcon_password","ihzdaozdauhrpaw","+map","cp_dustbowl"]
