sed -i -e 's@MINIKUBE_IP@'$MINIKUBE_IP'@' /etc/nginx/nginx.conf
#/usr/sbin/sshd
nginx -g "daemon on;"
RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}hello from nginx container ${NC}\n"
#Demarre télégraf
telegraf