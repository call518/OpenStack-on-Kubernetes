#!/bin/bash

kubectl delete service/mongo statefulset.apps/mongo; rm -rf /data/pods/mongo-{0,1,2,3,4}/datadir/*

kubectl get all -o wide
