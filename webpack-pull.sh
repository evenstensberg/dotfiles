#!/bin/bash

# Pull the latest changes from remote for every repository inside the `backup` directory.

BACKUP_DIR="$(pwd)/backup"

if [ ! -d "$BACKUP_DIR" ]; then
  echo "Error: backup directory not found at $BACKUP_DIR"
  echo "Run webpack-backup.sh first to clone the repositories."
  exit 1
fi

for repo_dir in "$BACKUP_DIR"/*/; do
  if [ -d "$repo_dir/.git" ]; then
    repo_name=$(basename "$repo_dir")
    echo "Pulling $repo_name ..."
    git -C "$repo_dir" pull --ff-only 2>&1 || echo "Warning: pull failed for $repo_name"
  fi
done

echo "Done."
