## Format
```
ls *.scad util/*.scad |  xargs -I {} sh -c 'openscad-format --force --input {}'
```