#!/bin/bash

mkdir -p /data/pv/galera-{0,1,2}
mkdir -p /data/pv/mongodb-{0,1,2}
mkdir -p /data/pv/rabbitmq-{0,1,2}
mkdir -p /data/pv/glance-images
mkdir -p /data/pv/zookeeper-{0,1,2}

kubectl create -f galera-pv.yaml 
kubectl create -f galera-pvc.yaml 
kubectl create -f mongodb-pv.yaml 
kubectl create -f mongodb-pvc.yaml 
kubectl create -f rabbitmq-pv.yaml 
kubectl create -f rabbitmq-pvc.yaml
kubectl create -f glance-pv.yaml 
kubectl create -f glance-pvc.yaml
kubectl create -f zookeeper-pv.yaml 
kubectl create -f zookeeper-pvc.yaml

kubectl get pv
kubectl get pvc
