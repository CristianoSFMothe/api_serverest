*** Settings ***
Documentation        Cenário para Autenticação

Resource        ../resources/base.resource

*** Test Cases ***
Deve pode loga com usuário pré-cadastrado
    [Documentation]        Logar com usuário existente
    [Tags]                 login

    ${user}    Get Fixture    auth     

    POST User Session    ${user}

    Validate Message    Login realizado com sucesso   

    Validate Status Code    200

Não deve pode loga com usuário invalido
    [Documentation]        Logar com usuário existente
    [Tags]                 invalid

    ${user}    Get Fixture    auth     

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
    
    Login Email Field Cannot Be Empty      email não pode ficar em branco
    Login Password Field Cannot Be Empty          password não pode ficar em branco

    Validate Status Code    400
    



    




    


