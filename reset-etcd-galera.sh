#!/bin/bash

kubectl delete service/galera-ss service/mongo-ss statefulset.apps/galera-ss statefulset.apps/mongo-ss service/etcd-client service/etcd0 service/etcd1 service/etcd2 pod/etcd0 pod/etcd1 pod/etcd2

kubectl get all -o wide
