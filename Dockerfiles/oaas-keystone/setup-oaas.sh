#!/bin/bash

MYSQL="mysql -hhaproxy -uroot -p$MYSQL_ROOT_PASSWORD"

$MYSQL -e "CREATE DATABASE IF NOT EXISTS keystone"
$MYSQL -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$KEYSTONE_DBPASS'"
$MYSQL -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$KEYSTONE_DBPASS'"
