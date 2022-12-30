*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***

${brower}   chrome
${url}      https://www.saucedemo.com/
${nametocheck}  PRODUCTS

*** Test Cases ***
LoginTest
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





*** Keywords ***
casecheckname_true
   ${name}=     get text  xpath://*[@id="header_container"]/div[2]/span
   log to console   đăng nhập thành công hệ thống hiển thị trang ${name}

casecheckname_false
   ${name}=     get text  xpath://*[@id="header_container"]/div[2]/span
   log to console   đăng nhập không thành công
   log to console  ${name}