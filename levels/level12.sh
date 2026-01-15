#!/bin/bash

# Configuration file to read
CONFIG_FILE="settings.conf"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: Configuration file '$CONFIG_FILE' does not exist."
  exit 1
fi

# Read the configuration file line by line
# IFS='=' splits each line into key and value at the '=' character
while IFS='=' read -r key value; do
  echo "Key: $key, Value: $value"
done < "$CONFIG_FILE"
