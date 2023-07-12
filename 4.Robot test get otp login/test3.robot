*** Settings ***
Library   SeleniumLibrary
Library    Otp.py
Library    ImapLibrary


*** Variables ***
${host}        outlook.office365.com
${username}    automate-----.p@outlook.com
${password}    Paopao199
${folder}      inbox
${subject}     Krungthai Business:

${CompanyID}    ECLBA00042
${User}         superpao01
${Pass}         P@ssw0rd

*** Keywords ***
Open browser responsive
    Open Browser    https://biznext-channel.dev.krungthai.com:10443/#/invoices    browser=gc

Login portal
    [Arguments]    ${CompanyID}    ${User}    ${Pass}
    Click Element    //*[@class="ktb-button-label"]
    Input Text      //input[@formcontrolname='companyId']    ${CompanyID}
    Input Text      //input[@formcontrolname="userId"]      ${User}
    Input Password  //input[@formcontrolname="password"]    ${Pass}
    Click Element    //*[@class="ktb-button-label"]

otp input
    ${OTP}=    fetch_otp    ${host}    ${username}    ${password}    ${folder}    ${subject}
    Input Password    (//*[@name="otp"])[1]    ${otp}
    Click Element    //*[@class="button-pre-login mb-16px ktb-button ktb-button--primary"]



*** Test Cases ***
Test Login with OTP
    Open browser responsive
    Sleep    7s
    Maximize Browser Window

    Login portal    ${CompanyID}    ${User}    ${Pass}

    Sleep    2s

    otp input
    


    

