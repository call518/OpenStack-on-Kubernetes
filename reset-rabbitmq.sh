#!/bin/bash

kubectl delete service/rabbitmq service/rabbitmq-management statefulset.apps/rabbitmq; rm -rf /data/pods/rabbitmq-{0,1,2,3,4}/datadir/*

kubectl get all -o wide
