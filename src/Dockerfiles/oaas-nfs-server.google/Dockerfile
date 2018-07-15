FROM gcr.io/google_containers/volume-nfs:0.8
MAINTAINER call518@gmail.com
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && yum -y install net-tools lsof vim \
    && yum clean all && rm -rf /var/cache/yum/*
COPY exports /etc/exports
