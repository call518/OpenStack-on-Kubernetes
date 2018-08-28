#!/bin/bash

if (kubectl get configmap | grep -q "glance-setup"); then
	kubectl delete configmap glance-setup
fi
kubectl create -f configMap-glance-setup.yaml
