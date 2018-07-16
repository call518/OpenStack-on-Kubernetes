FROM ubuntu:16.04
MAINTAINER call518@gmail.com
COPY Dockerfile /Dockerfile
RUN cp -a /etc/apt/sources.list /etc/apt/sources.list.default \
    && sed -e 's/\(us.\)\?archive.ubuntu.com/ftp.daumkakao.com/g' -e 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list.default > /etc/apt/sources.list \
    && ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && apt-get update \
    && apt-get install -y haproxy rsyslog \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /run/haproxy
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
