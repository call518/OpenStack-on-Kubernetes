#!/bin/bash

kubectl delete pdb/rabbitmq-pdb
kubectl delete service/rabbitmq
kubectl delete service/rabbitmq-management
kubectl delete statefulset.apps/rabbitmq

kubectl get all -o wide
