FROM centos:7.5.1804
MAINTAINER call518@gmail.com
COPY Dockerfile /Dockerfile
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
#RUN yum -y erase NetworkManager NetworkManager-libnm
RUN yum -y install epel-release && yum clean all
#RUN yum -y update
#RUN yum -y install python-devel python-pip openssl-devel git
#RUN yum -y groupinstall "Development Tools"
#CMD while [ : ]; do sleep 1; echo running; done
