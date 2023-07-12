*** Settings ***
Resource    ..//1.setting/Setting_1.robot

*** Test Cases ***

Perform All Above In Sequence
    #TC01
    Openweb
    LOGIN    ${Username}    ${Password}
    Maximize Browser Window
    LOGOUT
    
    #TC02
    LOGIN    ${UserFaild}    ${PasswordFaild}
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    
    #TC03
    LOGIN    ${Username}    ${Password}
    Sleep    2s
    Go To    https://www.saucedemo.com/inventory.html
    Select From List By Label    ${TC03}[clicl dropdow]  Price (low to high)
    Sleep    5s

    #TC04 #TC05
    Click Element    ${TC04}[Produck02]
    Page Should Contain    ${PRODUCT_NAME}
    Page Should Contain    ${PRODUCT_DESC}
    Element Should Be Visible    //*[@class="inventory_details_img_container"]
    

    #TC06
    Click Element    ${TC05}[shopping cart link]
    Element Should Not Be Visible    //*[@class="cart_item"]


    #TC07
    Click Element    ${TC07}[Click checkout]
    Input Text    id=first-name    ${FIRSTNAME}
    Input Text    id=last-name     ${LASTNAME}
    Input Text    id=postal-code   ${POSTALCODE}

    Scroll Element Into View    id=continue
    Click Element    id=continue
    Scroll Element Into View    id=finish
    Click Element    id=finish
    Wait Until Page Contains    Your order has been dispatched, and will arrive just as fast as the pony can get there!


    #TC08
    Scroll Element Into View    //button[text()='Open Menu']
    Click Element    //button[text()='Open Menu']
    Sleep    2s
    Click Element    //a[text()='All Items']

    Click Element    ${TC05}[shopping cart link]
    Click Element    ${TC07}[Click checkout]

    Input Text    id=first-name    ${FIRSTNAME}
    Input Text    id=last-name     ${LASTNAME}
    Input Text    id=postal-code   ${POSTALCODE}
    Scroll Element Into View    id=continue
    Click Element    id=continue
    Scroll Element Into View    id=finish
    Click Element    id=finish
    Run Keyword And Warn On Failure    Wait Until Page Contains    Your cart is empty!
    
    #TC09
    LOGOUT
    Wait Until Page Contains    Accepted usernames are

    [Teardown]    Close Browser


    