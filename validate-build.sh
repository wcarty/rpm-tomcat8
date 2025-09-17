#!/bin/bash
# validate-build.sh - Validate build environment for CVE-free Tomcat RPM

echo "🔍 Validating build environment for CVE-free Tomcat builds..."

# Check for required tools
echo "📋 Checking required tools..."
for tool in docker dnf rpmdevtools; do
    if command -v $tool >/dev/null 2>&1; then
        echo "✅ $tool is available"
    else
        echo "❌ $tool is missing"
        missing_tools=1
    fi
done

# Check Docker version  
echo "🐳 Checking Docker..."
docker --version
if docker images | grep -q fedora; then
    echo "✅ Fedora Docker images available"
else
    echo "ℹ️  No Fedora images cached (will download on first build)"
fi

# Test Fedora 42 availability
echo "🔍 Testing Fedora 42 availability..."
if docker pull fedora:42 >/dev/null 2>&1; then
    echo "✅ Fedora 42 base image available"
else
    echo "⚠️  Fedora 42 not available - may need network access"
fi

# Check spec file syntax
echo "📦 Validating RPM spec file..."
if rpmspec -q --qf "%{name}-%{version}-%{release}\n" tomcat.spec 2>/dev/null; then
    echo "✅ tomcat.spec syntax valid"
    echo "📦 Package: $(rpmspec -q --qf "%{name}-%{version}-%{release}\n" tomcat.spec 2>/dev/null)"
else
    echo "❌ tomcat.spec has syntax errors"
fi

# Security checks
echo "🔒 Security validation..."
version=$(grep "^Version:" tomcat.spec | cut -d: -f2 | tr -d ' ')
if [[ "$version" == "10.1.33" ]]; then
    echo "✅ Using Tomcat $version (CVE-patched)"
else
    echo "⚠️  Tomcat version $version may have security issues"
fi

# SSL certificate workaround check
echo "🌐 SSL Certificate check..."
if dnf repolist >/dev/null 2>&1; then
    echo "✅ DNF package manager working normally"
else
    echo "⚠️  DNF having SSL issues - may need --setopt=sslverify=false during builds"
fi

if [ -z "$missing_tools" ]; then
    echo "🎉 Build environment validated successfully!"
    echo "📝 Ready to build CVE-free Tomcat RPMs with Fedora 42"
else
    echo "❌ Some tools are missing. Please install them before building."
    exit 1
fi