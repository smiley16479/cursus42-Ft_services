FROM telegraf
MAINTAINER adtheus@42

#Set the database and hostname in telegraf for influxdb
RUN sed -i -e "s/TMPDB/grafana/g" -e "s/TMPHN/grafana/" /etc/telegraf/telegraf.conf
#install grafana
RUN apk update && apk add grafana --no-cache
#--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN	mkdir -p /usr/share/grafana/data/
COPY srcs/grafana.db  /usr/share/grafana/data/

#Launches telegraf and grafana server
CMD sh -c telegraf & sh -c "grafana-server --homepath /usr/share/grafana/"

EXPOSE 3000
