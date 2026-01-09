### Bash Battle Arena – Level 5: Boss Battle

**Concepts Combined**
- Directory creation (`mkdir -p`)
- File creation (`touch`)
- Conditional checks with `if [ -f ]`
- Moving files with `mv`
- Verifying filesystem state with `ls`

**Script**
```bash
#!/bin/bash

mkdir -p Battlefield
touch Battlefield/knight.txt Battlefield/sorcerer.txt Battlefield/rogue.txt

if [ -f Battlefield/knight.txt ]; then
  mkdir -p Archive
  mv Battlefield/knight.txt Archive/
fi

echo "Battlefield contents:"
ls Battlefield

echo ""
echo "Archive contents:"
ls Archive
