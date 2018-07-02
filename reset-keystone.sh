#!/bin/bash

kubectl delete service/keystone deployment.apps/keystone
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "drop database keystone; delete from mysql.user where User='keyston';"
kubectl get all -o wide
