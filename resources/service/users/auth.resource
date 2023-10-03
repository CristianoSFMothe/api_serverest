*** Settings ***
Documentation        Autenticação na API

Resource    ../../base.resource

*** Variables ***
&{HEADERS}    Content-Type=application/json

*** Keywords ***
POST User Session
    [Arguments]        ${user}     

    ${response}        POST    ${BASE_URL}/login
    ...                json=${user}[user]
    ...                headers=${HEADERS}
    ...                expected_status=any

    ${response}         Set Variable           ${response.json()}     

    ${token}    Get From Dictionary    ${response}    authorization
    Set Suite Variable    ${token}   

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}   

    [Return]    ${response}


Login Invalid User Or Passoword
    [Arguments]        ${user}   

    ${response}        POST    ${BASE_URL}/login
    ...                json=${user}[invalid]
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${message}              Get From Dictionary    ${response}    message 
    Set Suite Variable      ${message}

    [Return]    ${response}

Clean Empty
    [Arguments]        ${user}   

    ${response}        POST    ${BASE_URL}/login
    ...                json=${user}
    ...                headers=${HEADERS}
    ...                expected_status=any
    
    ${response}         Set Variable           ${response.json()}  

    ${email}              Get From Dictionary    ${response}    email 
    Set Suite Variable      ${email}

    ${password}              Get From Dictionary    ${response}    password 
    Set Suite Variable      ${password}  

    [Return]    ${response}

Login Email Field Cannot Be Empty
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${email}

    Should Be Equal          ${actual_message}      ${expected_message}
Login Password Field Cannot Be Empty
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${password}

    Should Be Equal          ${actual_message}      ${expected_message}
    












    



    

    






   


