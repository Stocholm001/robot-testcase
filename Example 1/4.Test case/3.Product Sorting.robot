*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

TC003 Product Sorting

    Openweb
    LOGIN    ${Username}    ${Password}
    Maximize Browser Window
    Sleep    2s
    Go To    https://www.saucedemo.com/inventory.html
    Select From List By Label    ${TC03}[clicl dropdow]  Price (low to high)
    Sleep    5s
    #Close Browser

    