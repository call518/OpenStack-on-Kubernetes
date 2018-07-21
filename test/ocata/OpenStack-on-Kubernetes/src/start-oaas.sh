#!/bin/bash

kubectl label nodes k8s-node01 controller=true network=true
kubectl label nodes k8s-node02 controller=true network=true
kubectl label nodes k8s-node03 controller=true network=true
kubectl label nodes k8s-node04 nfs-server=true compute=true

./update-configMap-env-common.sh

./create-all-pv-pvc.sh

./update-configMap-keystone-setup.sh
./update-configMap-glance-setup.sh
./update-configMap-cinder-setup.sh
./update-configMap-neutron-server-setup.sh
./update-configMap-nova-server-setup.sh
./update-configMap-nova-compute-setup.sh
./update-configMap-horizon-setup.sh

#./update-secret-mongodb-keyfile.sh
./update-secret-rabbitmq-erlang-cookie.sh
./update-secret-keystone-fernet-key-secrets.sh

kubectl create -f galera-etcd.yaml 
kubectl create -f galera.yaml
kubectl create -f haproxy.yaml
kubectl create -f memcached.yaml
#kubectl create -f mongodb.yaml
kubectl create -f rabbitmq.yaml
kubectl create -f keystone.yaml
kubectl create -f glance.yaml
kubectl create -f cinder.yaml
kubectl create -f neutron-server.yaml
kubectl create -f nova-server.yaml
kubectl create -f nova-compute.yaml
kubectl create -f horizon.yaml
#kubectl create -f zookeeper.yaml
