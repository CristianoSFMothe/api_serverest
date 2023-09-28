*** Settings ***
Documentation        Autenticação na API

Resource    ../base.resource

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

