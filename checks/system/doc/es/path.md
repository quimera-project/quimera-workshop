# 💻 PATH

## Valor devuelto
Se devuelve una tabla con los diferentes directorios del PATH del usuario.

*Campos*:
- **LOCATION**: Directorio en el PATH.
- **PERMISSIONS**: Permisos del directorio.
- **USER**: Usuario al que pertenece dicho directorio.
- **GROUP**: Grupo al que pertenece dicho directorio.

La información se obtiene de la variable `PATH`.

## ¿De qué sirve esta información para escalar privilegios?
Si algún directorio de los que se encuentran el la variable PATH tiene permisos de escritura, un atacante podría aprovecharse para intentar inyectar librerías y/o binarios mailiciosos.

## Referencias
- [HackingArticles](https://www.hackingarticles.in/linux-privilege-escalation-using-path-variable/)
