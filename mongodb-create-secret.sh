/usr/bin/openssl rand -base64 741 > mongodb-secret
kubectl create secret generic mongodb-secret --from-file=mongodb-secret
rm mongodb-secret
