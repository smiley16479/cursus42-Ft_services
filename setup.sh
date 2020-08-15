#!/bin/sh
#sudo usermod -aG docker $(whoami) && newgrp docker 
minikube start --driver=docker

# see what changes would be made, returns nonzero returncode if different
#_fait pour installer metallb https://metallb.universe.tf/installation/
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system

# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

#To install MetalLB, apply the manifest:
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

docker build ./srcs/FTPS/ -t sftp/my_image >&2

kubectl apply -f ./srcs/Nginx/nginx-deployment.yaml
kubectl apply -f ./srcs/FTPS/ftps-deployment.yaml
kubectl apply -f metallb-configmap.yaml

