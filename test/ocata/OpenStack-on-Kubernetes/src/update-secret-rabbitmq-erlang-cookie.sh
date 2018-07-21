#!/bin/bash

if (kubectl get secret | grep -q "rabbitmq-erlang-cookie"); then
	kubectl delete secret rabbitmq-erlang-cookie
fi
kubectl create secret generic rabbitmq-erlang-cookie --from-literal=erlang-cookie=c-is-for-cookie-thats-good-enough-for-me
