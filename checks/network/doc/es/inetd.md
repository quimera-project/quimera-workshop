# 🛰️ Configuración de inetd

## Valor devuelto
Se devuelve una tabla con las configuraciones del demonio inetd.

*Campos*:
- **SERVICE**: Nombre del servicio.
- **TYPE**: Tipo de socket asociado a ese servicio.
- **PROTOCOL**: Protocolo que recibe el socket.
- **WAIT**: Indica si se debe de atender las peticiones en forma de multihilo (nowait) o unihilo (wait).
- **USER**: Nombre del usuario bajo el cual se va a ejecutar el programa que atiende el servicio.
- **PROGRAM**: Ruta del programa a ejecutar.
- **PARAMS**: Parámetros del programa a ejecutar.

La información se obtiene del archivo `/etc/inetd.conf`.

## ¿Qué contiene este archivo?
Este archivo contiene la configuración del servicio inetd. Esta configuración será la encargada de elegir qué programas ejecutar dado las características de la petición recibida.

## ¿Qué es Inetd?
Conocido normalmente como el "superservidor de red". Es un demonio encargado de elegir qué servicios ofrecer cuando se recibe una conexión con ciertas características concretas especificadas en el archivo */etc/inetd.conf*.

## ¿De qué sirve esta información para escalar privilegios?
Es interesante conocer cómo está configurado el demonio inetd a la hora de aceptar peticiones según qué protocolo, servicio y tipo de socket. Puede servir para ampliar el conocimiento de la respuesta de la máquina y para descubrir servicios no expuestos.

## Ver también
- [Xinetd configuration](xinetd)
- [Xinetd files](xinetds)

## Referencias
- [Manual](https://nxmnpg.lemoda.net/5/inetd.conf)