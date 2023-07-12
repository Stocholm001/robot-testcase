*** Settings ***
Resource    ..//1.setting/1.setting.robot

*** Test Cases ***

open web portol
    Open admin portal
    Maximize Browser Window

login test
    ${condition}    Evaluate    '${username}' == 'fdglk;jdfhgj'
    Run Keyword If    ${condition}    Input login 1    
    ...    ELSE    run keywords    Input login 2        
    
    
    Close Browser
