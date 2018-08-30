FROM ubuntu:16.04
MAINTAINER call518@gmail.com
COPY Dockerfile /Dockerfile
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN sed -e 's/\(us.\)\?archive.ubuntu.com/mirror.kakao.com/g' -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install software-properties-common apt-utils
RUN add-apt-repository -y cloud-archive:queens-proposed
#RUN #add-apt-repository -y cloud-archive:queens
#RUN #add-apt-repository -y cloud-archive:pike
#RUN #add-apt-repository -y cloud-archive:ocata
#RUN #add-apt-repository -y cloud-archive:newton
RUN apt-get update
#RUN apt-get -y install python-sqlalchemy=1.0.11+ds1-1ubuntu2
#RUN apt-get -y install python-ceilometer=1:6.1.5-0ubuntu1
#RUN apt-get -y install ceilometer-common=1:6.1.5-0ubuntu1
#RUN apt-get -y install ceilometer-collector
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rsyslog mysql-client keystone python-openstackclient apache2 libapache2-mod-wsgi python-pip cinder-api cinder-scheduler cinder-volume cinder-backup nfs-common tgt python-openstackclient glance openstack-dashboard neutron-server neutron-plugin-ml2 neutron-plugin-openvswitch-agent neutron-linuxbridge-agent neutron-l3-agent neutron-dhcp-agent neutron-metadata-agent neutron-lbaasv2-agent neutron-metering-agent haproxy nova-api nova-conductor nova-consoleauth nova-novncproxy nova-scheduler nova-placement-api nova-compute nova-novncproxy nova-placement-api python-novaclient neutron-plugin-openvswitch-agent libguestfs-tools
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gnocchi-api gnocchi-metricd python-gnocchiclient ceilometer-agent-central ceilometer-agent-notification ceilometer-agent-compute aodh-api aodh-evaluator aodh-notifier aodh-listener aodh-expirer python-aodhclient heat-api heat-api-cfn heat-engine
RUN pip install python-memcached
#RUN #pip install gnocchi
#RUN #sed -i 's|/usr/lib/python2.7/dist-packages/gnocchi/rest/app.wsgi|/usr/local/lib/python2.7/dist-packages/gnocchi/rest/wsgi.py|g' /etc/apache2/sites-available/gnocchi-api.conf
RUN apt-get -y --download-only install nova-api-metadata
RUN mv $(ls -1 /var/cache/apt/archives/nova-api-metadata*.deb) /nova-api-metadata.deb
RUN apt-get install -y iputils-ping net-tools vim telnet lsof wget curl jq tcpdump git
RUN a2dissite 000-default aodh-api keystone nova-placement-api gnocchi-api
RUN a2disconf cinder-wsgi openstack-dashboard
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
COPY neutron-lbaas-dashboard.tgz /neutron-lbaas-dashboard.tgz
COPY check-init.sh /check-init.sh
