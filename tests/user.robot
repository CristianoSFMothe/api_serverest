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

# Deve atualizar os dados do usuário
#     [Documentation]        Atualização de um usuário existente
#     [Tags]                 update

#     ${user}    Get Fixture    user    

#     ${response}    PUT Update User    ${user}

    

    
   


    




    


