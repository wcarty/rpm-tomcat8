# Security Considerations

## CVE Mitigation

This repository has been updated to address Common Vulnerabilities and Exposures (CVEs):

### Key Security Updates (December 2024)
- **Fedora 42**: Updated base images to latest Fedora 42 with security patches
- **Tomcat 10.1.33**: Updated from 10.1.24 to 10.1.33 which includes critical security fixes
- **Java 21**: Continues to use OpenJDK 21 which receives regular security updates

### Enhanced Security Features (September 2024)

#### CIS Level 2 Benchmark Implementation
- **Automated CIS Hardening**: Both Fedora 42 and CentOS Stream 9 images now apply CIS Level 2 benchmark controls during build
- **Benchmark Reports**: CIS compliance reports are generated and stored as GitHub artifacts
- **Security Configuration**: Network hardening, audit logging, SSH hardening, and access controls applied

#### Vulnerability Scanning with Build Failures
- **Medium+ Severity Blocking**: Builds now fail automatically if medium, high, or critical severity vulnerabilities are detected
- **Automated Security Gates**: CI/CD pipeline enforces security standards before allowing deployments
- **Vulnerability Reports**: Detailed vulnerability information captured in GitHub artifacts

#### Security Artifacts Collection
- **CIS Audit Logs**: Complete audit trail of security hardening applied
- **System Configuration**: Security settings and configurations captured
- **Vulnerability Scan Results**: Detailed scan results stored for compliance review

### Security Hardening Measures

1. **Package Updates**: All packages are updated to latest versions during build
2. **CIS Level 2 Controls**: Industry-standard security controls applied automatically
3. **Cleanup**: Temporary files and package caches are removed to reduce attack surface
4. **Non-root User**: Tomcat user is created with minimal privileges
5. **Security Scanning**: Automated Anchore/Grype scanning in CI/CD pipeline with build failures
6. **Network Hardening**: IPv6 disabled, network parameters secured
7. **SSH Hardening**: Secure ciphers, key algorithms, and authentication configured
8. **Audit Logging**: Comprehensive audit rules for security monitoring

### Docker Security

- Clean package cache after installation
- Remove temporary files
- Use specific package versions where possible
- Regular base image updates
- CIS Level 2 benchmark compliance

### Build Environment Notes

If you encounter SSL certificate issues during Docker builds, this may be due to certificate chain issues in the build environment. You can temporarily add `--setopt=sslverify=false` to dnf commands during the initial package installation phase.

### Continuous Security

- Monitor security advisories for Tomcat
- Update to latest patch versions promptly
- Review Anchore scan results regularly
- Keep base OS images current
- **Builds automatically fail on medium+ severity vulnerabilities**
- **CIS compliance reports generated with each build**

## Compliance and Artifacts

### CIS Level 2 Compliance
- Benchmark scripts applied during image build
- Compliance reports generated automatically
- Audit logs captured for review
- Security configuration documented

### GitHub Actions Artifacts
- **CIS Benchmark Reports**: Available for 30 days after each build
- **Vulnerability Scan Results**: Detailed security scan outputs
- **Security Configuration**: System hardening details
- **Combined Security Reports**: Consolidated compliance information

## Reporting Security Issues

Security issues should be reported according to the project's security policy.