*** Settings ***
Documentation        Cenário para Autenticação

Resource        ../resources/base.resource

*** Test Cases ***
Deve pode loga com usuário pré-cadastrado
    [Documentation]        Logar com usuário existente
    [Tags]                 login

    ${user}    Get Fixture    user    authentication     

    POST User Session    ${user}

    Validate Message    Login realizado com sucesso   

    Validate Status Code    200


    




    


