*** Settings ***
Documentation        Autenticação na API

Resource    ../../base.resource

*** Variables ***
&{HEADERS}    Content-Type=application/json


*** Keywords ***
POST User Session
    [Arguments]        ${user}     

    ${response}        POST    ${BASE_URL}/login
    ...                json=${user}
    ...                headers=${HEADERS}
    ...                expected_status=any

    ${response}         Set Variable           ${response.json()}    

    ${token}    Get From Dictionary    ${response}    authorization
    Set Suite Variable    ${token}
    
    # ${response}         Set Variable           ${response.json()}

    # ${token}               Get From Dictionary    ${response}  authorization    
    # Set Suite Variable     ${token}    

    # ${message}              Get From Dictionary    ${response}    message 
    # Set Suite Variable      ${message}

    [Return]    ${response}





    

    






   


