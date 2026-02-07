#!/bin/sh
# Kryon VSCode Extension - Uninstall Script

set -e

echo "Uninstalling Kryon VSCode Extension..."

code --uninstall-extension kryon-language

echo "✓ Extension uninstalled"
