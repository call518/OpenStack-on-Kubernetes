#!/bin/bash

kubectl delete pdb/haproxy-pdb
kubectl delete service/haproxy-galera
kubectl delete service/haproxy-stats
kubectl delete replicaset.apps/haproxy
kubectl delete deployment.apps/haproxy

kubectl get all -o wide
