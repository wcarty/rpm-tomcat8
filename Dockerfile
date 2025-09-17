FROM fedora:42

# Note: If SSL certificate issues occur during build, use --setopt=sslverify=false temporarily
# This is due to certificate chain issues in some build environments
RUN dnf -y --setopt=sslverify=false upgrade && \
    dnf -y --setopt=sslverify=false install ca-certificates && \
    dnf clean all

# Install required packages with security focus
RUN dnf -y --setopt=sslverify=false --setopt=fastestmirror=true install \
    httpd curl wget podman git httpd-devel mod_ssl php nano rpmdevtools openssh-server \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Copy and run CIS Level 2 benchmark script
COPY cis-level2-fedora.sh /tmp/cis-level2-fedora.sh
RUN chmod +x /tmp/cis-level2-fedora.sh && /tmp/cis-level2-fedora.sh

# Security hardening: Clean up temporary files and caches
RUN rm -rf /tmp/* /var/tmp/*

# Additional security: Create non-root user for tomcat operations
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat

