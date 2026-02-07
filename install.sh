#!/bin/sh
# Kryon VSCode Extension - Install Script
# Builds and installs the extension locally

set -e

echo "Installing Kryon VSCode Extension..."

# Build first if not already built
if [ ! -f "kryon-language-0.0.1.vsix" ]; then
    echo "Package not found, building..."
    ./build.sh
fi

# Uninstall existing version (ignore errors)
code --uninstall-extension kryon-language 2>/dev/null || true

# Install new version
code --install-extension kryon-language-0.0.1.vsix --force

echo ""
echo "✓ Extension installed!"
echo ""
echo "Test it by opening any .kry file:"
echo "  code /mnt/storage/Projects/TaijiOS/appl/kryon/hello.kry"
