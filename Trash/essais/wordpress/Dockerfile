FROM telegraf

MAINTAINER adtheus@42
ENV DB_NAME=wordpress
ENV DB_USER=mysql
ENV DB_PASS=pass
ENV AUTHOR=adtheus@42

RUN apk update 
RUN apk add nginx vim gettext mysql-client curl php7-common php7-fpm php7-opcache php7-gd \
	php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli \
	php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
	php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# ajout pour tester de mettre le serveur myslq sur le meme container
RUN apk add mysql 

RUN sed -i -e "s/TMPDB/wordpress/g" -e "s/TMPHN/wordpress/" /etc/telegraf/telegraf.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp-cli && chmod 777 /usr/bin/wp-cli
RUN adduser -D -g www www
#RUN mkdir -p /etc/nginx/sites-availables  && mkdir -p /etc/nginx/sites-enabled 

COPY srcs/wordpress/ /wordpress
COPY srcs/nginx.conf /etc/nginx/
#COPY srcs/wp-config.php /tmp/wp-config.php
COPY srcs/start.sh /start.sh
RUN sed "s/minikube_ip/$MINIKUBE_IP/g" /start.sh

RUN chown -R www:www /wordpress
#RUN chmod 777 /wordpress
RUN chmod u+x /start.sh
#ENTRYPOINT [ "nginx" ] 
# CMD screen -dmS telegraf telegraf && /bin/sh ./start.sh 
CMD ["/bin/sh", "./start.sh"]
EXPOSE 5050
