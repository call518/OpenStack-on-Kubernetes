#!/bin/bash

kubectl delete service/haproxy service/haproxy-stats deployment.apps/haproxy

kubectl get all -o wide
