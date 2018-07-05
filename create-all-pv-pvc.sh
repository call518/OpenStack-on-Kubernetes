#!/bin/bash

mkdir -p /data/pods/galera-{0,1,2}/datadir
mkdir -p /data/pods/mongodb-{0,1,2}/datadir
mkdir -p /data/pods/rabbitmq-{0,1,2}/datadir
mkdir -p /data/pods/glance-images/datadir

kubectl create -f galera-pv.yaml 
kubectl create -f galera-pvc.yaml 
kubectl create -f mongodb-pv.yaml 
kubectl create -f mongodb-pvc.yaml 
kubectl create -f rabbitmq-pv.yaml 
kubectl create -f rabbitmq-pvc.yaml
kubectl create -f glance-pv.yaml 
kubectl create -f glance-pvc.yaml

kubectl get pv
kubectl get pvc
