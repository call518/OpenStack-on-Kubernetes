FROM ubuntu:16.04
MAINTAINER call518@gmail.com
COPY Dockerfile /Dockerfile
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default \
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install software-properties-common apt-utils \
    #&& add-apt-repository -y cloud-archive:queens \
    && add-apt-repository -y cloud-archive:newton \
    && apt-get update \
    ### (Note) if nova-compute node, you need to install nova-api-metadata instead of nova-api
    && DEBIAN_FRONTEND=noninteractive apt-get install -y rsyslog mysql-client python-pip nfs-common tgt apache2 libapache2-mod-wsgi cinder-api cinder-scheduler cinder-volume cinder-backup python-openstackclient glance python-openstackclient openstack-dashboard keystone neutron-server neutron-plugin-ml2 neutron-plugin-openvswitch-agent neutron-linuxbridge-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent neutron-lbaasv2-agent neutron-metering-agent haproxy nova-conductor nova-consoleauth nova-novncproxy nova-scheduler nova-compute nova-api python-novaclient libguestfs-tools \
    && pip install python-memcached \
    && apt-get install -y iputils-ping net-tools vim telnet lsof wget curl jq tcpdump \
    && rm -rf /var/lib/apt/lists/*
COPY check-init.sh /check-init.sh
