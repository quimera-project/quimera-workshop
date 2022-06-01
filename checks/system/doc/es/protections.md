# 💻 Protecciones del sistema

## Valor devuelto
Se devuelve una lista con respuestas a preguntas sobre protecciones del sistema.

*Preguntas*:
**Is SELinux enabled?**: Devuelve si el módulo de seguridad SELinux se encuentra habilitado. Puede devolver en qué modo se encuentra habilitado.
**Is AppArmor enabled?**: Devuelve si el módulo de seguridad AppArmor se encuentra habilitado. Aunque no esté habilitado, se puede devolver si se han encontrado ciertos perfiles.
**Is ASLR enabled?**:  
**Is Execshield enabled?**: 
**Is Grsecurity present?**: 
**Are PaX binaries present?**: 

## ¿Qué es SELinux?
SELinux es un módulo de seguridad de Linux que realiza la función de **MAC** (Sistema de Control de acceso Obligatorio). Este sistema de control complementa al tradicional sistema **DAC** (Sistema de Control de acceso Discrecional) de Linux. Por cada llamada del sistema realizada, SELinux es el encargado de decidir si el proceso correspondiente está autorizado para realizar dicha acción. Para tomar esta decisión, cada proceso contiene un contexto de seguridad. Este contexto depende del usuario que lance dicho proceso, de su rol y de su dominio. Para averiguar el contexto de seguridad de un proceso, se puede hacer uso de la flag **z** del comando **ps**.

```bash
# Ejemplo de salida del comando "ps axZ | grep vstfpd"
# El primer campo contiene la identidad, el rol, el dominio y el nivel MCS separados por dos puntos.
system_u:system_r:ftpd_t:s0   2094 ?    Ss  0:00 /usr/sbin/vsftpd
```

## ¿Qué es AppArmor?
AppArmor es un módulo de seguridad de Linux que realiza la función de **MAC** (Sistema de Control de acceso Obligatorio). Este sistema de control complementa al tradicional sistema **DAC** (Sistema de Control de acceso Discrecional) de Linux. Por cada llamada del sistema realizada, AppArmor es el encargado de decidir si el proceso correspondiente está autorizado para realizar dicha acción. Para tomar esta decisión, cada proceso tendrá una serie de reglas recogidas en un perfil (MAC) aplicados por el kernel. La configuración de los perfiles se encuentra en la carpeta */etc/apparmor.d*.

## ¿Qué es ASRL?
ASRL es una protección que permite proteger al sistema frente a ciertos ataques de **Buffer Overflow**. 

# Referencias
- [AppArmor](https://apparmor.net/)
- [Debian Handbook AppArmor](https://debian-handbook.info/browse/stable/sect.apparmor.html)
- [Debian Handbook SELinux](https://debian-handbook.info/browse/stable/sect.selinux.html)
- [SELinux](https://selinuxproject.org/page/Main_Page)
