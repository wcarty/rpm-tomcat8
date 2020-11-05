FROM fedora:33


RUN dnf -y --setopt=fastestmirror=true install httpd curl podman git httpd-devel mod_ssl php && dnf clean all
