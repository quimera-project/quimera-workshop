# 🗂️ Archivos con permisos SUID

## Valor devuelto
Se devuelve una tabla con los diferentes archivos del sistema que contienen el permiso SUID.

*Campos*:
- **FILE**: Archivo con permiso SUID.
- **PERMISSIONS**: Permisos del archivo.
- **LINKS**: Número de links del archivo.
- **USER**: Usuario al que pertenece dicho archivo (y en este caso, el usuario cuyos privilegios se obtendrían al ejecutar el archivo).
- **GROUP**: Grupo al que pertenece dicho archivo.
- **SIZE**: Tamaño del archivo.
- **DATE**: Fecha de la última modificación del archivo.
- **INFO**: Información adicional sobre el archivo. Algunos serán vulnerables solo en versiones específicas de ciertos sistemas operativos, otros serán fichero comunes, de otros no se tendrá información y algunos serán provablemente vulnerables.

# ¿Qué es SUID?
"Set User ID" en inglés.

No es más que un tipo de permiso el cual permite ejecutar el archivo que lo contenga con los mismos privilegios del usuario al que pertenece (si dicho archivo contiene permisos de ejecución para el usuario actual).

El ejemplo más claro es el archivo */bin/passwd*. Este archivo, perteneciente al usuario root, siempre contiene el permiso SUID. Esto es necesario ya que, cualquier usuario que quiera cambiar su contraseña, deberá de almacenar el nuevo hash en el archivo */etc/shadow*. Este archivo es solamente manipulable por root. Gracias al permiso SUID, un usuario cualquiera puede conseguir permisos de root unicamente para ejecutar el binario /bin/passwd de tal forma que pueda guardar su hash de su nueva contraseña en */etc/shadow*.

Normalmente existen diferentes binarios como el comentado anteriormente que suelen contener este permiso activado. Se deberá encontrar aquellos que permitan escalada de privilegios. Un ejemplo es el binario */bin/cp*. Si dicho binario permite ejecutarse como root, el usuario podrá copiar lo que el quiera con máximos privilegios y poder conseguir así leer cualquier archivo e incluso manipular archivos existentes.

# ¿Cómo se especifica?
Para que un archivo sea ejecutable por cualquier usuario con tus propios permisos, se deberá de hace uso del comando `chmod u+s [archivo]` o `chmod 4755 [archivo]`.

Si dicho archivo contiene el permiso SUID, se especificará en la salida del comando `ls -l [archivo]`.
```bash
# Ejemplo de salida del comando "ls -l /bin/passwd"
-rwsr-xr-x 1 root root 63960 Feb  7  2020 /bin/passwd
```

Se observa como dicho archivo contiene la flag 's' en el permiso de ejecución del usuario. Por lo tanto, cuando dicho binario se ejecute, se ejecutará con permisos del usuario al que pertenece, en este caso root.

Es interesante diferenciar la flag 's', la cual implica el permiso SUID a la vez que el permiso de ejecución y la flag 'S' que indica que solamente está activado el permiso SUID y no el permiso de ejecución.

# ¿Cómo encuentro archivos con SUID?
Usando el comando find, existen dos maneras:
```bash
find / -type f -perm -4000 2>/dev/null
find / -type f -perm -u=s 2>/dev/null
```

# ¿Cuáles interesan para escalar privilegios?
Puedes echar un vistazo a la siguiente lista:
- [GFTOBINS](https://gtfobins.github.io/#+suid)

# Ver también
- [SGID files](SGID)

# Referencias
- [Hacking Articles](https://www.hackingarticles.in/linux-privilege-escalation-using-suid-binaries/)
- [Linux Handbook](https://linuxhandbook.com/suid-sgid-sticky-bit/)