#/bin/bash

cat > /etc/modules-load.d/oaas.conf << EOF
openvswitch
ebtables
ip_vs
EOF

modprobe openvswitch
modprobe ebtables
modprobe ip_vs
