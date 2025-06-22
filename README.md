# dotfiles

[![Linux](https://img.shields.io/badge/platform-linux-blue?logo=linux&logoColor=white)](https://github.com/0xAndrii/dotfiles)
[![Managed by Chezmoi](https://img.shields.io/badge/managed%20by-chezmoi-blueviolet)](https://www.chezmoi.io)
[![Check Versions](https://github.com/0xAndrii/dotfiles/actions/workflows/check-versions.yml/badge.svg)](https://github.com/0xAndrii/dotfiles/actions/workflows/check-versions.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Minimal Linux development environment managed by Chezmoi. Daily automated version checks keep tools current.

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

### Core Development
- [**helix**](https://github.com/helix-editor/helix) - Text editor with LSP
- [**zellij**](https://github.com/zellij-org/zellij) - Terminal multiplexer
- [**ripgrep**](https://github.com/BurntSushi/ripgrep) - Fast code search
- [**eza**](https://github.com/eza-community/eza) - Better ls
- [**dust**](https://github.com/bootandy/dust) - Disk usage analyzer
- [**rclone**](https://github.com/rclone/rclone) - Cloud storage sync

### Python
- [**ruff**](https://github.com/astral-sh/ruff) - Python linter/formatter
- [**uv**](https://github.com/astral-sh/uv) - Fast Python package manager

### Language Servers
- [**taplo**](https://github.com/tamasfe/taplo) - TOML toolkit & LSP
- [**pyright**](https://github.com/microsoft/pyright) - Python LSP
- [**prettier**](https://github.com/prettier/prettier) - Code formatter
- [**yaml-language-server**](https://github.com/redhat-developer/yaml-language-server) - YAML LSP

### AI Tools
- [**claude**](https://github.com/anthropics/claude-code) - AI coding assistant

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

## Customize

Fork and modify:

1. Edit `.chezmoidata.yaml` - tool versions
2. Modify `.chezmoiscripts/` - installation logic
3. Adjust configurations in `dot_*` files

GitHub Actions check for updates daily and create PRs automatically.

## Documentation

- [Tool Management](docs/tool-management.md) - Add or remove tools
- [GitHub Workflows](docs/github-workflows.md) - Automated version updates
- [Versioning](docs/versioning.md) - Release process

---

_Less is more._
