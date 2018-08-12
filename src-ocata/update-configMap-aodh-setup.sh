#!/bin/bash

if (kubectl get configmap | grep -q "aodh-setup"); then
	kubectl delete configmap aodh-setup
fi
kubectl create -f configMap-aodh-setup.yaml
