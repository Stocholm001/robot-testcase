*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

TC001 LOGIN

    Openweb
    LOGIN    ${Username}    ${Password}
    Maximize Browser Window

    Click Element    ${TC05}[Add product]
    Click Element    ${TC05}[shopping cart link]

    Element Should Not Be Visible    //*[@class="cart_item"]