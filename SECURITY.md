# Security Considerations

## CVE Mitigation

This repository has been updated to address Common Vulnerabilities and Exposures (CVEs):

### Key Security Updates (December 2024)
- **Fedora 42**: Updated base images to latest Fedora 42 with security patches
- **Tomcat 10.1.33**: Updated from 10.1.24 to 10.1.33 which includes critical security fixes
- **Java 21**: Continues to use OpenJDK 21 which receives regular security updates

### Security Hardening Measures

1. **Package Updates**: All packages are updated to latest versions during build
2. **Cleanup**: Temporary files and package caches are removed to reduce attack surface
3. **Non-root User**: Tomcat user is created with minimal privileges
4. **Security Scanning**: Automated Anchore/Grype scanning in CI/CD pipeline

### Docker Security

- Clean package cache after installation
- Remove temporary files
- Use specific package versions where possible
- Regular base image updates

### Build Environment Notes

If you encounter SSL certificate issues during Docker builds, this may be due to certificate chain issues in the build environment. You can temporarily add `--setopt=sslverify=false` to dnf commands during the initial package installation phase.

### Continuous Security

- Monitor security advisories for Tomcat
- Update to latest patch versions promptly
- Review Anchore scan results regularly
- Keep base OS images current

## Reporting Security Issues

Security issues should be reported according to the project's security policy.