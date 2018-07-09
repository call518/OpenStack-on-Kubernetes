#!/bin/bash

kubectl delete configmap cinder-setup
kubectl create -f configMap-cinder-setup.yaml
