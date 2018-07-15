#!/bin/bash

kubectl delete pdb/glance-pdb service/glance statefulset.apps/glance

kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-glance.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"

kubectl get all -o wide
