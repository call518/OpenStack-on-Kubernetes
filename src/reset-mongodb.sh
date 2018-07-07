#!/bin/bash

kubectl delete service/mongodb statefulset.apps/mongodb; rm -rf /data/pv/mongodb-{0,1,2}/*

kubectl get all -o wide
