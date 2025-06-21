# GitHub Workflows

Automated version management for tools in `.chezmoidata.yaml`.

## Workflows

### check-versions.yml
Checks for new tool versions daily.
- Queries GitHub/npm APIs
- Compares with current versions
- Outputs available updates

### update-registry.yml
Creates PRs for version updates.
- Runs check-versions first
- Updates `.chezmoidata.yaml`
- Creates PR with changes

### validate-registry.yml
Validates `.chezmoidata.yaml` structure.
- Checks required fields
- Validates version patterns
- Runs on PR/push

## Usage

```bash
# Check for updates
gh workflow run check-versions.yml

# Create update PR
gh workflow run update-registry.yml
```

## Setup

Create required labels:
```bash
gh label create dependencies --color 0366d6
gh label create automated --color fbca04
```

## Flow

```
Daily Check → Updates Found → PR Created → Review → Merge
```

Users get updates via `chezmoi update`.