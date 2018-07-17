#!/bin/bash

#kubectl delete service/nfs-server
kubectl delete pod/nfs-server

kubectl get all -o wide
