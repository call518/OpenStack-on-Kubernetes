#/bin/bash

cat > /etc/modules-load.d/oaas.conf << EOF
openvswitch
ebtables
EOF

modprobe openvswitch
modprobe ebtables
