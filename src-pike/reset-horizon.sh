#!/bin/bash

kubectl delete pdb/horizon-pdb
kubectl delete service/horizon
kubectl delete deployment.apps/horizon

kubectl get all -o wide
