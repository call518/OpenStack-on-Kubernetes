OpenStack on Kubernetes (OaaS)
================================

# 머릿글

* 본 프로젝트는 개인이 진행하는 것으로, OaaS는 "OpenStack as a Service"의 약어.
* Kubernetes(이하 k8s)의 기능을 최대한 활용하여 탄력적인 OpenStack 환경을 쉽게 구축하고 운영할수 있는 솔루션을 목표로 함.
* **현 상태는 1차 개발 단계로서, Controller부에 속한 컴포넌트들 위주로 작업중...**

# 레이아웃

![Diagram](etc-files/OaaS-Introduce.png)

# 특징

* OpenStack의 컨트롤을 담당하는 주요 컴포넌트들을 k8s의 Pod단위로 나눠 운용.
* 각 Pod들은 일정 수준의 Scalable과 LB/HA 지원.
* 모든 환경변수와, 설정들에 대한 동적 관리.

# v0.0.1

* OpenStack Controller의 컴포넌트들을 k8s상에서 배포 완료.

<pre>
- memcached (완료)
- rabbitmq (완료)
- mongodb (완료)
- etcd (완료)
- galera (완료)
- haproxy (완료)
- keystone (완료)
- glance (완료)
- nova
- neutron
- cinder
- heat
- ceilometer
- horizon
</pre>
