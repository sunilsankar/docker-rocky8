FROM rockylinux/rockylinux:8.4
LABEL maintainer="Sunil Sankar"
ENV container docker
RUN dnf -y update && dnf install sudo vim initscripts hostname python3 python3-pip -y && dnf clean all && rm -rf /var/cache /var/log/dnf* /var/log/yum.* && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/lib/systemd/systemd"]
