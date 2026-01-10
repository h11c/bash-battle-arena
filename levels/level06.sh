### Bash Battle Arena – Level 6: Argument Parsing

**Concepts Learned**
- Positional parameters (`$1`)
- Checking for missing arguments using `-z`
- Counting lines with `wc -l`
- Importance of quoting variables in Bash

**Script**
```bash
#!/bin/bash

if [ -z "$1" ]; then
  echo "No file provided"
else
  wc -l "$1"
fi
