##Utilisé en base pour les autres containers
FROM alpine:latest
MAINTAINER adtheus

## INSTALL TELEGRAF DEPUIS SON REPO OFFICIEL
RUN mkdir -p /etc/telegraf
#RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
#gettext Needed for envsubst
RUN apk update && apk add screen gettext && \
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf


## INSTALL TELEGRAF DEPUIS LE REPO GITHUB AV WGET 
# Installation --> https://github.com/influxdata/influxdata-docker/blob/da900619b14ddbf221e639b5108a7219af8b0bbc/telegraf/1.15/alpine/Dockerfile
#FROM alpine:latest
#
#RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
#RUN apk add --no-cache iputils ca-certificates net-snmp-tools procps lm_sensors tzdata && \
#	update-ca-certificates
#
#ENV TELEGRAF_VERSION 1.15.4
#
#RUN set -ex && \
#	mkdir ~/.gnupg; \
#	echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf; \
#	apk add --no-cache --virtual .build-deps wget gnupg tar && \
#	for key in \
#	05CE15085FC09D18E99EFB22684A14CF2582E0C5 ; \
#	do \
#	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
#	gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
#	gpg --keyserver keyserver.pgp.com --recv-keys "$key" ; \
#	done && \
#	wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz.asc && \
#	wget --no-verbose https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz && \
#	gpg --batch --verify telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz.asc telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz && \
#	mkdir -p /usr/src /etc/telegraf && \
#	tar -C /usr/src -xzf telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz && \
#	mv /usr/src/telegraf*/etc/telegraf/telegraf.conf /etc/telegraf/ && \
#	mkdir /etc/telegraf/telegraf.d && \
#	cp -a /usr/src/telegraf*/usr/bin/telegraf /usr/bin/ && \
#	gpgconf --kill all && \
#	rm -rf *.tar.gz* /usr/src /root/.gnupg && \
#	apk del .build-deps
#EXPOSE 8125/udp 8092/udp 8094
