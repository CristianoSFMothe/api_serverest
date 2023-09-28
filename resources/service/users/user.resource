*** Settings ***
Documentation        Autenticação na API

Resource    ../../base.resource

*** Variables ***
&{HEADERS}    Content-Type=application/json


*** Keywords ***
POST Auth API
    [Arguments]        ${route}    ${payload}

    Set Suite Variable    ${payload}        

    Set Variable    ${payload}

    ${response}        POST    ${BASE_URL}/${route}
    ...                json=${payload}
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}

    ${token}               Get From Dictionary    ${response}  authorization    
    Set Suite Variable     ${token}    

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    [Return]    ${response}


Login Invalid User Or Passoword
    [Arguments]        ${route}    ${payload}

    Set Suite Variable    ${payload}        

    Set Variable    ${payload}

    ${response}        POST    ${BASE_URL}/${route}
    ...                json=${payload}
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    [Return]    ${response}


GET All User
    [Arguments]        ${route}

    ${response}        GET    ${BASE_URL}/${route}

    ${data}            Set Variable    ${response.json()}
    ${user_list}       Set Variable    ${data["usuarios"]}

    ${quantity}        Set Variable    0  # Inicializa a contagem

    FOR    ${user}    IN    @{user_list}
        ${quantity}    Evaluate    ${quantity} + 1
    END

    [Return]            ${response}    ${quantity}


GET One User
    [Arguments]    ${route}    ${id_user}

    ${response}        GET    ${BASE_URL}/${route}/${id_user}

    [Return]           ${response} 


POST New User
    [Arguments]    ${route}    ${payload}

    Set Suite Variable    ${payload}        

    Set Variable    ${payload}

    ${response}        POST    ${BASE_URL}/${route}
    ...                json=${payload}
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    ${user_id}             Get From Dictionary    ${response}    _id
    Set Suite Variable      ${user_id}

    [Return]    ${response}






   


