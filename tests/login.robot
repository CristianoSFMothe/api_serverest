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

Não deve pode loga com usuário invalido
    [Documentation]        Logar com usuário existente
    [Tags]                 invalid

    ${user}    Get Fixture    user    authentication     

    Login Invalid User Or Passoword    ${user}
    
    Validate Message    Email e/ou senha inválidos  

    Validate Status Code    401

Não deve logar com campos vazios
    [Documentation]        Logar com usuário existente
    [Tags]                 clean

    ${user}    Create Dictionary
    ...        email=${EMPTY}
    ...        password=${EMPTY}
    
    ${response}    Clean Empty    ${user}   

    Validate Error Response    ${response} 

    Validate Status Code    400




    




    


