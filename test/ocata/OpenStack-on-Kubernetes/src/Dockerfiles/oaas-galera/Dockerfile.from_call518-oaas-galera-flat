## https://github.com/severalnines/galera-docker-mariadb/blob/master/Dockerfile
FROM call518/oaas-galera:flat
MAINTAINER call518@gmail.com
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && yum clean all && rm -rf /var/cache/yum/*
COPY entrypoint.sh /entrypoint.sh
EXPOSE 3306 4567 4568
HEALTHCHECK --interval=10s --timeout=3s --retries=15 \
	CMD /bin/sh /healthcheck.sh || exit 1
ENTRYPOINT ["/entrypoint.sh"]
