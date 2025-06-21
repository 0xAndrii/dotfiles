# dotfiles

Minimal Linux development environment. Chezmoi-managed.

## Install

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply 0xAndrii
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
```

## Versions

Edit `.chezmoidata.yaml`, then `chezmoi apply`.

---

_Less is more._
