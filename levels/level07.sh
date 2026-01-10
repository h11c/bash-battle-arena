### Bash Battle Arena – Level 7: File Sorting Script

**Concepts Learned**
- Listing files in long format using `ls -l`
- File globbing with `*.txt`
- Sorting command output using `sort`
- Numeric sorting with `-n`
- Column-based sorting using `-k`
- Chaining commands with pipes (`|`)
- Suppressing error output with `2>/dev/null`

**Script**
```bash
#!/bin/bash

ls -l *.txt 2>/dev/null | sort -k5 -n
