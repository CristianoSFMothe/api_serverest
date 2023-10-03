*** Settings ***
Documentation        Cenários de criação, pesquisa, atualização e deleção

Resource    ../../base.resource

*** Variables ***
&{HEADERS}    Content-Type=application/json

*** Keywords ***
GET All User

    ${response}        GET    ${BASE_URL}/usuarios
    ...                headers=${HEADERS}
    ...                expected_status=any 

    ${data}            Set Variable    ${response.json()}
    ${user_list}       Set Variable    ${data["usuarios"]}

    ${quantity}        Set Variable    0  

    FOR    ${user}    IN    @{user_list}
        ${quantity}    Evaluate    ${quantity} + 1
    END

    [Return]            ${response}    ${quantity}


GET One User
    [Arguments]    ${id_user}

    ${response}        GET    ${BASE_URL}/usuarios/${id_user}
    ...                headers=${HEADERS}
    ...                expected_status=any 

    [Return]           ${response} 

GET User Not Found
    [Arguments]    ${id_user}

    ${response}        GET    ${BASE_URL}/usuarios/${id_user}
    ...                headers=${HEADERS}
    ...                expected_status=any    
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    [Return]           ${response} 


POST New User
    [Arguments]    ${user}    

    ${response}        POST    ${BASE_URL}/usuarios
    ...                json=${user}[create]
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    ${user_id}  Set Variable  ${response["_id"]}
    
    Log    User created with ID: ${user_id}

    [Return]    ${response}

POST Duplicate E-mail
    [Arguments]    ${user}
    
    ${response}        POST    ${BASE_URL}/usuarios
    ...                json=${user}[duplicate]
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    [Return]    ${response}

PUT Update User
    [Arguments]    ${user}    ${user_id} 

    ${response}    PUT    ${BASE_URL}/usuarios/${user_id}
    ...            json=${user}[update]
    ...            headers=${HEADERS}
    ...            expected_status=any    
    
    ${response}         Set Variable    ${response.json()}  

    ${message}          Get From Dictionary    ${response}    message 
    Set Suite Variable  ${message}

    [Return]            ${response}

Update Clean Empty
    [Arguments]        ${user}    ${user_id}

    ${response}    PUT    ${BASE_URL}/usuarios/${user_id}
    ...            json=${user}[clean]
    ...            headers=${HEADERS}
    ...            expected_status=any    
    
    ${response}         Set Variable    ${response.json()}      

    ${message}          Get From Dictionary    ${response}    message 
    Set Suite Variable  ${message}

    ${nome}               Get From Dictionary    ${response}    nome 
    Set Suite Variable    ${nome}

    Log To Console    ${nome}

    ${password}             Get From Dictionary    ${response}    password 
    Set Suite Variable      ${password}

    ${email}              Get From Dictionary    ${response}    email 
    Set Suite Variable    ${email}

    ${administrador}        Get From Dictionary    ${response}    administrador 
    Set Suite Variable      ${administrador}

    [Return]            ${response}



