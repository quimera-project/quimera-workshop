# 🗂️ Archivos y directorios críticos con permisos de escritura

## Return Value
A list of key-value pairs with the file or directory with write permissions and the description for escalating privileges is returned.

## What use is this information to escalate privileges?
Some of these files or directories are critical if they contain write permissions. An attacker could use them to write the corresponding payload in each one and be able to elevate privileges.