FROM debian
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y mysql-server mysql-client
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

RUN /etc/init.d/mysql start
RUN mysql -e "CREATE DATABASE menagerie;"

ENTRYPOINT /etc/init.d/mysql start && ./gogs web
