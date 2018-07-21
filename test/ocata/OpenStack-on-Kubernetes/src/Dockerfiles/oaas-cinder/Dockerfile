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
    && apt-get install -y rsyslog mysql-client cinder-api cinder-scheduler cinder-volume cinder-backup nfs-common tgt python-openstackclient python-pip \
    && pip install python-memcached \
    && apt-get install -y iputils-ping net-tools vim telnet lsof wget curl jq \
    && rm -rf /var/lib/apt/lists/*
COPY check-init.sh /check-init.sh
