*** Settings ***
Resource    ../1.setting/1.setting.robot


*** Keywords ***

Open admin portal
   SeleniumLibrary.Open Browser    browser=gc
   SeleniumLibrary.Go To    https://www.saucedemo.com/

Login
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    Click Button    //*[@class="submit-button btn_action"] 

Test login fail
    Login    ${Invalid_username}    ${Invalid_password}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service

    Login    ${valid_username}    ${valid_password}
    Page Should Contain    Swag Labs




Input login 1
    SeleniumLibrary.Input Text    ${Screen login}[username]    ${valid_username}
    SeleniumLibrary.Press Keys    ${Screen login}[password]    ${valid_password}    ENTER

Input login 2
    SeleniumLibrary.Input Text    ${Screen login}[username]    11111111111111
    SeleniumLibrary.Press Keys    ${Screen login}[password]    ${valid_password}    ENTER

Input login 3
    SeleniumLibrary.Input Text    ${Screen login}[username]    222222222222222
    SeleniumLibrary.Press Keys    ${Screen login}[password]    ${valid_password}    ENTER



    