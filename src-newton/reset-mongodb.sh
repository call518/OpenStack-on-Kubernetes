#!/bin/bash

kubectl delete service/mongodb
kubectl delete statefulset.apps/mongodb

kubectl get all -o wide
