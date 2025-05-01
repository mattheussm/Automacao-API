*** Settings ***
Resource    ../resources/api_resources.robot
Resource    ../resources/api_endpoints.robot
Resource    ../resources/api_keywords.robot

*** Test Cases ***
Teste GET para lista de usuários
# robot --outputdir results --log log.html --console verbose --consolewidth 120 tests/users_tests_api.robot
    Criar Sessão API
    ${response}=    GET On Session    json_api    ${USERS_ENDPOINT}
    Validar Status Code    ${response}
    ${primeiro_usuario}=    Extrair Primeiro Usuário    ${response}
    Log    Detalhes do usuário: ${primeiro_usuario}