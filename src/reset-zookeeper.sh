#!/bin/bash

kubectl delete pdb/zk-pdb statefulset.apps/zk service/zk-hs service/zk-cs; rm -rf /data/pv/zookeeper-{0,1,2}/*

kubectl get all -o wide
