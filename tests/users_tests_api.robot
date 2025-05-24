*** Settings ***
Resource    ../resources/api_resources.robot
Resource    ../resources/api_keywords.robot
Library     Collections
Library     OperatingSystem

*** Test Cases ***
Teste GET para lista de usuários
# robot --outputdir results --log log.html --console verbose --consolewidth 120 tests/users_tests_api.robot
    [Tags]    regressao    get
    
    Criar Sessão API
    ${response}=    Enviar Requisição GET    ${GET_USERS_ENDPOINT}
    Validar Status Code    ${response}    200
    Should Not Be Empty    ${response.json()}

Teste POST - Criar Novo Usuario
# robot -d results -i post tests/users_tests_api.robot
    [Documentation]    Testa a criação de um usuário via POST
    [Tags]    regressao    post    

   Criar Sessão API
    ${response}=    Enviar Requisição POST    ${POST_USERS_ENDPOINT}    ${POST_USER_PAYLOAD}
    Validar Resposta POST    ${response}

Teste PUT - Atualizar Usuario
    [Documentation]    Testa a atualização de um usuário via PUT
    [Tags]    regressao    put

    Criar Sessão API
    &{usuario_atualizado}=    Create Dictionary    name=Leanne Graham    email=Sincere@april.biz.br
    ${response}=    PUT On Session    api_session    ${PUT_USERS_ENDPOINT}    json=${usuario_atualizado}    headers=${HEADERS}

    Validar Resposta PUT    ${response}
    Log    Resposta da atualização: ${response.json()}