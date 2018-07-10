#!/bin/bash

#kubectl delete pdb/horizon-pdb service/horizon statefulset.apps/horizon
kubectl delete pdb/horizon-pdb service/horizon deployment.apps/horizon
kubectl get all -o wide
