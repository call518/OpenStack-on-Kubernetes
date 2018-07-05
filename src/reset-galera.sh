#!/bin/bash

kubectl delete service/galera statefulset.apps/galera; rm -rf /data/pods/galera-{0,1,2,3,4}/datadir/*

kubectl get all -o wide
