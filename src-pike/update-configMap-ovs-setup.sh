#!/bin/bash

if (kubectl get configmap | grep -q "ovs-setup"); then
	kubectl delete configmap ovs-setup
fi
kubectl create -f configMap-ovs-setup.yaml
