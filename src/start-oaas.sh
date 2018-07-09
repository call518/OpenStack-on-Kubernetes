#!/bin/bash

./create-all-pv-pvc.sh

./update-configMap-env-common.sh
./update-configMap-keystone-setup.sh
./update-configMap-glance-setup.sh

./update-secret-mongodb-keyfile.sh
./update-secret-rabbitmq-erlang-cookie.sh
./update-secret-keystone-fernet-key-secrets.sh

kubectl create -f galera-etcd.yaml 
kubectl create -f galera.yaml
kubectl create -f haproxy.yaml
kubectl create -f memcached.yaml
kubectl create -f mongodb.yaml
kubectl create -f rabbitmq.yaml
kubectl create -f keystone.yaml
kubectl create -f glance.yaml
kubectl create -f cinder.yaml
#kubectl create -f zookeeper.yaml
