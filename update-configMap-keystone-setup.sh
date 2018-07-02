#!/bin/bash

kubectl delete configmap keystone-setup
kubectl create -f configMap-keystone-setup.yaml
