*** Settings ***
Library    RequestsLibrary


*** Variables ***
${HOST}    http://localhost:3000
${HEADER}    {'Content-Type': 'application/json'}

*** Test Cases ***
Check DELETE method
    
    Create Session    api    ${HOST}    headers=${HEADER}
    ${id_to_delete}=    Set Variable    64a1696818c458b49d821240
    ${response}=    DELETE On Session    api    /products/${id_to_delete}
    Should Be Equal As Strings    ${response.status_code}    200
