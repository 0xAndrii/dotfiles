# dotfiles

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

## Versions

Tool versions and metadata are managed in `.chezmoidata.yaml`.

Structure:
```yaml
tools:
  toolname:
    description: "Tool description"
    type: github  # or npm
    repo: owner/repo  # for github
    version: "1.0.0"
```

Automated updates: See [docs/automation.md](docs/automation.md)

---

_Less is more._
