#!/bin/bash
set -e

service rsyslog start
service keystone restart
a2dissite 000-default
a2ensite wsgi-keystone
service apache2 restart
echo $MYSQL_ROOT_PASSWORD $KEYSTONE_DB_PASS $KEYSTONE_ADMIN_PASS $KEYSTONE_DEMO_PASS
mysql -hhaproxy -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS keystone"
mysql -hhaproxy -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY '$KEYSTONE_DB_PASS'"
mysql -hhaproxy -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY '$KEYSTONE_DB_PASS'"
sed -i "/^\[database\]/a connection = mysql+pymysql://keystone:$KEYSTONE_DB_PASS@haproxy/keystone" /etc/keystone/keystone.conf
sed -i "/^\[token\]/a provider = fernet" /etc/keystone/keystone.conf
su -s /bin/sh -c "keystone-manage db_sync" keystone
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
#keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
keystone-manage bootstrap --bootstrap-password $KEYSTONE_ADMIN_PASS \
  --bootstrap-admin-url http://keystone-35357:35357/v3/ \
  --bootstrap-internal-url http://keystone-35357:35357/v3/ \
  --bootstrap-public-url http://keystone-5000:5000/v3/ \
  --bootstrap-region-id RegionOne
echo "ServerName localhost" >> /etc/apache2/apache2.conf
cat > /root/admin-openrc << EOF
export OS_PROJECT_DOMAIN_NAME=default
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=$KEYSTONE_ADMIN_PASS
export OS_AUTH_URL=http://keystone-35357:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
EOF
cat > /root/demo-openrc << EOF
export OS_PROJECT_DOMAIN_NAME=Default
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_NAME=demo
export OS_USERNAME=demo
export OS_PASSWORD=$KEYSTONE_DEMO_PASS
export OS_AUTH_URL=http://keystone-5000:5000/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
EOF
source /root/admin-openrc
openstack project create --domain default --description "Service Project" service
openstack project create --domain default --description "Demo Project" demo
openstack user create --domain default --password $KEYSTONE_DEMO_PASS demo
openstack role create user
openstack role add --project demo --user demo user
tail -F /var/log/syslog /var/log/apache2/*
