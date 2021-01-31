FROM telegraf
ENV CERTIF=/etc/ssl/certs/nginx-selfsigned.crt
ENV CERTIF_KEY=/etc/ssl/private/nginx-selfsigned.key

RUN apk update && apk add nginx openssl

#telegraf
RUN sed -i -e "s/TMPDB/nginx/g" -e "s/TMPHN/nginx/" /etc/telegraf/telegraf.conf

#Nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY srcs/nginx.conf /etc/nginx/

#Create certifs
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" \
	-addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout ${CERTIF_KEY} -out ${CERTIF}
RUN sed -i -e 's@CERTIF_KEY@'$CERTIF_KEY'@' /etc/nginx/nginx.conf
RUN sed -i -e 's@CERTIF@'$CERTIF'@' /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx
RUN adduser -D -g www www
RUN echo "www:www" | chpasswd

RUN mkdir /www
COPY srcs/index.html /www/
RUN chown -R www:www /www/
RUN chmod -R 755 /www/

COPY srcs/start.sh /
CMD ["/bin/sh", "./start.sh"]