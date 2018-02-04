FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install vim git wget apache2 php mariadb-server libapache2-mod-php php-mysql unzip
WORKDIR /var/www/html/
RUN wget https://dl.gogs.io/0.11.29/linux_amd64.zip
RUN unzip linux_amd64.zip
RUN chown -R www-data:www-data gogs/
RUN echo "<VirtualHost *:80>\
ServerAdmin admin@gogs.com\
DocumentRoot /var/www/html/gogs/\
ServerName gogs.com\
ServerAlias www.gogs.com\
<Directory /var/www/html/gogs/>\
Options FollowSymLinks\
AllowOverride All\
Order allow,deny\
allow from all\
</Directory>\
ErrorLog /var/log/apache2/gogs.com-error_log\
CustomLog /var/log/apache2/gogs.com-access_log common\
</VirtualHost>" > /etc/apache2/sites-available/gogs.conf

RUN a2enmod rewrite
RUN a2ensite gogs.conf

WORKDIR /var/www/html/gogs/
RUN mkdir -p custom/conf
RUN echo '[server]\nSTART_SSH_SERVER = true\nSSH_PORT = 2222\n' > custom/conf/app.ini
RUN adduser --disabled-login --gecos 'Gogs' git
RUN chown -R git:git .
RUN /etc/init.d/mysql start && mysql < scripts/mysql.sql && mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='root';"
#RUN sed -i 's|try_files $uri $uri/ =404;|proxy_pass http://localhost:3000;\n\t\tproxy_redirect http://localhost:3000/ http://$http_host/;|' \/etc/nginx/sites-available/default


RUN su root

ENTRYPOINT /etc/init.d/mysql start && su root -c "./gogs web"