#!/bin/bash

if (kubectl get secret | grep -q "mongodb-secret"); then
	kubectl delete secret mongodb-secret
fi
/usr/bin/openssl rand -base64 741 > mongodb-secret
kubectl create secret generic mongodb-secret --from-file=mongodb-secret
rm mongodb-secret
