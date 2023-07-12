*** Settings ***
Resource    ../1.setting/1.setting.robot


*** Keywords ***

Open admin portal
   SeleniumLibrary.Open Browser    browser=gc
   SeleniumLibrary.Go To    https://www.saucedemo.com/

Login
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}
    Press Keys    id=password   ${password}    ENTER



Input login 1
    SeleniumLibrary.Input Text    ${Screen login}[username]    ${username}
    SeleniumLibrary.Press Keys    ${Screen login}[password]    ${Password}    ENTER

Input login 2
    SeleniumLibrary.Input Text    ${Screen login}[username]    performance_glitch_user
    SeleniumLibrary.Press Keys    ${Screen login}[password]    ${Password}    ENTER

Input login 3
    SeleniumLibrary.Input Text    ${Screen login}[username]    222222222222222
    SeleniumLibrary.Press Keys    ${Screen login}[password]    ${Password}    ENTER



    