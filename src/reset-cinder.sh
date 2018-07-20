#!/bin/bash

kubectl delete pdb/cinder-pdb
kubectl delete service/cinder
kubectl delete statefulset.apps/cinder

kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-cinder.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"
kubectl exec -it nfs-server -- rm -rf /data/pv/cinder-volumes
kubectl exec -it nfs-server -- mkdir -p /data/pv/cinder-volumes

kubectl get all -o wide
