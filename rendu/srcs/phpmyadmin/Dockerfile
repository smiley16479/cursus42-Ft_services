FROM	telegraf

RUN apk update && apk add nginx mysql mysql-client php7 php7-fpm php7-opcache php7-gd \
		php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip

RUN sed -i -e "s/TMPDB/phpmyadmin/g" -e "s/TMPHN/phpmyadmin/" /etc/telegraf/telegraf.conf

#Nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY srcs/nginx.conf /etc/nginx/
RUN mkdir -p /run/nginx
RUN adduser -D -g www www
RUN chmod -R 777 /var/lib/nginx/
RUN chown -R www:www /var/lib/nginx

RUN mkdir www
COPY srcs/config.inc.php /www

EXPOSE 5000
COPY srcs/start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]
