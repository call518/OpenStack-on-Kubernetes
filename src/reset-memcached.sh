#!/bin/bash

kubectl delete pdb/memcached-pdb service/memcached statefulset.apps/memcached
#kubectl delete service/memcached deployment.apps/memcached

kubectl get all -o wide
