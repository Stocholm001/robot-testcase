*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

TC002 Failed Login

    Openweb
    Maximize Browser Window
    LOGIN    ${UserFaild}    ${PasswordFaild}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service