FROM centos:7.5.1804
MAINTAINER call518@gmail.com
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
#RUN yum -y erase NetworkManager NetworkManager-libnm
RUN yum -y install epel-release centos-release-openstack-queens
RUN yum -y install openstack-keystone httpd mod_wsgi && yum clean all
CMD while [ : ]; do sleep 1; echo running; done
