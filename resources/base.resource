*** Settings ***
Documentation        Arquivo com as configurações basica entre as suite de teste

Library        RequestsLibrary
Library        Collections
Library        JSONLibrary

Resource       env.resource
Resource       service/users/auth.resource
Resource       service/users/user.resource


*** Keywords ***

Get Fixture
    [Arguments]    ${file_name}    ${scenario}

    ${data}    Load Json From File
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8
    
    [Return]    ${data}[${scenario}]

Validate Status Code
    [Arguments]        ${status_code}    

    Status Should Be    ${status_code}

Validate Message
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${message}

    Should Be Equal          ${actual_message}      ${expected_message}
