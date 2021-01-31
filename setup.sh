#!/bin/bash
#set -ux	 "-e pour exit lors d'un code d'erreur -u pour stoper l'exec lors de l'utilisation d'une variable non existante -x pour afficher la commande éxécutée"

pods="nginx" #telegraf nginx wordpress mysql phpmyadmin ftps influxDB grafana"
addons="ingress dashboard" # metrics-server default-storageclass storage-provisioner

setup_env()
{
	if [ `uname` = Linux ]; then
		## use docker without sudo as the 42's VM doesn't allow it by default
		## check minikube version=v11
		#	sudo usermod -aG docker $(whoami) && newgrp docker 

		## start minikube with personnal settings (docker_driver)
		minikube start --driver=docker --memory=2200mb 
		for ADDON in ${addons[@]}; do
			minikube addons enable "${ADDON}"
			done
	
		## install metallb https://metallb.universe.tf/installation/
		## see what changes would be made, returns nonzero returncode if different
		kubectl get configmap kube-proxy -n kube-system -o yaml | \
		sed -e "s/strictARP: false/strictARP: true/" | \
		kubectl diff -f - -n kube-system
		
		## actually apply the changes, returns nonzero returncode on errors only
		kubectl get configmap kube-proxy -n kube-system -o yaml | \
		sed -e "s/strictARP: false/strictARP: true/" | \
		kubectl apply -f - -n kube-system
		
		## To install MetalLB, apply the manifest:
		kubectl apply -f \
		https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
		kubectl apply -f \
		https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
		## On first install only
		kubectl create secret generic -n metallb-system memberlist  \
		--from-literal=secretkey="$(openssl rand -base64 128)"
		MINIKUBE_IP=$(minikube ip)
		echo $MINIKUBE_IP
	else
		echo enter personalysed settings
		exit 1
	fi
}

build_images()
{
	## Run locally build docker images for kubernetes
	eval $(minikube -p minikube docker-env)
	for container in $@
	do
		docker build -t$container/at srcs/$container
		echo $container builded 🥰  ✓
	done
}

## demarre minikube et ajuste son environnement
setup_env


## Déploiement du tableau de bord
## L'interface utilisateur du tableau de bord n'est pas déployée par défaut. Pour le déployer, exécutez la commande suivante:
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml
## Pour accéder au tableau de bord
#kubectl proxy

# docker build ./srcs/ftps/ -t sftp/my_image >&2
build_images $pods


kubectl apply -f ./srcs/nginx/nginx-deployment.yaml
# kubectl apply -f ./srcs/ftps/ftps-deployment.yaml
# config of metallb from its configmap
kubectl apply -f metallb-configmap.yaml

