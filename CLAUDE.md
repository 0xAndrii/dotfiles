# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a minimalist dotfiles repository managed by Chezmoi, focused on essential developer tools with clean configurations.

## Key Commands

### Chezmoi Operations
- `chezmoi apply` - Apply dotfile changes to the system
- `chezmoi diff` - Preview changes before applying
- `chezmoi add <file>` - Add a file to be managed by Chezmoi
- `chezmoi edit <file>` - Edit a managed file
- `chezmoi update` - Pull latest changes and apply them

### Testing Changes
- Preview: `chezmoi diff`
- Apply: `chezmoi apply`

## Architecture

### Directory Structure
- **Root files**: `.chezmoi.toml.tmpl` (config template), `.chezmoiignore` (ignore patterns)
- **`.chezmoiscripts/`**: Single installation script for essential tools
- **`dot_*` files/directories**: Map to `~/.*` in the home directory
- **`dot_config/helix/`**: Helix editor configuration

### Minimal Tool Set
The repository configures only essential tools:
- **Helix**: Modern text editor (minimal config)
- **Ripgrep**: Fast code search
- **Eza**: Better ls with colors
- **Dust**: Disk usage analyzer
- **Zellij**: Terminal multiplexer (minimal config)
- **Bash**: Clean configuration (115 lines)

## Development Guidelines

### Adding New Dotfiles
1. Add the file to your home directory first
2. Use `chezmoi add ~/.filename` to start managing it
3. If the file needs templating, use `chezmoi add --template ~/.filename`
4. Edit with `chezmoi edit ~/.filename` to add template variables

### Modifying Installation Scripts
- Scripts in `.chezmoiscripts/` run in alphabetical order
- Prefix with `run_once_` to ensure idempotency
- Use the existing logging functions: `info()`, `warning()`, `error()`
- Always check for existing installations before downloading/installing

### Testing Script Changes
1. Test individual scripts: `bash .chezmoiscripts/scriptname.sh`
2. Test full apply: `chezmoi apply --verbose --dry-run`
3. Check specific files: `chezmoi diff ~/.filename`

## Important Patterns

### Error Handling
All scripts use `set -e` to fail on errors. When adding commands that might fail acceptably, use `|| true`.

### OS Detection
```bash
if [[ "$ID" == "ubuntu" ]] || [[ "$ID" == "debian" ]]; then
    # Debian-based commands
elif [[ "$ID" == "fedora" ]]; then
    # Fedora commands
elif [[ "$ID" == "arch" ]]; then
    # Arch commands
fi
```

### Architecture Detection
```bash
ARCH=$(uname -m)
if [[ "$ARCH" == "x86_64" ]]; then
    # x86_64 specific
elif [[ "$ARCH" == "aarch64" ]]; then
    # ARM64 specific
fi
```

### Package Installation Pattern
Always check if a package exists before installing:
```bash
if ! command -v toolname &> /dev/null; then
    info "Installing toolname..."
    # Installation commands
fi
```