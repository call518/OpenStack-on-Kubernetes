#!/bin/bash

if (kubectl get configmap | grep -q "ceilometer-central-setup"); then
	kubectl delete configmap ceilometer-central-setup
fi
kubectl create -f configMap-ceilometer-central-setup.yaml
