#Ajoute l'ip, créer un user et démare vsftpd
sed s/hostname/$MINIKUBE_IP/g vsftpd.conf > /etc/vsftpd/vsftpd.conf
echo -e "pass\npass\n" | adduser ftps
vsftpd /etc/vsftpd/vsftpd.conf&
#Démarre télégraf
telegraf