*** Settings ***
Library  SeleniumLibrary
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
LoginTest
#   create webdriver  chrome  executable_path="D:\pythonProject\driver\chromedriver.exe"
   open browser     https://www.saucedemo.com/   chrome
   click element    xpath://*[@id="user-name"]
   input text       xpath://*[@id="user-name"]  standard_user
   click element    xpath://*[@id="password"]
   input text       xpath://*[@id="password"]  secret_sauce
   click element    xpath://*[@id="login-button"]
   ${name}=  get text         xpath://*[@id="header_container"]/div[2]/span
   log to console  ${name}


   close browser


*** Keywords ***
