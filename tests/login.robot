*** Settings ***
Documentation        Cenário para Autenticação

Resource        ../resources/base.resource

*** Test Cases ***
Deve pode loga com usuário pré-cadastrado
    [Documentation]        Logar com usuário existente
    [Tags]                 login

    ${payload}        Factory Auth User

    ${response}        POST Auth API    login    ${payload}

    Validate Message    Login realizado com sucesso   

    Validate Status Code    200


Não poder logar com usuário ou senha inválido
    [Documentation]        Login usuário ou senha invválid
    [Tags]                 fall

    ${payload}    Factory Login Invalid User Or Password
  
    ${response}    Login Invalid User Or Passoword    Login    ${payload}

    Validate Message    Email e/ou senha inválidos   

    Validate Status Code    401


