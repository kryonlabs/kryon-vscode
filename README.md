# Kryon Language Support for VS Code

Syntax highlighting for the Kryon programming language.

## Features

- Syntax highlighting for `.kry` files
- Support for Kryon keywords, types, and widgets
- Auto-closing brackets and quotes
- Line comments (`//`)

## Kryon Syntax Overview

### Keywords
- `use` - Import modules
- `fn` - Function declaration
- `var` - Variable declaration
- `ref` - Reference type
- `nil` - Null value
- `return`, `if`, `else`, `for`, `while`

### Types
- `int`, `real`, `string`, `byte`, `void`
- `ref` - Reference types (e.g., `ref Image`)
- `fn` - Function types
- `array`, `list`, `dict`, `chan`

### Operators
- `->` - Module access (e.g., `sys->print`)
- `@` - Pipe/refresh operator (e.g., `drawClock @ 30000`)
- Standard operators: `+`, `-`, `*`, `/`, `%`, `=`, `==`, `!=`, `<`, `>`, `<=`, `>=`, `&&`, `||`

### Widgets
- `Window`, `Label`, `Button`, `Entry`, `Checkbutton`, `Radiobutton`, `Listbox`, `Scale`, `Frame`
- Layout: `Column`, `Row`, `Center`, `Canvas`

### Example

```kryon
use daytime
use math

var x: int
var name: string = "Hello"

fn add(a: int, b: int): int {
    return a + b;
}

fn greet(): string {
    sys->print("Hello!\n");
    return "World";
}

Window {
    title = "My App"
    width = 400
    height = 300
    bg = "#191919"

    Center {
        Label {
            text = "Hello World"
            fg = "#ffffff"
        }
    }
}
```

## Installation

1. Copy this folder to your VS Code extensions directory:
   - Linux: `~/.vscode/extensions/`
   - macOS: `~/.vscode/extensions/`
   - Windows: `%USERPROFILE%\.vscode\extensions\`

2. Rename the folder to `kryon-language-0.0.1`

3. Restart VS Code

## Development

To build and test locally:
```bash
npm install
npm run compile
```

## License

MIT
