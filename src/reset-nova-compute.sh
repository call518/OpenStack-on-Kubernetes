#!/bin/bash

kubectl delete pdb/nova-compute-pdb
kubectl delete service/nova-compute
kubectl delete statefulset.apps/nova-compute

kubectl get all -o wide
