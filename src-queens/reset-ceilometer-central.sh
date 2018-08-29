#!/bin/bash

kubectl delete pdb/ceilometer-central-pdb
kubectl delete service/ceilometer-central
kubectl delete statefulset.apps/ceilometer-central

kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-ceilometer-central.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"
kubectl exec -it nfs-server -- rm -rf /data/pv/ceilometer-gnocchi
kubectl exec -it nfs-server -- mkdir -p /data/pv/ceilometer-gnocchi

kubectl get all -o wide
