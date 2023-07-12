*** Settings ***
Resource    ../1.setting/1.setting.robot


*** Variables ***

&{Screen login}    
...    username=xpath=//*[@id="username"]
...    password=xpath=//*[@id="password"]


#DATA 
*** Variables ***

${username}    standard_user
${password}    secret_sauce




