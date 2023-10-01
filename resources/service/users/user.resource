# *** Settings ***
# Documentation        Cenários de criação, pesquisa, atualização e deleção

# Resource    ../../base.resource

# *** Variables ***
# &{HEADERS}    Content-Type=application/json


# *** Keywords ***

# Login Invalid User Or Passoword
#     [Arguments]        ${payload}

#     Set Suite Variable    ${payload}        

#     Set Variable    ${payload}

#     ${response}        POST    ${BASE_URL}/login
#     ...                json=${payload}
#     ...                headers=${HEADERS}
#     ...                expected_status=any
    
#     ${response}         Set Variable           ${response.json()}  

#     ${message}              Get From Dictionary    ${response}    message 
#     Set Suite Variable      ${message}

#     [Return]    ${response}


# GET All User

#     ${response}        GET    ${BASE_URL}/usuarios

#     ${data}            Set Variable    ${response.json()}
#     ${user_list}       Set Variable    ${data["usuarios"]}

#     ${quantity}        Set Variable    0  # Inicializa a contagem

#     FOR    ${user}    IN    @{user_list}
#         ${quantity}    Evaluate    ${quantity} + 1
#     END

#     [Return]            ${response}    ${quantity}


# GET One User
#     [Arguments]    ${id_user}

#     ${response}        GET    ${BASE_URL}/usuarios/${id_user}

#     [Return]           ${response} 


# POST New User
#     [Arguments]    ${payload}

#     Set Suite Variable    ${payload}        

#     Set Variable    ${payload}

#     ${response}        POST    ${BASE_URL}/usuarios
#     ...                json=${payload}
#     ...                headers=${HEADERS}
#     ...                expected_status=any
    
#     ${response}         Set Variable           ${response.json()}  

#     ${message}           Get From Dictionary    ${response}    message 
#     ${message_expect}    Set Variable      ${response['message}  

#     ${user_id}  Set Variable  ${response['_id']}
    
#     Log    User created with ID: ${user_id}

#     [Return]    ${response}

# PUT Update User
#     [Arguments]    ${payload}

#     ${response}    POST New User       ${payload}

#     ${user_id}          Set Variable    ${response["_id"]}

#     Log           User ID: ${user_id}

#     ${response}        PUT    ${BASE_URL}/usuarios/${user_id}
#     ...                json=${payload}
#     ...                headers=${HEADERS}
#     ...                expected_status=any
    
#     ${response}         Set Variable    ${response.json()}  

#     ${message}          Get From Dictionary    ${response}    message 
#     Set Suite Variable  ${message}
    

#     [Return]            ${response}


    

    






   


