### Bash Battle Arena – Level 8: Multi-File Searcher

**Concepts Learned**
- Searching text with `grep`
- Using `-l` to return filenames only
- Handling script arguments
- Searching across multiple files using globbing
- Suppressing error output with `2>/dev/null`

**Script**
```bash
#!/bin/bash

if [ -z "$1" ]; then
  echo "No search term provided"
  exit 1
fi

grep -l "$1" *.log 2>/dev/null
