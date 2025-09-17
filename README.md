rpm-tomcat
===========

An RPM spec file to install Apache Tomcat 10.1.x with security updates and CVE fixes.

## Security Notice

This version (10.1.33) includes important security fixes. See [SECURITY.md](SECURITY.md) for details.

**Enhanced Security Features:**
- **CIS Level 2 Benchmark**: Automatically applied to both Fedora 42 and CentOS Stream 9 images
- **Vulnerability Scanning**: Builds fail automatically on medium+ severity vulnerabilities  
- **Security Artifacts**: CIS compliance reports and vulnerability scan results captured in GitHub artifacts

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

- **Fedora 42**: `docker build -f Dockerfile-fedora42 .` (with CIS Level 2 hardening)
- **CentOS Stream 9**: `docker build -f Dockerfile-centos-stream .` (with CIS Level 2 hardening)
- **Default (Fedora 42)**: `docker build .` (with CIS Level 2 hardening)

All Docker images include:
- CIS Level 2 benchmark compliance
- Automated security hardening
- Vulnerability scanning integration
- Security artifact generation

## Changes from tomcat8

- Renamed all files from `tomcat8.*` to `tomcat.*`
- Updated Tomcat version from 8.0.23 to 10.1.33 (CVE-free)
- Changed installation path from `/opt/tomcat8` to `/opt/tomcat`
- Updated for compatibility with Fedora 42 and CentOS Stream distributions
- Updated Java requirements to OpenJDK 21
- Updated Servlet/JSP API support to 5.0/3.0
- **New**: Added CIS Level 2 security benchmark compliance
- **New**: Enhanced vulnerability scanning with build failures on medium+ severity
- **New**: Automated security artifact collection and reporting

## Migration Notes

If upgrading from the old tomcat8 package:
1. Stop the old tomcat8 service: `sudo systemctl stop tomcat8`
2. Back up your configuration files from `/etc/tomcat8/`
3. Install the new tomcat package
4. Migrate your configuration to `/etc/tomcat/`
5. Update any service dependencies to use `tomcat` instead of `tomcat8`

## Additional Resources

- [SECURITY.md](SECURITY.md) - Security considerations, CIS compliance, and CVE information
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - Common build issues and solutions
- [validate-build.sh](validate-build.sh) - Environment validation script

## Quick Start

1. Run validation: `./validate-build.sh`
2. Build Docker image: `docker build -f Dockerfile-fedora42 .`
3. Build RPM: Follow instructions in "To Build" section above
4. **Review security artifacts**: Check GitHub Actions artifacts for CIS compliance reports

## Security Compliance

This repository implements:
- **CIS Level 2 Benchmark** for both Fedora and CentOS Stream
- **Automated vulnerability scanning** with build failures on medium+ severity findings
- **Security artifact collection** including compliance reports and scan results
- **Continuous security monitoring** through GitHub Actions workflows
