*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary

*** Variables ***
${brower}   chrome
${url}      https://www.saucedemo.com/


*** Test Cases ***
LoginTest
   open browser     ${url}      ${brower}
   Logintoweb
   close browser






*** Keywords ***
Logintoweb
   click element    xpath://*[@id="user-name"]
   input text       xpath://*[@id="user-name"]  standard_user
   click element    xpath://*[@id="password"]
   input text       xpath://*[@id="password"]  secret_sauce
   click element    xpath://*[@id="login-button"]
   ${name}=  get text         xpath://*[@id="header_container"]/div[2]/span
   log to console  ${name}