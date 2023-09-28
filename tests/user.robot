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


Deve retornar todos os usuários cadastrados
    [Documentation]    Retornar uma lista com todos os usuários cadastrados
    [Tags]    get_all
    
    ${response}    ${quantity}    GET All User    usuarios
    
    ${is_greater}    Evaluate    ${quantity} > 0

    Should Be True    ${is_greater}
    Log    Total de Usuários é: ${quantity}

    Validate Status Code    200

Deve retornar um usuário pelo o ID
    [Documentation]        Retorna um usuário expecifico
    [Tags]                 get_one

    ${response}    GET One User    usuarios    0uxuPY0cbmQhpEz1
    
    Validate Status Code    200


    


