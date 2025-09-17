FROM fedora:39


RUN dnf -y --setopt=fastestmirror=true upgrade && dnf clean all
RUN dnf -y --setopt=fastestmirror=true install httpd curl wget podman git httpd-devel mod_ssl php nano java-11-openjdk java-11-openjdk-devel rpmdevtools && dnf clean all

