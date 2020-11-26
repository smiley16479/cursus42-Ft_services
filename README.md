# cursus42-Ft_services

##acquerir les differents namespace
kubectl get namespace 
##decrire les configmap d'un namespace
kubectl describe configmap -n metallb-system
##consulter les explications concernant une ressource:
kubectl explain pod
##acquerir l'ip du cluster
kubectl get node -o=custom-columns='DATA:status.addresses[0].address'
##entrer ds un des pod
kubectl exec -it ftps-deployment-78dfb56956-bn8fg -- /bin/bash
https://linuxconfig.org/how-to-setup-sftp-server-on-ubuntu-18-04-bionic-beaver-with-vsftpd https://kustomize.io/


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