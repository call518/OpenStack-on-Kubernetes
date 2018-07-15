#!/bin/bash

./reset-zookeeper.sh
./reset-neutron-server.sh
./reset-horizon.sh
./reset-cinder.sh
./reset-glance.sh
./reset-keystone.sh
./reset-haproxy.sh
./reset-rabbitmq.sh
./reset-mongodb.sh
./reset-memcached.sh
./reset-galera.sh
./reset-galera-etcd.sh

for pod in $(kubectl get all | awk '/^pod/ {print $1}'); do kubectl delete $pod --grace-period=0 --force; done

kubectl delete configmap env-common
kubectl delete configmap keystone-setup
kubectl delete configmap glance-setup
kubectl delete configmap cinder-setup
kubectl delete configmap neutron-server-setup
kubectl delete configmap horizon-setup

kubectl delete secret keystone-fernet-keys
#kubectl delete secret mongodb-secret
kubectl delete secret rabbitmq-erlang-cookie

sleep 10

./reset-all-pv-pvc.sh

kubectl label nodes k8s-node01 controller-
kubectl label nodes k8s-node02 controller-
kubectl label nodes k8s-node03 controller-
kubectl label nodes k8s-node04 nfs-server- network-
kubectl label nodes k8s-node05 compute-
