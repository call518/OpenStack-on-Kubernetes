#!/bin/bash

#kubectl delete service/keystone deployment.apps/keystone
kubectl delete service/keystone statefulset.apps/keystone
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "drop database keystone; delete from mysql.user where User='keystone';"
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "show databases;"
kubectl get all -o wide
