#! /bin/bash

# complier le serveur avec docker build -t <nom/nom> .
# pour lancer le serveur
# docker run  --name ts3 -p 9987:9987/udp -p 10011:10011 -ti -p  30033:30033 <nom/nom>

sh /teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh
