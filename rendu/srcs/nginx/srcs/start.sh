sed -i -e 's@MINIKUBE_IP@'$MINIKUBE_IP'@' /etc/nginx/nginx.conf
#Demarre Nginx & télégraf
nginx -g "daemon on;"
telegraf