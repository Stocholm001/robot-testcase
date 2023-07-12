*** Settings ***
Library   SeleniumLibrary
Library    Otp.py
Library    ImapLibrary


*** Variables ***

${HOST}    imap.Gmail.com
${USERNAME}    lookmankong@gmail.com
${PASSWORD}    Paopao1993
${FOLDER}    กล่องจดหมาย
${SUBJECT}    Krungthai Business: รหัส OTP ที่ต้องดำเนินการ

${CompanyID}    SITPA00283
${User}    superpao01
${Pass}    P@ssw0rd

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

*** Test Cases ***

Test Login with OTP
    Open browser responsive
    Sleep    7s
    Maximize Browser Window
    
    Login portal    ${CompanyID}    ${User}    ${Pass}

    ${otp}=    Get Otp From Email    ${USERNAME}    ${PASSWORD}    ${SUBJECT}    ${HOST}    ${FOLDER}
    # rest of your code...

