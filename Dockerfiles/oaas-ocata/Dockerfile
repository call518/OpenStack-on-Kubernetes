FROM ubuntu:16.04
MAINTAINER call518@gmail.com
COPY Dockerfile /Dockerfile
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default \
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && sed -e 's/\(us.\)\?archive.ubuntu.com/mirror.kakao.com/g' -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install software-properties-common apt-utils \
    #&& add-apt-repository -y cloud-archive:queens \
    #&& add-apt-repository -y cloud-archive:ocata \
    && add-apt-repository -y cloud-archive:ocata \
    #&& add-apt-repository -y cloud-archive:newton \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y rsyslog mysql-client keystone python-openstackclient apache2 libapache2-mod-wsgi python-pip cinder-api cinder-scheduler cinder-volume cinder-backup nfs-common tgt python-openstackclient glance openstack-dashboard neutron-server neutron-plugin-ml2 neutron-plugin-openvswitch-agent neutron-linuxbridge-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent neutron-lbaasv2-agent neutron-metering-agent haproxy nova-api nova-conductor nova-consoleauth nova-novncproxy nova-scheduler nova-placement-api nova-compute nova-novncproxy nova-placement-api python-novaclient neutron-plugin-openvswitch-agent libguestfs-tools \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y gnocchi-api gnocchi-metricd python-gnocchiclient ceilometer-collector ceilometer-agent-central ceilometer-agent-notification ceilometer-agent-compute aodh-api aodh-evaluator aodh-notifier aodh-listener aodh-expirer python-aodhclient heat-api heat-api-cfn heat-engine \
    && pip install python-memcached \
    && apt-get -y --download-only install nova-api-metadata \
    && mv $(ls -1 /var/cache/apt/archives/nova-api-metadata*.deb) /nova-api-metadata.deb \
    && apt-get install -y iputils-ping net-tools vim telnet lsof wget curl jq tcpdump git \
    && a2dissite 000-default aodh-api keystone nova-placement-api \
    && a2disconf cinder-wsgi openstack-dashboard \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY neutron-lbaas-dashboard.tgz /neutron-lbaas-dashboard.tgz
COPY check-init.sh /check-init.sh
