FROM debian



RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y golang mariadb-server
RUN apt-get install -y mariadb-server
RUN apt-get install -y nginx


RUN mkdir $HOME/local
WORKDIR $HOME/local 
RUN wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
RUN tar -C $home/local -xvzf go1.7.linux-amd64.tar.gz

ENV GOROOT=$HOME/local/go
ENV GOPATH=$HOME/gogs
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
RUN go version

RUN go get -u github.com/gogits/gogs
WORKDIR $GOPATH/src/github.com/gogits/gogs
RUN go build






RUN mkdir -p custom/conf
RUN echo '[server]\nSTART_SSH_SERVER = true\nSSH_PORT = 2222\n' > custom/conf/app.ini

RUN adduser --disabled-login --gecos 'Gogs' git
RUN chown -R git:git .
RUN /etc/init.d/mysql start && mysql < scripts/mysql.sql && mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='root';"
RUN sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;\n\t\tproxy_redirect http://localhost:3000/ http://$http_host/;|' \/etc/nginx/sites-available/default

EXPOSE 2222 80
EXPOSE 3000 80

#ENTRYPOINT /etc/init.d/mysql start && /etc/init.d/nginx start && su git -c "$GOPATH/src/github.com/gogits/gogs/gogs web"





#ENTRYPOINT ./gogs web
