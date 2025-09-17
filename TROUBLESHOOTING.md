# Build Troubleshooting Guide

## Common Issues and Solutions

### SSL Certificate Issues

**Problem**: Docker builds fail with SSL certificate errors like:
```
Curl error (60): SSL peer certificate or SSH remote key was not OK
```

**Solution**: 
1. For immediate builds, add `--setopt=sslverify=false` to DNF commands:
   ```dockerfile
   RUN dnf -y --setopt=sslverify=false upgrade
   ```

2. For production environments, ensure proper certificate chain:
   ```bash
   dnf update ca-certificates
   ```

### Fedora 42 Not Available

**Problem**: `fedora:42` image not found

**Solution**: 
1. Check internet connectivity
2. Try pulling manually: `docker pull fedora:42`
3. Fallback to `fedora:latest` if Fedora 42 isn't released yet

### RPM Build Issues

**Problem**: RPM build fails with dependency errors

**Solution**:
1. Ensure all build dependencies are installed:
   ```bash
   sudo dnf install rpmdevtools
   rpmdev-setuptree
   ```

2. Download all required source files:
   ```bash
   wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.33/bin/apache-tomcat-10.1.33.tar.gz -O ~/rpmbuild/SOURCES/apache-tomcat-10.1.33.tar.gz
   ```

### Security Scan Failures

**Problem**: Anchore/Grype scans report vulnerabilities and builds fail

**Solution**:
1. Update to latest base image: `docker pull fedora:42`
2. Rebuild with latest packages
3. Check for newer Tomcat releases
4. Review scan results for false positives
5. **New**: Builds now automatically fail on medium+ severity vulnerabilities - this is intentional for security

### CIS Benchmark Issues

**Problem**: CIS Level 2 benchmark script fails during build

**Solution**:
1. Ensure all required packages are installed (openssh-server, audit, etc.)
2. Check that the script has execute permissions
3. Review CIS audit logs in `/var/log/cis-audit/`
4. Some CIS controls may not apply in containerized environments

### Java Version Conflicts

**Problem**: Java version mismatches

**Solution**:
1. Ensure Java 21 OpenJDK is installed:
   ```bash
   dnf install java-21-openjdk-devel
   ```

2. Set JAVA_HOME in `/etc/sysconfig/tomcat`:
   ```bash
   export JAVA_HOME="/usr/lib/jvm/java-21-openjdk"
   ```

### GitHub Actions Failures

**Problem**: Enhanced security workflows fail

**Solution**:
1. Check vulnerability scan results in GitHub Actions artifacts
2. Review CIS benchmark application logs
3. Ensure jq is available for JSON processing in workflows
4. Verify artifact upload permissions are configured

## Validation

Run the validation script to check your environment:
```bash
./validate-build.sh
```

## Security Best Practices

1. Always use latest versions
2. Run security scans before deployment
3. Monitor CVE databases for Tomcat updates
4. Keep base OS images current
5. Review and approve all package updates
6. **New**: Review CIS compliance reports in GitHub artifacts
7. **New**: Address medium+ severity vulnerabilities immediately
8. **New**: Monitor security configuration changes through CIS audit logs