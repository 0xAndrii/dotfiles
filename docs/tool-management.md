# Tool Management

This document describes how to add or remove tools from the dotfiles repository.

## Adding a Tool

### 1. Update Registry

Add the tool to `.chezmoidata.yaml`:

```yaml
tools:
  toolname:
    description: "Brief description"
    type: github  # or npm
    repo: owner/repo  # for github
    package: package-name  # for npm
    version: "1.0.0"
    pattern: "^[0-9]+\\.[0-9]+\\.[0-9]+$"  # version regex
```

### 2. Add Installation Logic

Locate the appropriate installation script in `.chezmoiscripts/`:
- Core tools: `run_onchange_02-install-tools.sh.tmpl`
- Python tools: `run_onchange_03-install-python.sh.tmpl`
- Language servers: `run_onchange_04-install-lsp.sh.tmpl`

Add installation code following the existing pattern:

```bash
# Tool name
if ! command -v toolcmd &> /dev/null || [[ $(toolcmd --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1) != "${TOOL_VERSION}" ]]; then
    echo "  → Installing Tool v${TOOL_VERSION}..."
    # Installation commands
    echo -e "  ${GREEN}✓${NC} Tool installed"
else
    echo -e "  ${GREEN}✓${NC} Tool already up to date"
fi
```

### 3. Test Installation

```bash
chezmoi diff  # Preview changes
chezmoi apply # Apply changes
```

### 4. Update Documentation

Add the tool to the tools list in `README.md` if it's user-facing.

## Removing a Tool

### 1. Remove from Registry

Delete the tool entry from `.chezmoidata.yaml`.

### 2. Remove Installation Logic

Remove the installation block from the appropriate script in `.chezmoiscripts/`.

### 3. Clean Up

- Remove any configuration files (e.g., `dot_config/toolname/`)
- Update `README.md` to remove references
- Search for any remaining references: `rg toolname`

## Testing Changes

### Local Testing

```bash
# Test individual script
bash .chezmoiscripts/scriptname.sh

# Test full installation
chezmoi apply --dry-run --verbose
```

### Version Updates

The automated workflows will detect new versions daily. To manually check:

```bash
gh workflow run check-versions.yml
```

## Guidelines

- Prefer direct binary downloads from GitHub releases
- Install to `~/.local/bin` (no sudo required)
- Always include version checking to avoid redundant installs
- Follow the existing patterns for consistency
- Keep configurations minimal