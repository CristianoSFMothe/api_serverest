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

    

    [Return]    ${response}


Validate Error Response
    [Arguments]    ${response_json}

    ${expected_error}    Set Variable    
    ...    "email": "email não pode ficar em branco",
    ...    "password": "password não pode ficar em branco"
     

    Run Keyword If    'email' in ${expected_error}    
    ...    Validate Error Key    ${response_json}    
    ...    email    ${expected_error['email']}
    
    Run Keyword If    'password' in ${expected_error}    
    ...    Validate Error Key    ${response_json}    
    ...    password    ${expected_error['password']}

Validate Error Key
    [Arguments]    ${response_json}    ${key}    ${expected_value}

    ${actual_value}    Get From Dictionary    ${response_json}    ${key}
    Should Be Equal As Strings    ${actual_value}    ${expected_value}









    



    

    






   


