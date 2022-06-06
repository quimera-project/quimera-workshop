# 🗂️ Archivos con permisos SGID

## Valor devuelto
Se devuelve una tabla con los diferentes archivos del sistema que contienen el permiso SGID.

*Campos*:
- **FILE**: Archivo con permiso SGID.
- **PERMISSIONS**: Permisos del archivo.
- **LINKS**: Número de links del archivo.
- **USER**: Usuario al que pertenece dicho archivo.
- **GROUP**: Grupo al que pertenece dicho archivo (y en este caso, el grupo cuyos privilegios se obtendrían al ejecutar el archivo).
- **SIZE**: Tamaño del archivo.
- **DATE**: Fecha de la última modificación del archivo.
- **INFO**: Información adicional sobre el archivo. Algunos serán vulnerables solo en versiones específicas de ciertos sistemas operativos, otros serán fichero comunes, de otros no se tendrá información y algunos serán provablemente vulnerables.

## ¿Qué es SGID?
"Set Group ID" en inglés.

El permiso SGID, a diferencia de SUID, afecta tanto a archivos como a carpetas. Cuando se trata de un archivo, es equivalente al permiso SUID: si dicho archivo es ejecutado, lo hará con los permisos equivalentes al grupo que corresponda. Sin embargo, si se trata de una carpeta, todos los archivos que se creen en dicha carpeta, serán creados con el grupo perteneciente al SGID de la carpeta, independientemente del grupo del usuario que cree dicho archivo.

## ¿Cómo se especifica?
Para que un archivo sea ejecutable por cualquier grupo con tus propios permisos, se deberá de hace uso del comando `chmod g+s [archivo]` o `chmod 2755 [archivo]`.

Si dicho archivo contiene el permiso SGID, se especificará en la salida del comando `ls -l [archivo]`.
```bash
# Ejemplo de salida del comando "ls -l /usr/bin/crontab"
-rwxr-sr-x 1 root crontab 43568 Feb 22  2021 /usr/bin/crontab
```

Se observa como dicho archivo contiene la letra 's' en el permiso de ejecución del grupo. Por lo tanto, cuando dicho binario se ejecute, se ejecutará con permisos del grupo al que pertenece, en este caso crontab.

Es interesante diferenciar la flag 's', la cual implica el permiso SUID a la vez que el permiso de ejecución y la flag 'S' que indica que solamente está activado el permiso SUID y no el permiso de ejecución.

## ¿Cómo encuentro archivos con SGID?
Usando el comando find, existen dos maneras:
```bash
find / -perm -2000 2>/dev/null
find / -perm -g=s 2>/dev/null
```

## ¿Cuáles interesan para escalar privilegios?
Puedes echar un vistazo a la siguiente lista:
- [GFTOBINS](https://gtfobins.github.io/#+suid)

## Ver también
- [SUID files](SUID)

## Referencias
- [Hacking Articles](https://www.hackingarticles.in/linux-privilege-escalation-using-suid-binaries/)
- [Linux Handbook](https://linuxhandbook.com/suid-sgid-sticky-bit/)
- [Cyber Sophia](https://cybersophia.net/training/special-permissions-in-linux)