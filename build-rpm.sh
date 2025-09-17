#!/bin/bash
# Build script for the new Tomcat RPM package
# This demonstrates the updated build process

set -e

TOMCAT_VERSION="10.1.34"
TOMCAT_MAJOR="10"

echo "=== Tomcat RPM Build Script ==="
echo "Building Tomcat ${TOMCAT_VERSION} RPM package"
echo ""

# Setup RPM build environment
echo "1. Setting up RPM build environment..."
rpmdev-setuptree

# Copy spec file
echo "2. Copying spec file..."
cp tomcat.spec ~/rpmbuild/SPECS/

# Copy source files
echo "3. Copying source files..."
cp tomcat.init ~/rpmbuild/SOURCES/
cp tomcat.sysconfig ~/rpmbuild/SOURCES/
cp tomcat.logrotate ~/rpmbuild/SOURCES/

# Download Tomcat if not present
TOMCAT_TARBALL="apache-tomcat-${TOMCAT_VERSION}.tar.gz"
if [ ! -f "~/rpmbuild/SOURCES/${TOMCAT_TARBALL}" ]; then
    echo "4. Downloading Tomcat ${TOMCAT_VERSION}..."
    DOWNLOAD_URL="https://downloads.apache.org/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/${TOMCAT_TARBALL}"
    echo "   From: $DOWNLOAD_URL"
    # wget "$DOWNLOAD_URL" -O ~/rpmbuild/SOURCES/"$TOMCAT_TARBALL"
    echo "   [Skipping actual download in test environment]"
else
    echo "4. Tomcat tarball already exists, skipping download"
fi

# Build RPM (commented out for test environment)
echo "5. Building RPM package..."
echo "   Command: rpmbuild -bb ~/rpmbuild/SPECS/tomcat.spec"
echo "   [Skipping actual build in test environment]"

echo ""
echo "✓ Build preparation completed successfully!"
echo ""
echo "To actually build the RPM, run:"
echo "  rpmbuild -bb ~/rpmbuild/SPECS/tomcat.spec"
echo ""
echo "The resulting RPM will install:"
echo "  - Tomcat to: /opt/tomcat"
echo "  - Service name: tomcat"
echo "  - Configuration: /etc/tomcat/"
echo "  - Logs: /var/log/tomcat/"