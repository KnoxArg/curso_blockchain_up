# Ejercicio Final

Una compañía organiza un hackaton donde financia con ETH ideas a llevar a cabo. 

Por ejemplo, una compañía cuenta con un jurado de 4 personas y para aprobar el financiamiento, la idea debe contrar con un 75% de aprobación (3 de 4).

El Smart Contract en este repositorio, se inicializa con las direcciones de los jueces y la cantidad de votos requeridos para aprobar una idea.

Luego se cargan las ideas disponibles, la dirección del beneficiario y los ETH para financiar esa idea. El parametro "value" se encuentra en wei.

Cuando las aprobaciones lleguen al 75%, los fondos de la idea se envían al beneficiario.

Se hizo un deploy en la siguiente dirección: 

https://rinkeby.etherscan.io/tx/0xed0accfe90992a971cd16aaf1ef883ab64df0464f8365586696796512d64c5af

Los parámetros del constructor necesitaban estar ABI-Encoded para poder verificar el código fuente asi que se usó esto  https://abi.hashex.org/