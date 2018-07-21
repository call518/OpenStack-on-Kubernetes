#!/bin/bash

kubectl delete pdb/nova-server-pdb
kubectl delete service/nova-server
kubectl delete statefulset.apps/nova-server

kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-nova-server.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"

kubectl get all -o wide
