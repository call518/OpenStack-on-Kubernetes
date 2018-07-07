#!/bin/bash

#kubectl delete service/glance deployment.apps/glance
kubectl delete service/glance statefulset.apps/glance
kubectl exec -it keystone-0 -- /bin/bash /scripts/remove-glance.sh
kubectl exec -it galera-0 -- mysql -uroot -ppassw0rd -e "SHOW DATABASES;"
rm -rf /data/pv/glance-images/*
kubectl get all -o wide
