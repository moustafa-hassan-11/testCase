*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${AppType} =    Head Script      # Normal , Head Script
${AppUrl} =    https://www.google.com/
${CallBackUrl} =    https://www.google.com/
${AppName} =    1AaggamyTestz
${AppNameField} =    appName
${AppUrlField} =    appURL
${AppTypeDDB} =    //select[@id='type']
${CallBackUrlField} =    //input[@name='redirect_uri']
${CreateAppBtn} =    //div[@class='ml-auto']

*** Keywords ***
####################### ACTIONS ##########################
EnterAppName
    wait until element is visible    ${AppNameField}
    input text    ${AppNameField}    ${AppName}
EnterAppUrl
    input text    ${AppUrlField}    ${AppUrl}
SelectAppType
     click element    ${AppTypeDDB}
     click element    //option[contains(text(),'${AppType}')]
EnterAppCallBackUrl
   input text    ${CallBackUrlField}    ${CallBackUrl}
ClickCreatAppBtn
   click element    ${CreateAppBtn}
   wait until page contains    General Settings



