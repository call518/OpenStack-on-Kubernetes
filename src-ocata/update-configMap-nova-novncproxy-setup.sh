#!/bin/bash

if (kubectl get configmap | grep -q "nova-novncproxy-setup"); then
	kubectl delete configmap nova-novncproxy-setup
fi
kubectl create -f configMap-nova-novncproxy-setup.yaml
