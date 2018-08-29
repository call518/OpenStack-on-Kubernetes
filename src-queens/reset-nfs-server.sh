#!/bin/bash

kubectl exec -it nfs-server -- rm -rf /data/pv

#kubectl delete service/nfs-server
kubectl delete pod/nfs-server

kubectl get all -o wide
