#!/bin/sh
# Kryon VSCode Extension - Build Script
# Builds the .vsix extension package

set -e

echo "Building Kryon VSCode Extension..."

# Check if vsce is installed
if ! command -v vsce >/dev/null 2>&1; then
    echo "vsce not found. Installing..."
    npm install -g @vscode/vsce
fi

# Build the package
vsce package

echo "✓ Built: kryon-language-0.0.1.vsix"
echo ""
echo "To install:"
echo "  ./install.sh"
echo ""
echo "Or manually:"
echo "  code --install-extension kryon-language-0.0.1.vsix"
