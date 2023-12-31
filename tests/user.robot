*** Settings ***
Documentation       Criação, pesquisa, atualizção e remoção de usuários

Resource            ../resources/base.resource

*** Test Cases ***
Deve retornar todos os usuários cadastrados
    [Documentation]    Retornar uma lista com todos os usuários cadastrados
    [Tags]             get_all

    ${response}    ${quantity}    GET All User

    ${is_greater}    Evaluate    ${quantity} > 0

    Should Be True    ${is_greater}
    Log    Total de Usuários é: ${quantity}

    Validate Status Code    200

Deve retornar um usuário pelo o ID
    [Documentation]    Retorna um usuário expecifico
    [Tags]    user_not

    ${response}    GET User Not Found    fb1b3aa281ba

    Validate Message    Usuário não encontrado

    Validate Status Code    400

Deve cadastrar um novo usuário
    [Documentation]    Cadastro de um novo usuário
    [Tags]             create

    ${user}    Get Fixture    create_user

    ${response}    POST New User    ${user}

    ${user_id}    Set Variable    ${response["_id"]}

    Validate Message    Cadastro realizado com sucesso

    Log    ID do usuário cadastrado: ${user_id}    

    Validate Status Code    201

    ${response}    DELETE User    ${user}    ${user_id}

    Validate Message    Registro excluído com sucesso

    Validate Status Code    200

Não pode cadastrar usuário com e-mail existente
    [Documentation]    Cadastro de um novo usuário
    [Tags]             duplicate

    ${user}    Get Fixture    create_user

    ${response}    POST New User    ${user}

    ${user_id}    Set Variable    ${response["_id"]}

    Validate Message    Cadastro realizado com sucesso

    Log    ID do usuário cadastrado: ${user_id}    

    Validate Status Code    201

    ${response}    POST Duplicate E-mail    ${user}

    Validate Message    Este email já está sendo usado

    Validate Status Code    400

    ${response}    DELETE User    ${user}    ${user_id}

    Validate Message    Registro excluído com sucesso

    Validate Status Code    200

Deve atualizar os dados do usuário
    [Documentation]    Atualização de um usuário existente
    [Tags]             update

    ${user}    Get Fixture    update_user

    ${response}    POST New User    ${user}

    Validate Message    Cadastro realizado com sucesso

    Validate Status Code    201

    ${user_id}    Set Variable    ${response["_id"]}

    ${response}    PUT Update User    ${user}    ${user_id}

    Validate Message    Registro alterado com sucesso

    Validate Status Code    200

    ${response}    DELETE User    ${user}    ${user_id}

    Validate Message    Registro excluído com sucesso

    Validate Status Code    200    

Remoção de usuário
    [Documentation]    Remoção de usuários cadastrados
    [Tags]             del

    ${user}    Get Fixture    create_user

    ${response}    POST New User    ${user}

    Validate Message    Cadastro realizado com sucesso

    Validate Status Code    201

    ${user_id}    Set Variable    ${response["_id"]}

    ${response}    DELETE User    ${user}    ${user_id}

    Validate Message    Registro excluído com sucesso

    Validate Status Code    200

# Deve criar usuário com os campo obrigatórios sem preencher
#    [Documentation]    Atualização de um usuário existente
#    [Tags]    create_empty

#    ${user}    Get Fixture    create_user

#    ${response}    POST Empty Field    ${user}

#    Name Field Cannot Be Empty    nome é obrigatório
#    Email Field Cannot Be Empty    email é obrigatório
#    Passoword Field Cannot Be Empty    password é obrigatório
#    Admin Field Cannot Be Empty    administrador é obrigatório

#    Validate Status Code    400

# Deve atualizar com os campo obrigatórios sem preencher
#    [Documentation]    Atualização de um usuário existente
#    [Tags]    update_empty

#    ${user}    Get Fixture    update_user

#    ${response}    POST New User    ${user}

#    Validate Message    Cadastro realizado com sucesso

#    Validate Status Code    201

#    ${user_id}    Set Variable    ${response["_id"]}

#    ${response}    Update Clean Empty    ${user}    ${user_id}

#    Name Field Cannot Be Empty    nome é obrigatório
#    Email Field Cannot Be Empty    email é obrigatório
#    Passoword Field Cannot Be Empty    password é obrigatório
#    Admin Field Cannot Be Empty    administrador é obrigatório

#    Validate Status Code    400
