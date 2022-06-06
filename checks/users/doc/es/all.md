# 👥 Todos los usuarios

## Valor devuelto
Se devuelve una tabla con los diferentes usuarios del sistema.

*Campos*:
- **USER**: Nombre del usuario.
- **UID**: ID del usuario.
- **GID**: ID del grupo del usuario.
- **GROUPS**: Grupos a los que pertenece el usuario.

La información se obtiene del archivo `/etc/passwd` y del comando `id`.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante tener una vista general de todos los usuarios del sistema, cuales son los grupos de cada uno y cómo dichos grupos están relacionados. A su vez, puede ser relevante observar qué grupos son vulnerables a escalada de privilegios y qué usuarios contienen privilegios de root.

## Ver también
- [Current logged users](current)
- [Last logged users](last)
- [Superusers](superusers)
- [Users last logon](last_logon)
- [Users with a console](console)

## Referencias
- [Manual (/etc/passwd)](https://www.man7.org/linux/man-pages/man5/passwd.5.html)
- [Manual (id)](https://www.man7.org/linux/man-pages/man1/id.1.html)
