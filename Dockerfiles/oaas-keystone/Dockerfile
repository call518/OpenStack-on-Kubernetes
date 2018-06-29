FROM ubuntu:16.04
MAINTAINER call518@gmail.com
COPY wsgi-keystone.conf /etc/apache2/sites-available/wsgi-keystone.conf
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default \
    && sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list \
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && apt-get update \
    && apt-get install -y rsyslog mysql-client keystone python-openstackclient apache2 libapache2-mod-wsgi \
    && rm -f /var/lib/keystone/keystone.db \
    && rm -rf /var/lib/apt/lists/*
