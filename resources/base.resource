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
    [Arguments]    ${file_name}   
    ${data}    Load Json From File
    ...        ${EXECDIR}/resources/fixtures/${file_name}.json
    ...        encoding=utf-8
    
    [Return]    ${data}

Validate Status Code
    [Arguments]        ${status_code}    

    Status Should Be    ${status_code}

Validate Message
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${message}

    Should Be Equal          ${actual_message}      ${expected_message}

Email Field Cannot Be Empty
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${email}

    Should Be Equal          ${actual_message}      ${expected_message}
Password Field Cannot Be Empty
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${password}

    Should Be Equal          ${actual_message}      ${expected_message}

Name Field Cannot Be Empty
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${nome}

    Should Be Equal          ${actual_message}      ${expected_message}
    
Admin Field Cannot Be Empty
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${administrador}

    Should Be Equal          ${actual_message}      ${expected_message}
    
