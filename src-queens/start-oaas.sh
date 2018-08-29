#!/bin/bash

kubectl label nodes node-1.novalocal controller=true compute=true nfs-server=true
kubectl label nodes node-2.novalocal controller=true compute=true
kubectl label nodes node-3.novalocal controller=true compute=true
kubectl label nodes node-4.novalocal network=true
kubectl label nodes node-5.novalocal network=true

./update-configMap-env-common.sh
./update-configMap-init-container-scripts.sh

./create-all-pv-pvc.sh

./update-configMap-openstack-openrc.sh
./update-configMap-zookeeper-setup.sh
./update-configMap-keystone-setup.sh
./update-configMap-glance-setup.sh
./update-configMap-cinder-setup.sh
./update-configMap-ceilometer-central-setup.sh
./update-configMap-aodh-setup.sh
./update-configMap-heat-setup.sh
./update-configMap-ovs-setup.sh
./update-configMap-neutron-server-setup.sh
./update-configMap-nova-server-setup.sh
./update-configMap-nova-compute-setup.sh
./update-configMap-horizon-setup.sh

#./update-secret-mongodb-keyfile.sh
./update-secret-rabbitmq-erlang-cookie.sh
./update-secret-keystone-fernet-key-secrets.sh

kubectl create -f etcd.yaml 
kubectl create -f galera.yaml
kubectl create -f haproxy.yaml
kubectl create -f memcached.yaml
#kubectl create -f mongodb.yaml
kubectl create -f rabbitmq.yaml
kubectl create -f keystone.yaml
kubectl create -f zookeeper.yaml
kubectl create -f ceilometer-central.yaml
kubectl create -f aodh.yaml
kubectl create -f heat.yaml
kubectl create -f glance.yaml
kubectl create -f cinder.yaml
kubectl create -f neutron-server.yaml
kubectl create -f nova-server.yaml
kubectl create -f nova-compute.yaml
kubectl create -f horizon.yaml
