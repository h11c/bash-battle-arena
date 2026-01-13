#!/bin/bash

# Default values
DIR="${1:-.}"
THRESHOLD="${2:-70}"

# Get disk usage percentage for the filesystem containing the directory
USAGE=$(df -h "$DIR" | tail -1 | awk '{print $5}' | tr -d '%')

# Compare usage to threshold and output result
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "ALERT: Disk usage is ${USAGE}% (threshold ${THRESHOLD}%) for ${DIR}"
else
  echo "OK: Disk usage is ${USAGE}% (threshold ${THRESHOLD}%) for ${DIR}"
fi
