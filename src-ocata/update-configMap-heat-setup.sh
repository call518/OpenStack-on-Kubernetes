#!/bin/bash

if (kubectl get configmap | grep -q "heat-setup"); then
	kubectl delete configmap heat-setup
fi
kubectl create -f configMap-heat-setup.yaml
