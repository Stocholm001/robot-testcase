*** Settings ***
Resource    ../1.setting/1.setting.robot


*** Variables ***

&{Screen login}    
...    username=xpath=//*[@id="user-name"]
...    password=xpath=//*[@id="password"]


#DATA 
*** Variables ***

${valid_username}    standard_user
${valid_password}    secret_sauce

${Invalid_username}    dgkfjhklgfhjklfg
${Invalid_password}    fghkl;jfgilhjofp




