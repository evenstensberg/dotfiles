#!/bin/bash

# Clone all repositories (public and private) from the webpack GitHub organization
# into a local `backup` directory.

BACKUP_DIR="$(pwd)/backup"
ORG="webpack"
PER_PAGE=100

mkdir -p "$BACKUP_DIR"

# gh repo list --limit is capped at 1000; adjust PER_PAGE for larger orgs.
repos=$(gh repo list "$ORG" --limit "$PER_PAGE" --json nameWithOwner --jq '.[].nameWithOwner' 2>/dev/null)

while IFS= read -r repo; do
  repo_name="${repo#*/}"
  target="$BACKUP_DIR/$repo_name"

  if [ -d "$target" ]; then
    echo "Skipping $repo_name (already cloned)"
  else
    echo "Cloning $repo ..."
    gh repo clone "$repo" "$target"
  fi
done <<< "$repos"

echo "Done. Repositories are in $BACKUP_DIR"
