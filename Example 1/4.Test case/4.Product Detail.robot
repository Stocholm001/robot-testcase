*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

TC004 Product Detail

    Openweb
    LOGIN    ${Username}    ${Password}
    Maximize Browser Window
    Sleep    2s
    
    Click Element    ${TC04}[Produck02]
    Page Should Contain    Sauce Labs Bike Light
    Page Should Contain      "A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included."
