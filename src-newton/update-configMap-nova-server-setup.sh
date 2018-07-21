#!/bin/bash

if (kubectl get configmap | grep -q "nova-server-setup"); then
	kubectl delete configmap nova-server-setup
fi
kubectl create -f configMap-nova-server-setup.yaml
