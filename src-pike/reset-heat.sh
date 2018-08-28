#!/bin/bash

kubectl delete pdb/heat-pdb
kubectl delete service/heat
kubectl delete statefulset.apps/heat

kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-heat.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"

kubectl get all -o wide
