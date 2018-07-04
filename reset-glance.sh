#!/bin/bash

#kubectl delete service/glance deployment.apps/glance
kubectl delete service/glance statefulset.apps/glance
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "drop database glance; delete from mysql.user where User='glance';"
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "show databases;"
kubectl get all -o wide
