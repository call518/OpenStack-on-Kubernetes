#!/bin/bash

if (kubectl get configmap | grep -q "cinder-setup"); then
	kubectl delete configmap cinder-setup
fi
kubectl create -f configMap-cinder-setup.yaml
