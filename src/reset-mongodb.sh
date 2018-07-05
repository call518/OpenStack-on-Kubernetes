#!/bin/bash

kubectl delete service/mongodb statefulset.apps/mongodb; rm -rf /data/pods/mongodb-{0,1,2,3,4}/datadir/*

kubectl get all -o wide
