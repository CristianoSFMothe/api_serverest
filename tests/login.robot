*** Settings ***
Documentation        Cenário para Autenticação

Resource        ../resources/base.resource


*** Test Cases ***
Deve pode loga com usuário pré-cadastrado
    [Documentation]        Logar com usuário existente
    [Tags]                 login

    ${payload}        Factory Auth User

    ${response}        POST Auth API    login    ${payload}

