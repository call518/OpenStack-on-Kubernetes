#!/bin/bash

kubectl delete pdb/rabbitmq-pdb service/rabbitmq service/rabbitmq-management statefulset.apps/rabbitmq; rm -rf /data/pv/rabbitmq-{0,1,2}/*

kubectl get all -o wide
