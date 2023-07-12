*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

TC001 LOGIN

    Openweb
    LOGIN    ${Username}    ${Password}
    Maximize Browser Window

    
    Click Element    ${TC05}[shopping cart link]
    Click Element    ${TC07}[Click checkout]

    Input Text    id=first-name    ${FIRSTNAME}
    Input Text    id=last-name     ${LASTNAME}
    Input Text    id=postal-code   ${POSTALCODE}

    Scroll Element Into View    id=continue
    Click Element    id=continue

    Scroll Element Into View    id=finish
    Click Element    id=finish
    Wait Until Page Contains    Your cart is empty!

