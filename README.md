# dotfiles

Minimal Linux development environment. Chezmoi-managed.

## Install

```bash
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply 0xAndrii
```

## Tools

```
helix       Text editor with LSP
ripgrep     Search
eza         Better ls
dust        Disk usage
zellij      Terminal multiplexer
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

Edit `.chezmoiscripts/run_once_00-install-packages.sh.tmpl`, then `chezmoi apply`.

---

*Less is more.*