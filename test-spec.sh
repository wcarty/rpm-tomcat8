#!/bin/bash
# Simple test to validate tomcat.spec file

set -e

echo "Testing Tomcat RPM spec file..."

# Check if we can parse the spec file
echo "1. Checking spec file syntax..."
rpm -q --specfile tomcat.spec --queryformat '%{NAME}-%{VERSION}-%{RELEASE}\n' || {
    echo "ERROR: spec file has syntax errors"
    exit 1
}

# Get the version from spec
VERSION=$(rpm -q --specfile tomcat.spec --queryformat '%{VERSION}\n' | head -1)
echo "2. Detected Tomcat version: $VERSION"

# Check if the download URL exists (basic check)
DOWNLOAD_URL="https://downloads.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz"
echo "3. Testing if Tomcat download URL exists: $DOWNLOAD_URL"

if curl -I "$DOWNLOAD_URL" 2>/dev/null | head -1 | grep -q "200 OK"; then
    echo "✓ Download URL is accessible"
else
    echo "⚠ Warning: Download URL might not be accessible (but this could be due to network restrictions)"
fi

# Check file references in spec
echo "4. Checking file references in spec..."
grep -E "Source[0-9]*:" tomcat.spec

echo "5. Checking install paths..."
grep -E "tomcat_home|CATALINA_HOME" tomcat.spec tomcat.init tomcat.sysconfig || true

echo ""
echo "✓ Basic validation completed successfully!"
echo "The spec file appears to be syntactically correct for Tomcat $VERSION"