#!/bin/bash

if (kubectl get configmap | grep -q "zookeeper-setup"); then
	kubectl delete configmap zookeeper-setup
fi
kubectl create -f configMap-zookeeper-setup.yaml
