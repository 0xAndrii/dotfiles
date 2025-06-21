# dotfiles

Minimal Linux development environment. Chezmoi-managed.

## Install

```bash
sh -c "$(curl -fsLS chezmoi.io/get)" -- -b /tmp/bin init --apply 0xAndrii
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
chezmoi diff
chezmoi apply
```

## Versions

Edit `.chezmoidata.yaml`, then `chezmoi apply`.

---

*Less is more.*