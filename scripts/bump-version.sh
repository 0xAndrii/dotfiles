#!/bin/bash
# Version bump script for dotfiles

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Get current version
CURRENT_VERSION=$(cat VERSION)
echo "Current version: $CURRENT_VERSION"

# Parse version components
IFS='.' read -ra VERSION_PARTS <<< "$CURRENT_VERSION"
MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

# Get bump type
BUMP_TYPE=${1:-patch}

# Calculate new version
case $BUMP_TYPE in
    major)
        NEW_VERSION="$((MAJOR + 1)).0.0"
        ;;
    minor)
        NEW_VERSION="${MAJOR}.$((MINOR + 1)).0"
        ;;
    patch)
        NEW_VERSION="${MAJOR}.${MINOR}.$((PATCH + 1))"
        ;;
    *)
        echo "Usage: $0 [major|minor|patch]"
        exit 1
        ;;
esac

echo -e "${YELLOW}New version will be: $NEW_VERSION${NC}"
read -p "Continue? [y/N] " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted"
    exit 1
fi

# Update VERSION file
echo "$NEW_VERSION" > VERSION

# Commit version bump
git add VERSION
git commit -m "chore: bump version to v$NEW_VERSION"

# Create and push tag
git tag "v$NEW_VERSION" -m "Release v$NEW_VERSION"

echo -e "${GREEN}✓ Version bumped to $NEW_VERSION${NC}"
echo -e "${GREEN}✓ Tag v$NEW_VERSION created${NC}"
echo
echo "To push the tag and trigger release:"
echo "  git push origin main"
echo "  git push origin v$NEW_VERSION"