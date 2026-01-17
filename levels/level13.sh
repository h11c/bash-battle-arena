#!/bin/bash

# Backup Script with Rotation
# Creates a backup of a source directory and keeps only the latest 5 backups

# Source directory to back up
SRC_DIR="source_folder"

# Destination directory for backups
DEST_DIR="backups"

# Number of backups to keep
KEEP_COUNT=5

# Ensure backup directory exists
mkdir -p "$DEST_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup file name
BACKUP_FILE="$DEST_DIR/source_folder_$TIMESTAMP.tar.gz"

# Create the backup archive
tar -czf "$BACKUP_FILE" "$SRC_DIR"

echo "Backup created: $BACKUP_FILE"

# Remove old backups (keep only the latest 5)
ls -1t "$DEST_DIR"/source_folder_*.tar.gz | tail -n +$((KEEP_COUNT + 1)) | while read -r old_backup; do
  rm "$old_backup"
  echo "Deleted old backup: $old_backup"
done
