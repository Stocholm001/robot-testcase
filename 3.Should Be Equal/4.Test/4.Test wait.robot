*** Settings ***
Resource    ..//1.setting/1.setting.robot

*** Test Cases ***

open web portol
    Open admin portal
    Maximize Browser Window


test login
    ${actual_status}=    Login    ${username}    ${password}
    ${expec ted_status}    Set Variable    Swag L
    Should Be Equal    ${actual_status}    ${expec ted_status}
    

