#!/bin/bash

./reset-galera-etcd.sh
./reset-galera.sh
./reset-haproxy.sh
./reset-keystone.sh
./reset-memcached.sh
./reset-mongodb.sh
./reset-rabbitmq.sh
