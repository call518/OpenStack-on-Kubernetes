#!/bin/bash

yum -y install nfs-utils

mkdir /data
chmod -R 755 /data
chown nfsnobody:nfsnobody /data

systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap

echo "/data 192.168.0.0/24(rw,sync,no_root_squash,no_all_squash)" > /etc/exports

exportfs -a
systemctl restart nfs-server
