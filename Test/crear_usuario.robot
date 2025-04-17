*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${BASE_URL}        https://reqres.in
${NAME}            Carlos Arizabaleta
${EMAIL}           carlos.arizabaleta@reqres.in
${JOB}             QA AUTOMATION
${PHONE}           1234567898
${ADDRESS}         Transversal 1 # 12-07
${EMAIL_GET}       carlos.arizabaleta@reqres.in
${NAME_GET}        Carlos
${LAST_NAME_GET}   Arizabaleta
${AVATAR_GET}      https://reqres.in/img/faces/1-image.jpg
${ID}    4

*** Test Cases ***
Crear usuario exitosamente
    [Documentation]    Prueba de creación de usuario con POST y validación de respuesta.

    # Crear sesión correctamente
    Create Session    https://reqres.in/    ${BASE_URL}

    # Datos del usuario
    ${data}=    Create Dictionary    name=${NAME}    job=${JOB}    email=${EMAIL}     phone=${PHONE}    address=${ADDRESS}

    # Hacer POST (usando alias de sesión 'reqres' y ruta relativa)
    ${response}=    POST    https://reqres.in/api/users    json=${data}

    # Verificar código de estado
    Should Be Equal As Numbers    ${response.status_code}    201

   # Extraer el cuerpo y convertirlo en diccionario
    ${json}=    Set Variable    ${response.json()}


    # Validaciones
    Dictionary Should Contain Item    ${json}    name          ${NAME}
    Dictionary Should Contain Item    ${json}    job           ${JOB}
    Dictionary Should Contain Item    ${json}    email         ${EMAIL}
    Dictionary Should Contain Item    ${json}    phone         ${PHONE}
    Dictionary Should Contain Item    ${json}    address       ${ADDRESS}
    Dictionary Should Contain Key     ${json}    id
    Dictionary Should Contain Key     ${json}    createdAt

    # Mostrar en consola
    Log To Console    Usuario creado con ID: ${json['id']}



Obtener Lista De Usuarios
    [Documentation]    Prueba de obtener usuarios con método GET

    Create Session    reqres    ${BASE_URL}

    ${response}=    Get Request    reqres    /api/users

    Should Be Equal As Numbers    ${response.status_code}    200

    ${json}=    To Json    ${response.content}

    # Validar que contenga la lista de usuarios
    Dictionary Should Contain Key    ${json}    data

    # Verificar primer usuario
    ${first_user}=    Get From List    ${json['data']}    0
    Dictionary Should Contain Key    ${first_user}    id
    Dictionary Should Contain Key    ${first_user}    email
    Dictionary Should Contain Key    ${first_user}    first_name
    Dictionary Should Contain Key    ${first_user}    last_name
    Dictionary Should Contain Key    ${first_user}    avatar
