##Utilisé en base pour les autres containers
FROM alpine:latest
MAINTAINER adtheus

## INSTALL TELEGRAF DEPUIS SON REPO OFFICIEL
RUN apk update && \
apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf