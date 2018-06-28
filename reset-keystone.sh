#!/bin/bash

kubectl delete service/keystone-5000 service/keystone-35357 deployment.apps/keystone

kubectl get all -o wide
