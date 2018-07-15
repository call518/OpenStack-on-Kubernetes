#!/bin/bash

kubectl delete service/nfs-server pod/nfs-server
kubectl get all -o wide
