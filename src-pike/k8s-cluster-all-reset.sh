#!/bin/bash

kubeadm reset
rm -rf /root/.kube
ip link delete cni0
ip link delete flannel.1
