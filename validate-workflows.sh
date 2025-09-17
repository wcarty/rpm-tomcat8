#!/bin/bash
# Simple workflow validation script

echo "Validating GitHub Actions workflows..."

for workflow in .github/workflows/*.yml; do
    echo "Checking $workflow..."
    if python3 -c "import yaml; yaml.safe_load(open('$workflow'))" 2>/dev/null; then
        echo "✓ $workflow is valid YAML"
    else
        echo "✗ $workflow has YAML syntax errors"
        exit 1
    fi
done

echo "All workflows are valid!"

# Check for common issues
echo ""
echo "Checking for common workflow issues..."

# Check for deprecated actions
if grep -r "checkout@v[12]" .github/workflows/; then
    echo "⚠️  Found deprecated checkout actions (should use v4)"
fi

if grep -r "codeql-action.*@v1" .github/workflows/; then
    echo "⚠️  Found deprecated CodeQL actions (should use v3)"
fi

if grep -r "self-hosted" .github/workflows/; then
    echo "⚠️  Found self-hosted runners"
fi

echo "Validation complete!"