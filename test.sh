#!/bin/sh
# Kryon VSCode Extension - Test Script
# Opens a test file to verify syntax highlighting

set -e

TEST_FILE="/mnt/storage/Projects/TaijiOS/appl/kryon/hello.kry"

if [ ! -f "$TEST_FILE" ]; then
    echo "Test file not found: $TEST_FILE"
    echo "Creating a test file..."
    mkdir -p /tmp/kryon-test
    cat > /tmp/kryon-test/test.kry << 'EOF'
// Kryon Syntax Highlighting Test
use daytime
use math

var x: int = 42
var name: string = "Hello"
var enabled: bool = true

fn add(a: int, b: int): int {
    return a + b;
}

fn greet(who: string): string {
    sys->print("Hello, " + who + "\n");
    return who;
}

Window {
    title = "Test Window"
    width = 400
    height = 300
    bg = "#191919"
    fg = "#ffffff"

    onInit = fn(display: ref Display) {
        display.colormix(Draw->Blue, Draw->White);
    }

    Center {
        Label {
            text = "Hello World"
            fg = "white"
        }
        Button {
            text = "Click Me"
            onClick = fn() { sys->print("clicked\n"); }
        }
    }
}
EOF
    TEST_FILE="/tmp/kryon-test/test.kry"
fi

echo "Opening test file: $TEST_FILE"
echo ""
echo "Check that the following are highlighted:"
echo "  - Keywords: use, fn, var, return, if, else, for, while, ref, nil"
echo "  - Types: int, real, string, bool, void, ref"
echo "  - Widgets: Window, Label, Button, Entry, etc."
echo "  - Properties: title, text, width, height, bg, fg, onInit, onClick"
echo "  - Operators: ->, @, =, ==, !=, &&, ||"
echo "  - Strings and colors: \"text\", \"#191919\""
echo "  - Comments: // like this"
echo "  - Numbers: 42, 3.14, 0xFF"
echo ""

code "$TEST_FILE"
