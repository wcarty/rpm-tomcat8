rpm-tomcat8
===========

An RPM spec file to install Tomcat 8.0.

## Building the RPM

To Build:

`sudo dnf -y install rpmdevtools && rpmdev-setuptree`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.spec -O ~/rpmbuild/SPECS/tomcat8.spec`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.init -O ~/rpmbuild/SOURCES/tomcat8.init`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.sysconfig -O ~/rpmbuild/SOURCES/tomcat8.sysconfig`

`wget https://raw.github.com/wcarty/rpm-tomcat8/master/tomcat8.logrotate -O ~/rpmbuild/SOURCES/tomcat8.logrotate`

`wget http://www.motorlogy.com/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz -O ~/rpmbuild/SOURCES/apache-tomcat-8.0.23.tar.gz`

`rpmbuild -bb ~/rpmbuild/SPECS/tomcat8.spec`

## CI/CD Workflows

This repository includes several GitHub Actions workflows:

### Docker Image CI (`docker-image.yml`)
- Builds the main Fedora 41 Docker image
- Generates Software Bill of Materials (SBOM) in SPDX format
- Performs security scanning with Anchore
- Pushes images to configured Docker registry
- Uploads scan results to GitHub Security tab

### Anchore Container Scan (`anchore-analysis.yml`)
- Performs security analysis on test builds
- Generates SBOM for container images
- Integrates with GitHub Advanced Security code scanning

### Fedora 41 Image (`fedora41-image.yml`)
- Builds the minimal Fedora 41 image from `Dockerfile-fedora41`
- Generates SBOM and performs security scanning
- Runs on both push and pull request events

## Security and Compliance

- All workflows use GitHub-hosted runners (no self-hosted dependencies)
- CodeQL action updated to v3 (v1 deprecated January 2023)
- SBOM generation for all container images
- Vulnerability scanning with Anchore/Grype
- Security scan results integrated with GitHub Security tab
