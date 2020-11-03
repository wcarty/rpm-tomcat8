FROM fedora:33

RUN dnf -y --setopt=fastestmirror=true upgrade && dnf clean all
RUN dnf -y --setopt=fastestmirror=true install buildah httpd curl wget podman git httpd-devel && dnf clean all
