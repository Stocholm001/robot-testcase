*** Settings ***

Library    SeleniumLibrary    
Library    DateTime
Library    webbrowser
Library    String
Library    otp.py
Library    ImapLibrary

*** Variables ***
${HOST}    imap.Gmail.com
${USERNAME}    lookmankong@gmail.com
${PASSWORD}    Paopao1993
${FOLDER}    INBOX
${SUBJECT}    Krungthai Business: รหัส OTP ที่ต้องดำเนินการ

${CompanyID}    SITPA00283
${User}    superpao01
${Pass}    P@ssw0rd


*** Keywords ***

Open browser responsive
    SeleniumLibrary.Open Browser    browser=gc
    SeleniumLibrary.Go To    https://biznext-channel.dev.krungthai.com:10443/#/invoices


loin portall
    [Arguments]    ${CompanyID}    ${User}    ${Pass}
    Click Element    //*[@class="ktb-button-label"]
    Input Text      //input[@formcontrolname='companyId']    ${CompanyID}
    input_text      //input[@formcontrolname="userId"]      ${User}
    Input Password  //input[@formcontrolname="password"]    ${Pass}
    Click Element    //*[@class="ktb-button-label"]

Get OTP from Email
    Open Mailbox    host=${HOST}    user=${USERNAME}    password=${PASSWORD}
    Wait For Email    subject=${SUBJECT}    timeout=5min
    ${email} =    Get Email Body    subject=${SUBJECT}
    Close Mailbox
    ${otp} =    Fetch OTP From Email    ${email}
    [Return]    ${otp}

Fetch OTP From Email
    [Arguments]    ${email}
    ${otp} =    Extract OTP From String    ${email.body}
    [Return]    ${otp}

Extract OTP From String
    [Arguments]    ${string}
    ${otp} =    Fetch From Right    ${string}    6
    [Return]    ${otp}

loginBNnnn
    loin portall    ${CompanyID}    ${User}    ${Pass}
    ${OTP} =    Get OTP from Email
    Input Text    //*[@class="input-wrapper"]    ${OTP}    # สำหรับตัวอย่างนี้ คิดว่าโค้ด OTP จะต้องถูกใส่ในฟิลด์อินพุตที่มี id เป็น 'otp'


#//*[@class="input-wrapper"]
*** Test Cases ***
test
    Open browser responsive

    Sleep    7s

    loginBNnnn