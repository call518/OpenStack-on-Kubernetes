#!/bin/bash

kubectl delete statefulset.apps/zk pdb/zk-pdb service/zk-hs service/zk-cs; rm -rf /data/pv/zookeeper-{0,1,2}/*

kubectl get all -o wide
