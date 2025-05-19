*** Variables ***
# Configurações básicas
${BASE_URL}             https://jsonplaceholder.typicode.com
${TIMEOUT}              10

# Endpoints
${GET_USERS_ENDPOINT}   /users
${POST_USERS_ENDPOINT}  /users
${PUT_USERS_ENDPOINT}   /users/1

# Payloads
&{POST_USER_PAYLOAD}    name=Test User    username=testuser    email=testuser@example.com


# Headers
&{HEADERS}              Content-Type=application/json