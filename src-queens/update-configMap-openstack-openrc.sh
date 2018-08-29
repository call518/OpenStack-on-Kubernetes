#!/bin/bash

if (kubectl get configmap | grep -q "openstack-openrc"); then
	kubectl delete configmap openstack-openrc
fi
kubectl create -f configMap-openstack-openrc.yaml
