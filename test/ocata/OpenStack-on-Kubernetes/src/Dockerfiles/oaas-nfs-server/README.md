# nfs-server-alpine

A handy NFS Server image comprising Alpine Linux and NFS v4 only, over TCP on port 2049.

## Overview

The image comprises of;

- [Alpine Linux](http://www.alpinelinux.org/) v3.7.0. Alpine Linux is a security-oriented, lightweight Linux distribution based on [musl libc](https://www.musl-libc.org/) (v1.1.18) and [BusyBox](https://www.busybox.net/).
- [Confd](https://www.confd.io/) v0.14.0
- NFS v4 only, over TCP on port 2049. Rpcbind is enabled for now to overcome a bug with slow startup, it shouldn't be required.

For ARM versions, tag 6-arm is based on [hypriot/rpi-alpine](https://github.com/hypriot/rpi-alpine) and tag 7 onwards based on the stock Alpine image. Tag 7 uses confd v0.16.0.

For previous tag 6;

- Alpine Linux v3.6.0
- Musl v1.1.15

For previous tag 5;

- Confd v0.13.0

For previous tag 4;

- Alpine Linux v3.5
- Confd v0.12.0-dev

**Note:** There were some serious flaws with image versions 3 and earlier. Please use **4** or later. The earlier version are only here in case they are used in automated workflows.

When run, this container will make whatever directory is specified by the environment variable SHARED_DIRECTORY available to NFS v4 clients.

`docker run -d --name nfs --privileged -v /some/where/fileshare:/nfsshare -e SHARED_DIRECTORY=/nfsshare itsthenetwork/nfs-server-alpine:latest`

Add `--net=host` or `-p 2049:2049` to make the shares externally accessible via the host networking stack. This isn't necessary if using [Rancher](https://rancher.com/) or linking containers in some other way.

Adding `-e READ_ONLY=true` will cause the exports file to contain `ro` instead of `rw`, allowing only read access by clients.

Adding `-e SYNC=true` will cause the exports file to contain `sync` instead of `async`, enabling synchronous mode. Check the exports man page for more information: https://linux.die.net/man/5/exports.

Adding `-e PERMITTED="10.11.99.*"` will permit only hosts with an IP address starting 10.11.99 to mount the file share.

Due to the `fsid=0` parameter set in the **/etc/exports file**, there's no need to specify the folder name when mounting from a client. For example, this works fine even though the folder being mounted and shared is /nfsshare:

`sudo mount -v 10.11.12.101:/ /some/where/here`

To be a little more explicit:

`sudo mount -v -o vers=4,loud 10.11.12.101:/ /some/where/here`

To _unmount_:

`sudo umount /some/where/here`

The /etc/exports file contains these parameters:

`*(rw,fsid=0,async,no_subtree_check,no_auth_nlm,insecure,no_root_squash)`

Note that the `showmount` command won't work against the server as rpcbind isn't running.

### Kubernetes

As reported here https://github.com/sjiveson/nfs-server-alpine/issues/8 it appears Kubernetes requires the `privileged: true` option to be set.

### RancherOS

You may need to do this at the CLI to get things working:

```
sudo ros service enable kernel-headers
sudo ros service up kernel-headers
```

Alternatively you can add this to the host's **cloud-config.yml** (or user data on the cloud):

```
#cloud-config
rancher:
  services_include:
    kernel-headers: true
```

RancherOS also uses overlayfs for Docker so please read the next section.

### OverlayFS

OverlayFS does not support NFS export so please volume mount into your NFS container from an alternative (hopefully one is available).

On RancherOS the **/home**, **/media** and **/mnt** file systems are good choices as these are ext4.

### Other Operating Systems

You may need to ensure the **nfs** and **nfsd** kernel modules are loaded by running `modprobe nfs nfsd`.

### Host Mode Networking & Rancher DNS

You'll need to use this label if you are using host network mode and want other services to resolve the NFS service's name via Rancher DNS:

```
  labels:
    io.rancher.container.dns: 'true'
```

### Mounting Within a Container

The container requires the SYS_ADMIN capability, or, less securely, to be run in privileged mode.

### What Good Looks Like

A successful server start should produce log output like this:

```
The PERMITTED environment variable is missing or null, defaulting to '*'.
Any client can mount.
The READ_ONLY environment variable is missing or null, defaulting to 'rw'
Clients have read/write access.
The SYNC environment variable is missing or null, defaulting to 'async'.
Writes will not be immediately written to disk.
Starting Confd population of files...
confd 0.14.0 (Git SHA: 9fab9634, Go Version: go1.9.1)
2018-05-07T18:24:39Z d62d37258311 /usr/bin/confd[14]: INFO Backend set to env
2018-05-07T18:24:39Z d62d37258311 /usr/bin/confd[14]: INFO Starting confd
2018-05-07T18:24:39Z d62d37258311 /usr/bin/confd[14]: INFO Backend source(s) set to
2018-05-07T18:24:39Z d62d37258311 /usr/bin/confd[14]: INFO /etc/exports has md5sum 4f1bb7b2412ce5952ecb5ec22d8ed99d should be 92cc8fa446eef0e167648be03aba09e5
2018-05-07T18:24:39Z d62d37258311 /usr/bin/confd[14]: INFO Target config /etc/exports out of sync
2018-05-07T18:24:39Z d62d37258311 /usr/bin/confd[14]: INFO Target config /etc/exports has been updated
Displaying /etc/exports contents...
/nfsshare *(rw,fsid=0,async,no_subtree_check,no_auth_nlm,insecure,no_root_squash)
Starting rpcbind...
Displaying rpcbind status...
   program version netid     address                service    owner
    100000    4    tcp6      ::.0.111               -          superuser
    100000    3    tcp6      ::.0.111               -          superuser
    100000    4    udp6      ::.0.111               -          superuser
    100000    3    udp6      ::.0.111               -          superuser
    100000    4    tcp       0.0.0.0.0.111          -          superuser
    100000    3    tcp       0.0.0.0.0.111          -          superuser
    100000    2    tcp       0.0.0.0.0.111          -          superuser
    100000    4    udp       0.0.0.0.0.111          -          superuser
    100000    3    udp       0.0.0.0.0.111          -          superuser
    100000    2    udp       0.0.0.0.0.111          -          superuser
    100000    4    local     /var/run/rpcbind.sock  -          superuser
    100000    3    local     /var/run/rpcbind.sock  -          superuser
Starting NFS in the background...
rpc.nfsd: knfsd is currently down
rpc.nfsd: Writing version string to kernel: -2 -3 +4
rpc.nfsd: Created AF_INET TCP socket.
rpc.nfsd: Created AF_INET6 TCP socket.
Exporting File System...
exporting *:/nfsshare
/nfsshare     	<world>
Starting Mountd in the background...
Startup successful.
```

### Dockerfile

The Dockerfile used to create this image is available at the root of the file system on build.

```
FROM alpine:latest
MAINTAINER Steven Iveson <steve@iveson.eu>

RUN apk add -U -v nfs-utils bash iproute2 && \
    rm -rf /var/cache/apk/* /tmp/* && \
    rm -f /sbin/halt /sbin/poweroff /sbin/reboot && \
    mkdir -p /var/lib/nfs/rpc_pipefs && \
    mkdir -p /var/lib/nfs/v4recovery && \
    echo "rpc_pipefs    /var/lib/nfs/rpc_pipefs rpc_pipefs      defaults        0       0" >> /etc/fstab && \
    echo "nfsd  /proc/fs/nfsd   nfsd    defaults        0       0" >> /etc/fstab

COPY confd-binary /usr/bin/confd
COPY confd/confd.toml /etc/confd/confd.toml
COPY confd/toml/* /etc/confd/conf.d/
COPY confd/tmpl/* /etc/confd/templates/

COPY nfsd.sh /usr/bin/nfsd.sh
COPY .bashrc /root/.bashrc

RUN chmod +x /usr/bin/nfsd.sh /usr/bin/confd
ENTRYPOINT ["/usr/bin/nfsd.sh"]
```
