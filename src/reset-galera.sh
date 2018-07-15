#!/bin/bash

kubectl delete pdb/galera-pdb
kubectl delete service/galera
kubectl delete statefulset.apps/galera

kubectl get all -o wide
