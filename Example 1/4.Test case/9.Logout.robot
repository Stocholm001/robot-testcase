*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

TC001 LOGIN

    Openweb
    LOGIN    ${Username}    ${Password}
    Maximize Browser Window
    LOGOUT
    Wait Until Page Contains    Accepted usernames are
    



    

