#!/bin/bash

if (kubectl get configmap | grep -q "keystone-setup"); then
	kubectl delete configmap keystone-setup
fi
kubectl create -f configMap-keystone-setup.yaml
