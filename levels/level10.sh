### Bash Battle Arena – Level 10: Boss Battle 2 – Intermediate Scripting

**Concepts Combined**
- Directory and file creation
- Loops and random number generation
- Writing dynamic content to files
- Sorting files by size
- Searching file contents with `grep`
- Conditional file movement

**Script**
```bash
#!/bin/bash

mkdir -p Arena_Boss
mkdir -p Victory_Archive

for i in {1..5}; do
  FILE="Arena_Boss/file$i.txt"
  LINES=$((RANDOM % 11 + 10))
  > "$FILE"

  for ((j=1; j<=LINES; j++)); do
    if (( RANDOM % 20 == 0 )); then
      echo "Victory" >> "$FILE"
    else
      echo "Line $j of file $i" >> "$FILE"
    fi
  done
done

echo "Files sorted by size:"
ls -l Arena_Boss/*.txt | sort -k5 -n

for FILE in Arena_Boss/*.txt; do
  if grep -q "Victory" "$FILE"; then
    mv "$FILE" Victory_Archive/
  fi
done

echo "Files moved to Victory_Archive:"
ls Victory_Archive 2>/dev/null
