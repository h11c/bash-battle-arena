### Bash Battle Arena – Level 9: Script to Monitor Directory Changes

**Concepts Learned**
- Monitoring filesystem changes using `inotifywait`
- Event-driven scripting (reacting to changes instead of polling)
- Logging output to a file
- Adding timestamps to logs
- Validating script input and directories

**Script**
```bash
#!/bin/bash

WATCH_DIR="$1"
LOG_FILE="change_log.txt"

if [ -z "$WATCH_DIR" ]; then
  echo "No directory provided"
  exit 1
fi

if [ ! -d "$WATCH_DIR" ]; then
  echo "Directory does not exist."
  exit 1
fi

echo "Monitoring directory: $WATCH_DIR"
echo "Logging changes to $LOG_FILE"

echo "$(date '+%Y-%m-%d %H:%M:%S') Monitoring started: $WATCH_DIR" >> "$LOG_FILE"

inotifywait -m -r -e create,modify,delete \
  --timefmt '%Y-%m-%d %H:%M:%S' \
  --format '%T %e: %w%f' \
  "$WATCH_DIR" >> "$LOG_FILE"
