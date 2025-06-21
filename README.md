# dotfiles

[![Linux](https://img.shields.io/badge/platform-linux-blue?logo=linux&logoColor=white)](https://github.com/0xAndrii/dotfiles)
[![Managed by Chezmoi](https://img.shields.io/badge/managed%20by-chezmoi-blueviolet)](https://www.chezmoi.io)
[![Check Versions](https://github.com/0xAndrii/dotfiles/actions/workflows/check-versions.yml/badge.svg)](https://github.com/0xAndrii/dotfiles/actions/workflows/check-versions.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Minimal Linux development environment. Chezmoi-managed.

## Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply 0xAndrii
```

### Update

```bash
chezmoi update  # Pull latest changes and apply
```

### Uninstall

```bash
chezmoi purge  # Remove chezmoi config files
```

## Tools

```
helix       Text editor with LSP
zellij      Terminal multiplexer
ripgrep     Search
eza         Better ls
dust        Disk usage
ruff        Python linter/formatter
uv          Python packages
claude      AI assistant
```

## Configuration

```
~/.bashrc                    18 lines
~/.config/helix/             Editor + LSP
~/.config/zellij/            Terminal layouts
~/.gitconfig                 Git basics
~/.claude/                   AI settings
```

## Usage

```bash
hx          # Edit
rg          # Search
zj          # Terminal session
claude      # AI assistance

# Python
ruff check
ruff format
uv pip install

# Manage
chezmoi diff          # Local changes
chezmoi apply         # Apply changes
chezmoi update -n     # Preview updates from git
chezmoi update        # Pull and apply updates
chezmoi purge         # Remove managed files
```

## Documentation

- [Tool Management](docs/tool-management.md) - Add or remove tools
- [GitHub Workflows](docs/github-workflows.md) - Automated version updates

---

_Less is more._
