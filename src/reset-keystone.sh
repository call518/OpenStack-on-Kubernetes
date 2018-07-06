#!/bin/bash

#kubectl delete service/keystone deployment.apps/keystone
kubectl delete service/keystone statefulset.apps/keystone
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "DROP DATABASE IF EXISTS keystone; DELETE FROM mysql.user WHERE User='keystone'; DELETE FROM mysql.db WHERE Db='keystone' AND User='keystone'; FLUSH PRIVILEGES"
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "show databases;"
kubectl get all -o wide