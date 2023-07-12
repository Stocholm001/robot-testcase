*** Settings ***
Library    RequestsLibrary


*** Variables ***

${URL}    http://localhost:3000
${HEADER}    {'Content-Type':'application/json'}
${BODY}    {
...    "prod_name":"Imobile",
...    "pord_desc":"top new",
...    "prod_price":"2000"
...    }

*** Test Cases ***
Check POST method
    Create Session    api    ${URL}    headers=${HEADER}
    ${response}=    POST On Session    api    /products    data=${BODY}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200