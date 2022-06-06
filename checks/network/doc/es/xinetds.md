# 🛰️ Archivos xinetd

## Valor devuelto
Se devuelve una lista con los contenidos de los archivos que contiene el directorio */etc/xinetd.d/*.

## ¿Qué contienen este archivo?
Estos archivos contienen distintos parámetros de configuración del servicio xinetd. Estos parámetros afectan a la configuración del servicio una vez este es iniciado. Para que vuelvan a tener efecto, si son modificados hay que volver a reiniciar el servicio.

## ¿Qué es Xinetd?
Se trata de un demonio que controla y configura el acceso diferentes servicios de red. Si el servicio de red está controlado por xinetd, cualquier petición a dicho servicio es gestionada por xinetd. El demonio comprueba si se aprueba dicha petición según la configuración especificada en los archivos (*/etc/xinetd.conf* y aquellos situados bajo el directorio */etc/xined.d/*).

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer cómo está configurado el servicio xinetd a la hora de aceptar peticiones. Puede servir para ampliar el conocimiento de la respuesta de la máquina y para descubrir servicios no expuestos.

## Ver también
- [Inetd configuration](inetd)
- [Xinetd configuration](xinetd)

## Referencias
- [Manual](https://linux.die.net/man/5/xinetd.conf)