#!/bin/bash

kubectl delete pdb/aodh-pdb
kubectl delete service/aodh
kubectl delete statefulset.apps/aodh

kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-aodh.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"

kubectl get all -o wide
