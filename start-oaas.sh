#!/bin/bash

bash -c create-all-pv-pvc.sh

bash -c update-configMap-env-common.sh
bash -c update-configMap-keystone-setup.sh

bash -c update-secret-mongodb-keyfile.sh
bash -c update-secret-rabbitmq-erlang-cookie.sh
bash -c update-secret-keystone-fernet-key-secrets.sh

kubectl create -f galera-etcd.yaml 
kubectl create -f galera.yaml
kubectl create -f memcached.yaml
kubectl create -f mongodb.yaml
kubectl create -f rabbitmq.yaml
kubectl create -f keystone.yaml
