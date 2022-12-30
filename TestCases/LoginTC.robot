*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***

${brower}   chrome
${url}      https://www.saucedemo.com/
${nametocheck}  PRODUCTS
${wrong_tocheck}  Epic sadface: Username and password do not match any user in this service


*** Test Cases ***

TC_Login_True
   open browser     ${url}      ${brower}
   maximize browser window
   click element   xpath://*[@id="user-name"]
   ${"username"}   set variable  xpath://*[@id="user-name"]
   input text  ${"username"}    standard_user
   click element   xpath://*[@id="password"]
   ${"password"}   set variable  xpath://*[@id="password"]
   input text   ${"password"}   secret_sauce
   sleep  10
   click element  xpath://*[@id="login-button"]
   ${name}=  get text  xpath://*[@id="header_container"]/div[2]/span
   run keyword if  '${name}' == '${nametocheck}'  casecheckname_true
   ...  ELSE    casecheckname_false
   close browser

TC_Login_False_Sai_Username
   open browser   ${url}      ${brower}
   maximize browser window
   click element   xpath://*[@id="user-name"]
   ${"username"}   set variable  xpath://*[@id="user-name"]
   input text  ${"username"}    standard_user_1
   click element   xpath://*[@id="password"]
   ${"password"}   set variable  xpath://*[@id="password"]
   input text  ${"password"}    secret_sauce
   click element  xpath://*[@id="login-button"]
   ${wrong_username}=  get text  xpath://*[@id="login_button_container"]/div/form/div[3]/h3
   run keyword if  '${wrong_username}' == '${wrong_tocheck}'  wrong_username_true
   ...  ELSE  wrong_username_false
   close browser




*** Keywords ***
casecheckname_true
   ${name}=     get text  xpath://*[@id="header_container"]/div[2]/span
   log to console   đăng nhập thành công hệ thống hiển thị trang ${name}

casecheckname_false
   ${name}=     get text  xpath://*[@id="header_container"]/div[2]/span
   log to console   đăng nhập không thành công
   log to console  ${name}

wrong_username_true
    ${wrong_username}=  get text  xpath://*[@id="login_button_container"]/div/form/div[3]/h3
    log to console   username bị sai hệ thống hiển thị thông báo ${wrong_username}

wrong_username_false
    log to console   Cần nhập lại thông tin vì username và pass điều đúng