# GitHub Workflows

Automated tool version management using GitHub Actions.

## Workflow Overview

```
.github/workflows/
├── check-versions.yml    # Check for tool updates
├── update-registry.yml   # Create update PRs
└── validate-registry.yml # Validate registry integrity
```

## Workflows

### check-versions.yml

Checks for new versions of all tools in the registry.

**Triggers**:
- Daily at 9 AM UTC
- Manual dispatch
- Called by update-registry workflow

**Process**:
1. Queries GitHub releases API for `github` type tools
2. Queries npm registry for `npm` type tools
3. Compares with current versions in `.chezmoidata.yaml`
4. Outputs list of available updates

**Features**:
- Retry logic for API failures
- Parallel version checking
- Detailed summary in workflow run

### update-registry.yml

Creates pull requests for tool updates.

**Triggers**:
- Daily at 9 AM UTC
- Manual dispatch

**Process**:
1. Calls check-versions workflow
2. Updates `.chezmoidata.yaml` with new versions
3. Creates PR with update summary
4. Labels PR with `dependencies` and `automated`

**PR Format**:
```
Title: chore(deps): bump tool versions - YYYY-MM-DD
Branch: update-tools-YYYY-MM-DD-{run_number}
```

### validate-registry.yml

Validates the structure and content of `.chezmoidata.yaml`.

**Triggers**:
- Pull requests modifying `.chezmoidata.yaml`
- Pushes to `.chezmoidata.yaml`
- Manual dispatch

**Validation**:
- Required fields presence
- Type-specific field validation
- Version pattern matching
- YAML syntax checking

## Manual Operations

```bash
# Check for updates
gh workflow run check-versions.yml

# Create update PR
gh workflow run update-registry.yml

# Validate registry
gh workflow run validate-registry.yml
```

## Update Flow

```
Daily Check → Updates Found → PR Created → Human Review → Merge
     ↓              ↓              ↓             ↓          ↓
check-versions  update-registry  GitHub      Developer  chezmoi update
```

## Configuration

### Registry Structure

Tools are defined in `.chezmoidata.yaml`:

```yaml
tools:
  toolname:
    type: github|npm
    repo: owner/repo      # for github
    package: pkg-name     # for npm
    version: "1.0.0"
    pattern: "^[0-9]+\\.[0-9]+\\.[0-9]+$"
```

### Required Labels

Create these labels in your repository:
- `dependencies` - For update PRs
- `automated` - For automated PRs

```bash
gh label create dependencies --color 0366d6
gh label create automated --color fbca04
```

## Architecture Decisions

- **Separation of Concerns**: Each workflow has a single responsibility
- **Human Review**: All updates require manual approval
- **Idempotency**: Workflows can be run multiple times safely
- **Error Handling**: Graceful degradation with clear error reporting