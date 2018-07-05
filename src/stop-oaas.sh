#!/bin/bash

./reset-galera-etcd.sh
./reset-galera.sh
./reset-haproxy.sh
./reset-keystone.sh
./reset-memcached.sh
./reset-mongodb.sh
./reset-rabbitmq.sh

kubectl delete configmap env-common
kubectl delete configmap glance-setup
kubectl delete configmap keystone-setup

kubectl delete secret keystone-fernet-keys
kubectl delete secret mongodb-secret
kubectl delete secret rabbitmq-erlang-cookie

sleep 10

./reset-all-pv-pvc.sh
