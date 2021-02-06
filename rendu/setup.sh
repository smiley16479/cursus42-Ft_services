#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo $(date +%M)
start=`date +%s`
pods="influxdb nginx phpmyadmin mysql ftps grafana wordpress"
# addons="dashboard" # metrics-server default-storageclass storage-provisioner

setup_env()
{
	minikube delete
	if [ `uname` = Linux ]; then
		## use docker without sudo as the 42's VM doesn't allow it by default
		## check minikube version=v11
		#	sudo usermod -aG docker $(whoami) && newgrp docker 

		## start minikube with personnal settings (docker_driver)
		minikube start --driver=docker --memory=2200mb --extra-config=apiserver.service-node-port-range=1-65535 
		for ADDON in ${addons[@]}; do
			minikube addons enable "${ADDON}"
			done
	
		## Preparation metallb https://metallb.universe.tf/installation/
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
		# config of metallb from its configmap
		kubectl apply -f srcs/metallb-configmap.yaml
		MINIKUBE_IP=`minikube ip`
	else
		echo enter personalysed settings
		exit 1
	fi
}

error_check()
{
	if [ $? -eq 0 ]
	then
		echo -e "${GREEN}$1 builded${NC} ✓\n"
	else
		echo -e "${RED}$1 failled to build${NC}\n"
		exit 1
	fi
}

build_and_deploy()
{
	## Run locally build docker images for kubernetes
	eval $(minikube -p minikube docker-env)
	docker build -ttelegraf srcs/telegraf
	for container in $@
	do
		docker build -t$container srcs/$container
		error_check $container
		#deuxièmme partie deploiment services & co
		sed -i.bak "s/minikube_ip/$MINIKUBE_IP/g" srcs/$container/$container.yaml
		kubectl apply -f srcs/$container/$container.yaml
		error_check "$container service"
		mv srcs/$container/$container.yaml.bak srcs/$container/$container.yaml
	done
}

## demarre minikube et ajuste son environnement
setup_env
set -ex	# "-e pour exit lors d'un code d'erreur -u pour stoper l'exec lors de l'utilisation d'une variable non existante -x pour afficher la commande éxécutée"
build_and_deploy $pods

end=`date +%s`
echo "execution time : $(((end-start)/60))min$(((end-start)%60))sec"
echo grafana admin:admin
echo ftps ftps:pass
echo mysql mysql:pass
echo wordpress wordpress:pass
echo -e "\a"

## Déploiement du tableau de bord :
# minikube dashboard & &> /dev/null
