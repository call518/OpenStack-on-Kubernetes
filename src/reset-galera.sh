#!/bin/bash

kubectl delete pdb/galera-pdb service/galera statefulset.apps/galera; rm -rf /data/pv/galera-{0,1,2}/*

kubectl get all -o wide
