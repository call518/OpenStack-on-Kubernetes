#!/bin/bash

## delete all pvc
for pvc in $(kubectl get pvc | awk '/^pvc/ {print $1}'); do kubectl delete pvc $pvc; done

## delete all pv
for pv in $(kubectl get pv | awk '/^pv/ {print $1}'); do kubectl delete pv $pv; done
