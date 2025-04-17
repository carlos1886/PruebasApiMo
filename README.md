Este proyecto contiene pruebas automatizadas utilizando **Robot Framework** para validar los servicios RESTful de la API pública de [https://reqres.in](https://reqres.in).

## Descripcion ##

Se automatizan dos casos de prueba principales:

1. **Crear usuario exitosamente (POST)**  
   Realiza una solicitud `POST` a `/api/users` enviando datos de un usuario y valida que la respuesta contenga los datos enviados, un `id` generado y una marca de tiempo (`createdAt`).

2. **Obtener lista de usuarios (GET)**  
   Realiza una solicitud `GET` a `/api/users` y valida que se reciba una lista de usuarios, además de verificar que el primer usuario contenga los campos esperados (`id`, `email`, `first_name`, `last_name`, `avatar`).

## Requisitos ##

- [Python 3.8+](https://www.python.org/)
- [pip](https://pip.pypa.io/)
- [Robot Framework](https://robotframework.org/)
- Librerías adicionales:

## Instalacion de Dependencias ##
- pip install robotframework
- pip install robotframework-requestsç

## Ejecución de las pruebas ##

- robot tests/reqres_api_tests.robot

##  Variables configurables ##

${BASE_URL}        https://reqres.in
${NAME}            Carlos Arizabaleta
${EMAIL}           carlos.arizabaleta@reqres.in
${JOB}             QA AUTOMATION
...

## Autor ##
Carlos Arizabaleta







