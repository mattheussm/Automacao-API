*** Settings ***
Library    RequestsLibrary
Library    Collections

Resource    ../resources/api_resources.robot

*** Keywords ***
Criar Sessão API
    Create Session    json_api    ${BASE_URL}    timeout=${DEFAULT_TIMEOUT}

Validar Status Code
    [Arguments]    ${response}    ${expected_status}=200
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}

Extrair Primeiro Usuário
    [Arguments]    ${response}
    ${json}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${json}
    RETURN    ${json[0]}