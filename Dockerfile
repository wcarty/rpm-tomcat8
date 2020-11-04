FROM fedora:33

RUN dnf -y --setopt=fastestmirror=true upgrade && dnf clean all
RUN dnf -y --setopt=fastestmirror=true installhttpd curl podman git httpd-devel mod_ssl && dnf clean all
