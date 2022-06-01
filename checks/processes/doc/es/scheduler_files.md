# 📟 Task scheduler files

## Valor devuelto
Se devuelve una tabla con los diferentes archivos de tareas programadas.

*Campos*:
- **FILE**: Archivo de tareas programadas.
- **PERMISSIONS**: Permisos del archivo.
- **LINKS**: Número de links del archivo.
- **USER**: Usuario al que pertenece dicho archivo.
- **GROUP**: Grupo al que pertenece dicho archivo.
- **SIZE**: Tamaño del archivo.
- **DATE**: Fecha de la última modificación del archivo.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante saber si alguno de estos archivos contiene permisos de escritura. De esta forma un atacante podría aprovecharse para escribir acciones maliciosas ejecutadas en nombre de otro usuario.

## Ver también
- [Scheduler jobs](jobs)
- [Task scheduler tools](schedulers)

## Referencias
- [Cron jobs tutorial](https://www.hostinger.com/tutorials/cron-job)
- [Manual (Anacron)](https://www.man7.org/linux/man-pages/man8/anacron.8.html)
- [Manual (At)](https://linux.die.net/man/1/at)
- [Manual (Cron)](https://www.man7.org/linux/man-pages/man8/cron.8.html)
- [Manual (Crontab)](https://www.man7.org/linux/man-pages/man5/crontab.5.html)
- [Manual (Incron)](https://linux.die.net/man/5/incrontab)
- [Steflan](https://steflan-security.com/linux-privilege-escalation-scheduled-tasks/)