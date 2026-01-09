### Bash Battle Arena – Level 3: Conditional Statements

**Concepts Learned**
- Bash `if / else / fi` conditionals
- File test operator `-f`
- Script execution permissions with `chmod +x`

**Script**
```bash
#!/bin/bash

if [ -f hero.txt ]; then
  echo "Hero found!"
else
  echo "Hero missing!"
fi
