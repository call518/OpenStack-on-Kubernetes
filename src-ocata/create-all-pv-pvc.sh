#!/bin/bash

kubectl create -f nfs-server-pv.yaml
kubectl create -f nfs-server-pvc.yaml

kubectl create -f nfs-server.yaml

while [ "X$(kubectl describe pod nfs-server | awk '/^IP:/ {print $2}')" == "X" ]
do
        echo "waiting for nfs-server pod's ip addres....."
	sleep 3
done

NFS_SERVER_IP=$(kubectl describe pod nfs-server | awk '/^IP:/ {print $2}')

sed -e "s|___NFS_SERVER_IP___|$NFS_SERVER_IP|g" galera-pv.yaml | kubectl create -f -
sed -e "s|___NFS_SERVER_IP___|$NFS_SERVER_IP|g" mongodb-pv.yaml | kubectl create -f -
sed -e "s|___NFS_SERVER_IP___|$NFS_SERVER_IP|g" rabbitmq-pv.yaml | kubectl create -f -
sed -e "s|___NFS_SERVER_IP___|$NFS_SERVER_IP|g" glance-pv.yaml | kubectl create -f -
sed -e "s|___NFS_SERVER_IP___|$NFS_SERVER_IP|g" zookeeper-pv.yaml | kubectl create -f -
sed -e "s|___NFS_SERVER_IP___|$NFS_SERVER_IP|g" ceilometer-central-pv.yaml | kubectl create -f -

kubectl create -f galera-pvc.yaml 
kubectl create -f mongodb-pvc.yaml 
kubectl create -f rabbitmq-pvc.yaml
kubectl create -f glance-pvc.yaml
kubectl create -f zookeeper-pvc.yaml
kubectl create -f ceilometer-central-pvc.yaml

kubectl get pv
kubectl get pvc
