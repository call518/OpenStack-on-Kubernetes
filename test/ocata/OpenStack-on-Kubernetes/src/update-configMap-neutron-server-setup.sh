#!/bin/bash

if (kubectl get configmap | grep -q "neutron-server-setup"); then
	kubectl delete configmap neutron-server-setup
fi
kubectl create -f configMap-neutron-server-setup.yaml
