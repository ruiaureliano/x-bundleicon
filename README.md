# 🛠 X-BundleIcon

[![](https://img.shields.io/badge/MIT-License-ba3ce5.svg)](./LICENSE.md) [![](https://img.shields.io/badge/swift-5.6-ba3ce5.svg)](https://swift.org/blog/swift-5-6-released/)

---

This is a command line tool to extract an app icon. this sample will extract the icon 16x16 from Safari app.

`xbi com.apple.Safari 16 /Users/ruiaureliano/Desktop/com.apple.Safari.png`

## Installation

### Using Github

[![](https://img.shields.io/badge/Download-1.0-ba3ce5.svg?logo=github)](https://github.com/ruiaureliano/x-bundleicon/releases/download/1.0/xbi)

## Usage

```
USAGE: xbi [--version] <bundle> <size> <file>

    OPTIONS:
        -v, --version   Print the version and exit
        -h, --help      Show help information.

    SUBCOMMANDS:
        bundle          The app bundle id
        size            The icon size to export
        file            The file destination to save
