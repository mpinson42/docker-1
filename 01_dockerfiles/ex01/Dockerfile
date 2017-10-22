FROM debian
MAINTAINER mpinson <mpinson@student.42.fr>
RUN apt-get update
ADD script.sh /usr/bin/script.sh
RUN chmod 755 /usr/bin/script.sh
RUN apt-get  -y install wget
RUN wget http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN tar -zxvf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN chmod -R 777 teamspeak3-server_linux-amd64
RUN ls -la /teamspeak3-server_linux-amd64
ENTRYPOINT ["script.sh"]
#RUN sh /teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh
