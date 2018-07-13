#!/bin/bash

kubectl delete configmap neutron-server-setup
kubectl create -f configMap-neutron-server-setup.yaml
