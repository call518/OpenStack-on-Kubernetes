#!/bin/bash

kubectl delete pdb/etcd-pdb
kubectl delete service/etcd-client
kubectl delete service/etcd0
kubectl delete service/etcd1
kubectl delete service/etcd2
kubectl delete pod/etcd0
kubectl delete pod/etcd1
kubectl delete pod/etcd2

kubectl get all -o wide
