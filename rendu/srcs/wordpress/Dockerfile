FROM telegraf

RUN apk update 
RUN apk add nginx vim gettext mysql-client curl php7-common php7-fpm php7-opcache php7-gd \
	php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli \
	php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
	php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom openssl
#Set the database and hostname in telegraf for influxdb
RUN sed -i -e "s/TMPDB/wordpress/g" -e "s/TMPHN/wordpress/" /etc/telegraf/telegraf.conf
#Download cli wordpress utility
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp-cli && chmod 777 /usr/bin/wp-cli
RUN adduser -D -g www www

#ssl for nginx
RUN echo -e "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes \
-out /etc/ssl/private/nginx.cert.pem -keyout /etc/ssl/private/nginx.key.pem
RUN chmod 777 /etc/ssl/private/nginx.cert.pem /etc/ssl/private/nginx.key.pem

COPY --chown=www:www srcs/wordpress/ /wordpress
COPY srcs/nginx.conf /etc/nginx/
COPY srcs/start.sh /start.sh

CMD ["/bin/sh", "./start.sh"]
EXPOSE 5050
