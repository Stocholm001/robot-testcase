*** Settings ***
Resource    ../1.setting/1.setting.robot


*** Keywords ***

Open admin portal
   SeleniumLibrary.Open Browser    browser=gc
   SeleniumLibrary.Go To    https://www.saucedemo.com/




Login
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Button    //*[@id="login-button"]
    ${status}=    Get Text    xpath=(//*[text()='Swag Labs'])[2]
    [return]    ${status}


##//*[text()='Swag Labs']


    