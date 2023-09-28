*** Settings ***
Documentation        Arquivo com as configurações basica entre as suite de teste

Library        RequestsLibrary
Library        Collections
Library        factories/user.py

Resource             env.resource
Resource             service/users/user.resource


*** Keywords ***
Validate Status Code
    [Arguments]        ${status_code}

    Status Should Be    ${status_code}

Validate Message
    [Arguments]        ${expected_message}

    ${actual_message}       Set Variable           ${message}

    Should Be Equal          ${actual_message}      ${expected_message}
