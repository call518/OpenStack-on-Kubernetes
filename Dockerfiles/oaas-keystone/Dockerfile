FROM ubuntu:16.04
MAINTAINER call518@gmail.com
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default \
    && sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list \
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && apt-get update \
    && apt-get install -y rsyslog mysql-client keystone apache2 libapache2-mod-wsgi \
    && rm -rf /var/lib/apt/lists/*
COPY setup-oaas.sh /setup-oaas.sh
