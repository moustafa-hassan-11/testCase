*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${PD_Logo} =    //div[@class='d-flex align-items-center sidebar-p-a sidebar-account flex-shrink-0']
${Ctreat_APP_Btn} =    //a[@class='btn btn-light']

*** Keywords ***
####################### ACTIONS ##########################
VerifyUserLogedIn
    Element Should Be Visible    ${PD_Logo}    timeout=5
ClickCreatNewAPP
    click element    ${Ctreat_APP_Btn}
    wait until page contains    Create new application

