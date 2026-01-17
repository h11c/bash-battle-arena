#!/bin/bash

# Level 15 – Boss Battle 3: Advanced Scripting
# Combines menu handling, backups with rotation, and config parsing

ARENA_DIR="Arena"
BACKUP_DIR="backups"
KEEP_COUNT=3
CONFIG_FILE="settings.conf"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

backup_arena() {
  if [ ! -d "$ARENA_DIR" ]; then
    echo "ERROR: Arena directory '$ARENA_DIR' not found."
    return
  fi

  TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
  BACKUP_FILE="$BACKUP_DIR/Arena_$TIMESTAMP.tar.gz"

  tar -czf "$BACKUP_FILE" "$ARENA_DIR"
  echo "Backup created: $BACKUP_FILE"

  # Rotation: keep only last 3 backups
  ls -1t "$BACKUP_DIR"/Arena_*.tar.gz | tail -n +$((KEEP_COUNT + 1)) | while read -r old_backup; do
    rm "$old_backup"
    echo "Deleted old backup: $old_backup"
  done
}

parse_config() {
  if [ ! -f "$CONFIG_FILE" ]; then
    echo "ERROR: Config file '$CONFIG_FILE' not found."
    return
  fi

  while IFS='=' read -r key value; do
    [ -z "$key" ] && continue
    echo "Key: $key, Value: $value"
  done < "$CONFIG_FILE"
}

while true; do
  echo "=============================="
  echo " Boss Battle 3 - Main Menu"
  echo "=============================="
  echo "1) Check disk space"
  echo "2) Show system uptime"
  echo "3) Backup Arena directory (keep last 3)"
  echo "4) Parse settings.conf"
  echo "0) Exit"
  echo "------------------------------"

  read -r -p "Choose an option: " choice
  echo

  case "$choice" in
    1)
      df -h
      ;;
    2)
      uptime
      ;;
    3)
      backup_arena
      ;;
    4)
      parse_config
      ;;
    0)
      echo "Exiting. Bye."
      break
      ;;
    *)
      echo "Invalid option."
      ;;
  esac

  echo
  read -r -p "Press Enter to return to menu..." _
  echo
done
