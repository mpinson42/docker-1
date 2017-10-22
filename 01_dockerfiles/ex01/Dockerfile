FROM debian
MAINTAINER mpinson <mpinson@student.42.fr>
RUN apt-get update
RUN adduser teamspeak
RUN su  teamspeak
RUN cd /home/teamspeak
RUN apt-get  -y install wget
RUN wget http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN tar -zxvf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN rm teamspeak3-server_linux-amd64-3.0.11.2.tar.gz
RUN cd teamspeak3-server_linux-amd64
RUN chmod -R 777 teamspeak3-server_linux-amd64
RUN ./teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh
RUN ls -l /teamspeak3-server_linux-amd64/./.
RUN sleep 100
