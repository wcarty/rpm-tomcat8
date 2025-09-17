FROM fedora:41


RUN dnf -y --setopt=fastestmirror=true upgrade && dnf clean all
RUN dnf -y --setopt=fastestmirror=true install httpd curl wget podman git httpd-devel mod_ssl php nano && dnf clean all

