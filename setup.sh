#!/bin/sh
sudo minikube start
kubectl apply -f ./srcs/Nginx/nginx-deployment.yaml

