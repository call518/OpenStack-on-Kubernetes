#!/bin/bash

kubectl delete configmap horizon-setup
kubectl create -f configMap-horizon-setup.yaml
