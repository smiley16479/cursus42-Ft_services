# cursus42-Ft_services

##acquerir les differents namespace
kubectl get namespace 
##decrire les configmap d'un namespace
kubectl describe configmap -n metallb-system
##consulter les explications concernant une ressource:
kubectl explain pod 
#ou 
kubectl explain pods.spec.containers
##acquerir l'ip du cluster
kubectl get node -o=custom-columns='DATA:status.addresses[0].address'
##entrer ds un des pod
kubectl exec -it ftps-deployment-78dfb56956-bn8fg -- /bin/bash
https://linuxconfig.org/how-to-setup-sftp-server-on-ubuntu-18-04-bionic-beaver-with-vsftpd https://kustomize.io/
##Acquérir l'url d'un service
minikube service "nom_du_service" --url

#   Minikube documentation page
## https://minikube.sigs.k8s.io/docs/start/

to get information about deployed applications and their environments. The most common operations can be done with the following kubectl commands:

    kubectl get - list resources
    kubectl describe - show detailed information about a resource
    kubectl logs - print the logs from a container in a pod
    kubectl exec - execute a command on a container in a pod


    kubectl get deployments

The output should be similar to:

NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
kubernetes-bootcamp   1/1     1            1           11m

This shows:

    NAME lists the names of the Deployments in the cluster.
    READY shows the ratio of CURRENT/DESIRED replicas
    UP-TO-DATE displays the number of replicas that have been updated to achieve the desired state.
    AVAILABLE displays how many replicas of the application are available to your users.
    AGE displays the amount of time that the application has been running.


Commands utiles :
sudo systemctl is-active docker
#redirect error and output messages to /dev/null
command > /dev/null 2>&1 OR  command &>/dev/null
#copy file to/from container
docker cp foo.txt mycontainer:/foo.txt

# Ressources
Intro to k8:
https://www.youtube.com/watch?v=uyiDNcSmwFw
Complete course on kubernetes :
https://www.youtube.com/watch?v=qmDzcu5uY1I
https://www.youtube.com/watch?v=X48VuDVv0do
Yaml file explanation: 
https://blog.wescale.fr/2018/08/16/kubernetes-comment-ecrire-un-deployment/
How to run local images on K8:
https://medium.com/swlh/how-to-run-locally-built-docker-images-in-kubernetes-b28fbc32cc1d 
Difference between port Targetport et Nodeport 
https://www.bmc.com/blogs/kubernetes-port-targetport-nodeport/
How to setup Grafana influxdb and telegraf:
https://sbcode.net/grafana/install-telegraf-agent/
