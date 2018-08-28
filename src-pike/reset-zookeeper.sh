#!/bin/bash

kubectl delete pdb/zk-pdb
kubectl delete service/zk-svc
kubectl delete statefulset.apps/zk

kubectl get all -o wide
