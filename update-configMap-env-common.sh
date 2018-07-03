#!/bin/bash

kubectl delete configmap env-common
kubectl apply -f configMap-env-common.yaml
