*** Settings ***
Documentation        Criação, pesquisa, atualizção e remoção de usuários

Resource        ../resources/base.resource

*** Test Cases ***

Deve retornar todos os usuários cadastrados
    [Documentation]    Retornar uma lista com todos os usuários cadastrados
    [Tags]    get_all
    
    ${response}    ${quantity}    GET All User    
    
    ${is_greater}    Evaluate    ${quantity} > 0

    Should Be True    ${is_greater}
    Log    Total de Usuários é: ${quantity}

    Validate Status Code    200


Deve retornar um usuário pelo o ID
    [Documentation]        Retorna um usuário expecifico
    [Tags]                 get_one

    ${response}    GET One User    0uxuPY0cbmQhpEz1
    
    Validate Status Code    200

Usuário não encontrado
    [Documentation]        Retorna um usuário expecifico
    [Tags]                 user_not

    ${response}    GET User Not Found    0uxuPY0cbmQhpEz2

    Validate Message        Usuário não encontrado
    
    Validate Status Code    400

Deve cadastrar um novo usuário
    [Documentation]        Cadastro de um novo usuário
    [Tags]                 create

    ${user}    Get Fixture    create_user     

    ${response}    POST New User    ${user}

    ${user_id}        Set Variable    ${response["_id"]}

    Validate Message    Cadastro realizado com sucesso

    Log    ID do usuário cadastrado: ${user_id}    

    Validate Status Code    201

Não pode cadastrar usuário com e-mail existente
    [Documentation]        Cadastro de um novo usuário
    [Tags]                 duplicate

    ${user}    Get Fixture    create_user    

    ${response}    POST Duplicate E-mail    ${user}

    Validate Message    Este email já está sendo usado  

    Validate Status Code    400

Deve atualizar os dados do usuário
    [Documentation]        Atualização de um usuário existente
    [Tags]                 update

    ${user}    Get Fixture    update_user    

    ${response}    POST New User    ${user}

    Validate Message    Cadastro realizado com sucesso

    Validate Status Code    201

    ${user_id}        Set Variable    ${response["_id"]}   

    ${response}    PUT Update User    ${user}    ${user_id}

    Validate Message    Registro alterado com sucesso

    Validate Status Code    200

Deve atualizar com os campo obrigatórios sem preencher
    [Documentation]        Atualização de um usuário existente
    [Tags]                 update_empty

    ${user}    Get Fixture    update_user    

    ${response}    POST New User    ${user}

    Validate Message    Cadastro realizado com sucesso

    Validate Status Code    201

    ${user_id}        Set Variable    ${response["_id"]}   

    ${response}    PUT Update User    ${user}    ${user_id}

    Name Field Cannot Be Empty        nome é obrigatório
    Email Field Cannot Be Empty       email é obrigatório
    Password Field Cannot Be Empty    password é obrigatório
    Admin Field Cannot Be Empty       administrador é obrigatório

    Validate Status Code    400


