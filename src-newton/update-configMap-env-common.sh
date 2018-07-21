#!/bin/bash

if (kubectl get configmap | grep -q "env-common"); then
	kubectl delete configmap env-common
fi
kubectl create -f configMap-env-common.yaml
