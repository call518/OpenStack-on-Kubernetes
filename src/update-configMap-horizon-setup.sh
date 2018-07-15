#!/bin/bash

if (kubectl get configmap | grep -q "horizon-setup"); then
	kubectl delete configmap horizon-setup
fi
kubectl create -f configMap-horizon-setup.yaml
