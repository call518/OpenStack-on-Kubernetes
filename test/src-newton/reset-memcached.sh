#!/bin/bash

kubectl delete pdb/memcached-pdb
kubectl delete service/memcached
kubectl delete statefulset.apps/memcached

kubectl get all -o wide
