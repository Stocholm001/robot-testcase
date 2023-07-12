*** Settings ***
Resource    ..//1.setting/1.setting.robot

*** Test Cases ***

open web portol
    Open admin portal
    Maximize Browser Window

    Test login fail

    #Close Browser
