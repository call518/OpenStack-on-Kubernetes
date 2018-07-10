#!/bin/bash

kubectl delete pdb/cinder-pdb service/cinder statefulset.apps/cinder
kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-cinder.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"
rm -rf /data/pv/cinder-volumes/*
rm -rf /data/pv/cinder-backups/*
kubectl get all -o wide
