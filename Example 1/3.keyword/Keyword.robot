*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Variables ***

${Username}    standard_user
${Password}    secret_sauce
${UserFaild}        standart
${PasswordFaild}    password

${FIRSTNAME}  Test
${LASTNAME}  User
${POSTALCODE}  12345

${PRODUCT_NAME}  Sauce Labs Bike Light
${PRODUCT_DESC}  A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.

*** Keywords ***

Openweb
    Open Browser    https://www.saucedemo.com/    browser=gc


LOGIN
    [Arguments]    ${Username}    ${Password} 
    Input Text        id=user-name    ${Username}
    Input Password    id=password     ${Password}
    Click Element     //*[@name="login-button"]
    

LOGOUT
    Click Element    //button[text()='Open Menu']
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link

