*** Settings ***
Library   RequestsLibrary


*** Variables ***
${HOST}    http://localhost:3000
${HEADER}    {'Content-Type': 'application/json'}


*** Test Cases ***
Check GET method
    Create Session    api    ${HOST}    headers=${HEADER}
    ${response}=    GET On Session    api    /products/64a1641f18c458b49d821238
    Should Be Equal As Strings    ${response.status_code}    200