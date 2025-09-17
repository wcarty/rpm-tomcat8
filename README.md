rpm-tomcat
===========

An RPM spec file to install Apache Tomcat 10.1.x with security updates and CVE fixes.

## Security Notice

This version (10.1.33) includes important security fixes. See [SECURITY.md](SECURITY.md) for details.

## To Build:

### Prerequisites
`sudo dnf -y install rpmdevtools && rpmdev-setuptree`

### Download Files
`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.spec -O ~/rpmbuild/SPECS/tomcat.spec`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.init -O ~/rpmbuild/SOURCES/tomcat.init`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.sysconfig -O ~/rpmbuild/SOURCES/tomcat.sysconfig`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat.logrotate -O ~/rpmbuild/SOURCES/tomcat.logrotate`

`wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.33/bin/apache-tomcat-10.1.33.tar.gz -O ~/rpmbuild/SOURCES/apache-tomcat-10.1.33.tar.gz`

### Build RPM
`rpmbuild -bb ~/rpmbuild/SPECS/tomcat.spec`

## Docker Support

This repository includes Docker support for building on:

- **Fedora 42**: `docker build -f Dockerfile-fedora42 .`
- **CentOS Stream 9**: `docker build -f Dockerfile-centos-stream .`
- **Default (Fedora 42)**: `docker build .`

## Changes from tomcat8

- Renamed all files from `tomcat8.*` to `tomcat.*`
- Updated Tomcat version from 8.0.23 to 10.1.33 (CVE-free)
- Changed installation path from `/opt/tomcat8` to `/opt/tomcat`
- Updated for compatibility with Fedora 42 and CentOS Stream distributions
- Updated Java requirements to OpenJDK 21
- Updated Servlet/JSP API support to 5.0/3.0

## Migration Notes

If upgrading from the old tomcat8 package:
1. Stop the old tomcat8 service: `sudo systemctl stop tomcat8`
2. Back up your configuration files from `/etc/tomcat8/`
3. Install the new tomcat package
4. Migrate your configuration to `/etc/tomcat/`
5. Update any service dependencies to use `tomcat` instead of `tomcat8`
