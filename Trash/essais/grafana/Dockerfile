FROM telegraf
MAINTAINER adtheus@42

#Set the proper database for influxdb
RUN sed -i -e "s/TMPDB/grafana/g" -e "s/TMPHN/grafana/" /etc/telegraf/telegraf.conf

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update && apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache #apk add grafana@testing


#Copy the datasources (one database for each container) and the dashboards, previously downloaded from the site
# COPY srcs/datasource.yaml usr/share/grafana/conf/provisioning/datasources/
# COPY srcs/dashboards/* usr/share/grafana/conf/provisioning/dashboards/

RUN	mkdir -p /usr/share/grafana/data/
COPY srcs/grafana.db  /usr/share/grafana/data/

#Launches telegraf and grafana server
CMD sh -c telegraf & sh -c "grafana-server --homepath /usr/share/grafana/"
