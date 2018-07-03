#!/bin/bash

kubectl delete configmap env-common
kubectl create -f configMap-env-common.yaml
