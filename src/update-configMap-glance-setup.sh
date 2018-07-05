#!/bin/bash

kubectl delete configmap glance-setup
kubectl create -f configMap-glance-setup.yaml
