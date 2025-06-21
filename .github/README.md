# GitHub Automation

This directory contains automation for keeping tool versions up to date.

## GitHub Actions

`workflows/update-versions.yml` checks all tools daily and creates PRs when updates are available.

### Adding a new GitHub release tool
1. Add version to `.chezmoidata.yaml`:
   ```yaml
   newtool: "1.0.0"
   ```
2. Add to workflow in both arrays:
   ```bash
   current_versions[newtool]=$(yq '.versions.newtool' .chezmoidata.yaml)
   repos[newtool]="owner/repo"
   ```

### Adding a new npm package
1. Add version to `.chezmoidata.yaml`:
   ```yaml
   newpackage: "1.0.0"
   ```
2. Add to workflow:
   ```bash
   current_versions[newpackage]=$(yq '.versions.newpackage' .chezmoidata.yaml)
   npm_packages[newpackage]="package-name"
   ```

### Removing a tool
1. Remove from `.chezmoidata.yaml`
2. Remove from corresponding array in the workflow (repos or npm_packages)

## How it works

1. **Daily checks** at 9 AM UTC
2. **Reads versions** from `.chezmoidata.yaml` 
3. **Checks** both GitHub releases and npm registry
4. **Creates PR** if updates found
5. **Single PR** with all updates

The workflow handles:
- Version prefixes (v1.0.0 vs 1.0.0) automatically
- Both GitHub releases and npm packages in one workflow