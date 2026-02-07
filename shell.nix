{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Node.js for running vsce
    nodejs_20

    # VSCode for testing (unfree)
    vscode

    # Additional tools
    bash
  ];

  shellHook = ''
    # Create a local bin directory for our tools
    mkdir -p .nix-bin

    # Add local bin to PATH
    export PATH=$PWD/.nix-bin:$PATH

    # Create wrapper for vsce that uses npx
    cat > .nix-bin/vsce << 'EOF'
    #!${pkgs.bash}/bin/bash
    exec ${pkgs.nodejs_20}/bin/npx -y @vscode/vsce@latest "$@"
    EOF
    chmod +x .nix-bin/vsce

    # Create wrapper for code
    cat > .nix-bin/code << 'EOF'
    #!${pkgs.bash}/bin/bash
    exec ${pkgs.vscode}/bin/code "$@"
    EOF
    chmod +x .nix-bin/code

    echo "================================================"
    echo "  Kryon VSCode Extension Development"
    echo "================================================"
    echo ""
    echo "Tools available:"
    echo "  vsce  - VSCode Extension Manager (via npx)"
    echo "  code  - Visual Studio Code"
    echo ""
    echo "Quick start:"
    echo "  ./build.sh     - Build .vsix package"
    echo "  ./install.sh   - Build & install extension"
    echo "  ./test.sh      - Test syntax highlighting"
    echo "  ./uninstall.sh - Remove extension"
    echo ""
    echo "Node: $(node --version)"
    echo "VSCode: ${pkgs.vscode.version}"
    echo ""
  '';
}
