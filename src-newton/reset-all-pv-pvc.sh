#!/bin/bash

#kubectl delete pod nfs-server
./reset-nfs-server.sh

until ! (kubectl get pod | grep -q "^nfs-server")
do
	echo "waiting for terminating nfs-server pod....."
	sleep 3
done

## delete all pvc
for pvc in $(kubectl get pvc | awk '/^pvc/ {print $1}'); do kubectl delete pvc $pvc; done

## delete all pv
for pv in $(kubectl get pv | awk '/^pv/ {print $1}'); do kubectl delete pv $pv; done
