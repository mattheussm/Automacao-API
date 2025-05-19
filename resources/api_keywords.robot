*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    SeleniumLibrary

Resource    ../resources/api_resources.robot

*** Keywords ***
Criar Sessão API
    [Documentation]    Cria uma sessão HTTP para a API
    Create Session    api_session    ${BASE_URL}    timeout=${TIMEOUT}
    Log    Sessão API criada com sucesso    level=DEBUG

Enviar Requisição GET
    [Arguments]    ${endpoint}
    ${response}=    GET On Session    api_session    ${endpoint}
    RETURN    ${response}

Enviar Requisição POST
    [Arguments]    ${endpoint}    ${payload}
    ${response}=    POST On Session    api_session    ${endpoint}    json=${payload}    headers=${HEADERS}
    RETURN    ${response}

Validar Status Code
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}

Validar Resposta POST
    [Arguments]    ${response}
    Validar Status Code    ${response}    201
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    id
    Log    ID do novo usuário: ${json}[id]    level=INFO

Enviar Requisicao PUT
    [Arguments]    ${payload}    ${endpoint}
    ${response}=    PUT On Session    api_session    ${endpoint}    json=${payload}    headers=${HEADERS}
    RETURN    ${response}

Validar Resposta PUT
    [Arguments]    ${response}
    Validar Status Code    ${response}    200
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    id



