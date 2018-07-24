#!/bin/bash

kubectl delete pdb/galera-pdb
kubectl delete service/galera
kubectl delete statefulset.apps/galera

kubectl exec -it nfs-server -- rm -rf /data/pv/galera-{0,1,2}/*

kubectl get all -o wide
