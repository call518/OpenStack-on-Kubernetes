#!/bin/bash

if (kubectl get configmap | grep -q "init-container-scripts"); then
	kubectl delete configmap init-container-scripts
fi
kubectl create -f configMap-init-container-scripts.yaml
