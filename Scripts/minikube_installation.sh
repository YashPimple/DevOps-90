#!/bin/bash

sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER && newgrp docker

# for minikube and kubectl 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube 

sudo snap install kubectl --classic
minikube start --driver=docker

# Reboot your machine once using below command
# sudo reboot
# minikube service --url svcname
# kubectl get po -o wide -n web-app
# minikube ssh
# curl http://10.244.0.3:5000
# kubectl port-forward svc/<svc-name> 3000:3000 --address 0.0.0.0 &
