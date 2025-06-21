# Minimal Developer Dotfiles

A clean, minimalist dotfiles setup using Chezmoi for modern developer productivity.

## Quick Install

```bash
# Install Chezmoi and apply dotfiles in one command
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply [your-github-username]
```

## Tools Included

### Core Development Tools
- **[Helix](https://helix-editor.com/)** - Modern modal text editor with built-in LSP support
- **[Ripgrep](https://github.com/BurntSushi/ripgrep)** - Lightning-fast recursive search
- **[Eza](https://github.com/eza-community/eza)** - Modern `ls` replacement with colors and icons
- **[Dust](https://github.com/bootandy/dust)** - Intuitive disk usage analyzer
- **[Zellij](https://zellij.dev/)** - Modern terminal multiplexer
- **[Claude Code](https://claude.ai/code)** - AI coding assistant CLI

### Python Development
- **[Ruff](https://github.com/astral-sh/ruff)** - Extremely fast Python linter and formatter (10-100x faster than alternatives)
- **[uv](https://github.com/astral-sh/uv)** - Extremely fast Python package manager (10-100x faster than pip)

### Language Servers (Auto-installed)
- **Pyright** - Python static type checker
- **rust-analyzer** - Rust language server (if Rust is installed)
- **yaml-language-server** - YAML with schema validation
- **taplo** - TOML formatter and validator
- **prettier** - Code formatter for JSON, YAML, Markdown

## Configuration Details

### Shell (`.bashrc`)
Ultra-minimal with only essentials:
- Environment variables for editor and PATH
- Aliases: `ls`, `ll`, `lt` (eza), `zj` (zellij), `claude` (AI assistant)
- No unnecessary functions or complex prompts

### Git (`.gitconfig`)
- User name and email (from Chezmoi setup)
- Default editor: Helix

### Helix Editor (`.config/helix/`)
- **config.toml**: 
  - Monokai Pro Octagon theme
  - Relative line numbers
  - Mouse disabled for keyboard efficiency
- **languages.toml**: 
  - Python: Ruff formatting + Pyright type checking
  - Rust: rust-analyzer with clippy integration
  - Auto-formatting for all supported languages
  - Proper LSP configurations for JSON, YAML, TOML

### Zellij (`.config/zellij/`)
- Custom default layout: main pane (left) + split pane (right)
- Tokyo Night theme
- System clipboard integration
- Vim-style navigation keybindings

### Dust (`.config/dust/config.toml`)
- Reverse sorting to show largest directories first

### Claude Code (`.claude/`)
- **settings.json**: All essential tools enabled with safety features
- **local/**: Local installation (no sudo required)
- Alias `claude` for easy access

## Usage

### Essential Commands
```bash
# File navigation
ls          # List files (eza)
ll          # List with details
lt          # Tree view
lt --level=N # Tree with depth N

# Development
hx file.py  # Edit with Helix
rg pattern  # Search with ripgrep
dust        # Analyze disk usage

# Terminal
zj          # Start Zellij session

# Python
ruff check  # Lint Python code
ruff format # Format Python code
uv pip install package # Fast package installation

# AI Assistant
claude    # Start Claude Code session
claude -c # Continue previous session
```

### Chezmoi Management
```bash
chezmoi diff        # Preview changes
chezmoi apply       # Apply changes
chezmoi update      # Pull and apply latest
chezmoi edit <file> # Edit a managed file
chezmoi add <file>  # Add a new file
```

## Updating Tool Versions

Tool versions are centralized in `.chezmoiscripts/run_once_00-install-packages.sh.tmpl`:
```bash
HELIX_VERSION="25.01"
RUFF_VERSION="0.12.0"
UV_VERSION="0.7.13"
# etc...
```

To update: edit versions and run `chezmoi apply`

## Philosophy

This setup embraces minimalism:
- **Less is more**: Only tools that provide significant productivity gains
- **Fast everything**: Tools written in Rust for blazing performance
- **Zero bloat**: No unnecessary configurations or aliases
- **Easy maintenance**: Centralized versions, DRY code
- **Modern defaults**: LSP support, auto-formatting, smart completions

## Requirements

- Linux (Ubuntu/Debian/Fedora/Arch supported)
- sudo access for tool installation
- Internet connection for downloads

## Troubleshooting

If installation fails:
1. Check internet connection
2. Ensure sudo access: `sudo -v`
3. Run with verbose output: `bash -x .chezmoiscripts/run_once_00-install-packages.sh.tmpl`
4. Check tool-specific logs in `/tmp/`

## Contributing

Keep it minimal. Before adding anything, ask:
- Does it provide significant value?
- Is there a simpler alternative?
- Will it work across all Linux distributions?