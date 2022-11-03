*** Settings ***
Documentation
Library    SeleniumLibrary
*** Variables ***

#################### GLOBAL VARIABLES ##########################

######################## LOCATORS ##########################
${ZIDSHIP_ACTIVATION_BTN} =    xpath=//header/div[2]/a/button
#${Zidship_Activation_BTN}=    //button[./span='إدارة الخدمة']

*** Keywords ***

########################## ACTIONS ##############################
GoTo ZidShipActivationPage
    wait until page contains element    ${ZIDSHIP_ACTIVATION_BTN}    10
    click button    ${ZIDSHIP_ACTIVATION_BTN}

######################### SCENARIOS ############################
