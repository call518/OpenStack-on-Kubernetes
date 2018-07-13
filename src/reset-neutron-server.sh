#!/bin/bash

kubectl delete pdb/neutron-server-pdb service/neutron-server statefulset.apps/neutron-server
kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-neutron-server.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"
kubectl get all -o wide
