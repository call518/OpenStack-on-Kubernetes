#!/bin/bash

kubectl delete pdb/nova-novncproxy-pdb
kubectl delete service/nova-novncproxy
#kubectl delete statefulset.apps/nova-novncproxy
kubectl delete deployment.apps/nova-novncproxy

kubectl get all -o wide
