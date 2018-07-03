#!/bin/bash

kubectl delete service/haproxy-galera service/haproxy-stats deployment.apps/haproxy

kubectl get all -o wide
