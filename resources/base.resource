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

Name Field Cannot Be Empty
    [Arguments]        ${expected_message_name}

    ${actual_message_name}       Set Variable           ${nome}

    Should Be Equal          ${actual_message_name}      ${expected_message_name}

Email Field Cannot Be Empty
    [Arguments]        ${expected_message_email}

    ${actual_message_email}       Set Variable           ${email}

    Should Be Equal          ${actual_message_email}      ${expected_message_email}

Passoword Field Cannot Be Empty
    [Arguments]        ${expected_message_password}

    ${actual_message_password}       Set Variable           ${password}

    Should Be Equal          ${actual_message_password}      ${expected_message_password}
    
Admin Field Cannot Be Empty
    [Arguments]        ${expected_message_admin}

    ${actual_message_admin}       Set Variable           ${administrador}

    Should Be Equal          ${actual_message_admin}      ${expected_message_admin}
    
