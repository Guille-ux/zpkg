# zpkg - Zynk Package Manager

`zpkg` is a simple package manager built entirely in my programming language **Zynk**. It manages repositories, inspects remote package manifests, and automates downloading and extracting the package directly onto your system.

---

## 🔗 Architecture & Features

- **Executable Shebang Support:** Runs natively via `#!/usr/bin/zynk` and resolves execution pathways seamlessly regardless of current working directories.
- **Repository Management:** Easily add, list, and remove package repositories from local config files.
- **Manifest Parsing:** Fetches remote repository manifests and parses package definitions using built-in Zynk string parsing logic.
- **Directory Isolation:** Automatically handles local package deployment into zpkg's own dir (`pkgs/`).

---

## 📁 Repository Structure

```text
zpkg/
├── zpkg                # Executable entry script with shebang
├── manifest.txt        # Local package manifest
├── repos.txt           # Configuration listing available repository URLs
└── src/
    ├── main.z          # Core CLI and package processing engine
    ├── parser.z        # Key-Value dictionary parser class
    ├── lparser.z       # Delimited list parser class
    ├── dump.z          # Serializer for updated configuration files
    └── dzip.z          # Package downloader & extractor handler
```

---

## Installation

Run on zpkg's folder the following command

```bash
bash installer.sh
```

## 🛠 Usage

Ensure `/usr/bin/zynk` is present on your system path.

### Display Help & Information
```bash
zpkg
```

### Manage Repositories
Add a remote repository URL to your tracked list:
```bash
zpkg add https://raw.githubusercontent.com/username/zpkg-repo/main
```

Delete a tracked repository:
```bash
zpkg del https://raw.githubusercontent.com/username/zpkg-repo/main
```

### Install & Remove Packages
Install a package from available repositories:
```bash
zpkg install libmorse
```

Remove an installed package:
```bash
zpkg remove libmorse
```

---

## 🌐 Setting Up a Remote Repository

A `zpkg` repository is a simple HTTP static host (such as GitHub Pages or raw GitHub content) containing a `manifest.txt` file and zip archives.

### Manifest Syntax (`manifest.txt`)
Each package entry maps a package key to its corresponding archive name, delimited by `=`:

```text
libmorse=<URL>/libmorse.zip;
mytool=<URL>/mytool.zip;
```
*Note: `<URL>` just means that you have to put the COMPLETE url to the package*


When `zpkg install <pkg>` runs:
1. It queries `manifest.txt` across all listed repos in `repos.txt`.
2. Once identified, it downloads `<repo_url>/<pkg_name>` (e.g. `libmorse.zip`).
3. It extracts the content into the local `pkgs/` directory.

---

## ⚙ Core Dependencies
Currently, `zpkg` relies on Linux-native system utilities invoked through Zynk's `system()` bridge:
- `curl` (for fetching manifests and remote archives)
- `unzip` (for package extraction)
- `zynk` (the programming language)
---

## 📄 License
MIT License: [See more](LICENSE.txt)
