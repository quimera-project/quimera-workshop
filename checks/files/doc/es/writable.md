# 🗂️ Critical writable directories or files

## Valor devuelto
Se devuelve una lista con pares clave-valor con el archivo o directorio con permisos de escritura y la descripción para escalar privilegios.

## ¿De qué sirve esta información para escalar privilegios?
Algunos de estos archivos o directorios son críticos si contienen permisos de escritura. Un atacante podría utilizarlos para escribir en cada uno el payload correspondiente y poder elevar privilegios.