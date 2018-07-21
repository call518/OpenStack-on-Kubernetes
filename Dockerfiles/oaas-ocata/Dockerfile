FROM ubuntu:16.04
MAINTAINER call518@gmail.com
COPY Dockerfile /Dockerfile
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default \
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install software-properties-common apt-utils \
    #&& add-apt-repository -y cloud-archive:queens \
    #&& add-apt-repository -y cloud-archive:newton \
    && add-apt-repository -y cloud-archive:ocata \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y rsyslog mysql-client keystone python-openstackclient apache2 libapache2-mod-wsgi python-pip cinder-api cinder-scheduler cinder-volume cinder-backup nfs-common tgt python-openstackclient glance openstack-dashboard neutron-server neutron-plugin-ml2 neutron-plugin-openvswitch-agent neutron-linuxbridge-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent neutron-lbaasv2-agent neutron-metering-agent haproxy nova-api nova-conductor nova-consoleauth nova-novncproxy nova-scheduler nova-placement-api nova-compute nova-novncproxy nova-placement-api python-novaclient neutron-plugin-openvswitch-agent libguestfs-tools\
    && pip install python-memcached \
    && apt-get install -y iputils-ping net-tools vim telnet lsof wget curl jq \
    && rm -rf /var/lib/apt/lists/*
COPY check-init.sh /check-init.sh
