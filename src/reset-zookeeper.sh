#!/bin/bash

kubectl delete pdb/zk-pdb
kubectl delete service/zk-hs
kubectl delete service/zk-cs
kubectl delete statefulset.apps/zk

kubectl get all -o wide
