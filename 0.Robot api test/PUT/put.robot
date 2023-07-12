*** Settings ***
Library   RequestsLibrary


*** Variables ***
${HOST}    http://localhost:3000
${HEADER}    {'Content-Type': 'application/json'}


*** Test Cases ***
Check PUT method
    # Create Session
    Create Session    api    ${HOST}    headers=${HEADER}
    ${id_to_update}=    Set Variable    64a1641f18c458b49d821238
    ${body_data}=    Set Variable    {"prod_desc":"test"}
    ${response}=    PUT On Session    api    /products/${id_to_update}    data=${body_data}
    Should Be Equal As Strings    ${response.status_code}    200

