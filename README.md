# cursus42-Ft_services

##acquerir les differents namespace
kubectl get namespace 
##decrire les configmap d'un namespace
kubectl describe configmap -n metallb-system
##consulter les explications concernant une ressource:
kubectl explain pod
##acquerir l'ip du cluster
kubectl get node -o=custom-columns='DATA:status.addresses[0].address'

