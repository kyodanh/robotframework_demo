*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary


*** Variables ***

${brower}   chrome
${url}      https://www.saucedemo.com/
${nametocheck}  PRODUCTS
${wrong_tocheck}  Epic sadface: Username and password do not match any user in this service
${miss_username}  Epic sadface: Username is required
${miss_password}  Epic sadface: Password is required

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

TC_Login_False_Sai_PassWord
   open browser   ${url}      ${brower}
   maximize browser window
   click element   xpath://*[@id="user-name"]
   ${"username"}   set variable  xpath://*[@id="user-name"]
   input text  ${"username"}    standard_user
   click element   xpath://*[@id="password"]
   ${"password"}   set variable  xpath://*[@id="password"]
   input text  ${"password"}    secret_sauce_1
   click element  xpath://*[@id="login-button"]
   ${wrong_username}=  get text  xpath://*[@id="login_button_container"]/div/form/div[3]/h3
   run keyword if  '${wrong_username}' == '${wrong_tocheck}'  wrong_username_true
   ...  ELSE  wrong_username_false
   close browser

TC_Login_KhongNhap_Username
   open browser   ${url}      ${brower}
   maximize browser window
   click element   xpath://*[@id="password"]
   ${"password"}   set variable  xpath://*[@id="password"]
   input text  ${"password"}    secret_sauce_1
   click element  xpath://*[@id="login-button"]
   sleep  5
   ${miss_username_1}=  get text  //*[@id="login_button_container"]/div/form/div[3]/h3
   run keyword if  '${miss_username_1}' == '${miss_username}'  Check_Username
   ...  ELSE  wrong_username_false
   close browser

TC_Login_KhongNhap_Password
   open browser   ${url}      ${brower}
   maximize browser window
  click element   xpath://*[@id="user-name"]
   ${"username"}   set variable  xpath://*[@id="user-name"]
   input text  ${"username"}    standard_user
   click element  xpath://*[@id="login-button"]
   sleep  5
   ${miss_password_1}=  get text  //*[@id="login_button_container"]/div/form/div[3]/h3
   run keyword if  '${miss_password_1}' == '${miss_password}'  Check_Password
   ...  ELSE  wrong_username_false
   close browser


*** Keywords ***
casecheckname_true
   ${name}=     get text  xpath://*[@id="header_container"]/div[2]/span
   log to console   ????ng nh???p th??nh c??ng h??? th???ng hi???n th??? trang ${name}
   capture page screenshot  screenshot.png

casecheckname_false
   ${name}=     get text  xpath://*[@id="header_container"]/div[2]/span
   log to console   ????ng nh???p kh??ng th??nh c??ng
   log to console  ${name}

wrong_username_true
    ${wrong_username}=  get text  xpath://*[@id="login_button_container"]/div/form/div[3]/h3
    log to console   username b??? sai h??? th???ng hi???n th??? th??ng b??o ${wrong_username}

wrong_username_false
    log to console   C???n nh???p l???i th??ng tin v?? username v?? pass ??i???u ????ng

Check_Username
    ${miss_username_1}=  get text  //*[@id="login_button_container"]/div/form/div[3]/h3
    log to console   C???n nh???p username

Check_Password
    ${miss_password_1}=  get text  //*[@id="login_button_container"]/div/form/div[3]/h3
    log to console   C???n nh???p pass