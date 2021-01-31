FROM telegraf
MAINTAINER adtheus

COPY srcs/vsftpd.conf /
COPY srcs/start.sh /
RUN chmod u+x start.sh
RUN apk update && apk add vsftpd openssl
RUN echo -e "\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes \
-out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem
RUN sed -i -e "s/telegraf/ftps/g" /etc/telegraf/telegraf.conf
RUN sed -i -e "s/TMPDB/ftps/g" -e "s/TMPHN/ftps/" /etc/telegraf/telegraf.conf
CMD ["/bin/sh", "./start.sh"]