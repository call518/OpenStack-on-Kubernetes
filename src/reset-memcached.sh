#!/bin/bash

kubectl delete service/memcached deployment.apps/memcached

kubectl get all -o wide
