#!/bin/sh
envsubst '${MINIKUBE_IP}' < /tmp/vsftpd.conf > /etc/vsftpd/vsftpd.conf
# screen -dmS telegraf telegraf
vsftpd /etc/vsftpd/vsftpd.conf