#!/bin/bash

if (kubectl get configmap | grep -q "nova-compute-setup"); then
	kubectl delete configmap nova-compute-setup
fi
kubectl create -f configMap-nova-compute-setup.yaml
