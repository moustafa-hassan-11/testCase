*** Settings ***
Documentation
Library    SeleniumLibrary
*** Variables ***

#################### GLOBAL VARIABLES ##########################
${Zidship_WareHouseName} =    Riyad_COD

######################## LOCATORS ##########################
${Zidship_P2_Title}=    //h3[text()='مواقع استلام الطلبات']
${Next_BTN} =    xpath= //button[./span='التالي']
${Back_BTN} =    xpath= //button[./span='السابق']

*** Keywords ***

########################## ACTIONS ##############################

ZidshipActivation Choose WareHouse
    [Arguments]    ${Zidship_WareHouseName}
    wait until page contains element    ${Zidship_P2_Title}    10
    click element    //h4[text()='${Zidship_WareHouseName}']

ZidshipActivation Proceed to 3rd Activation Page
    wait until element is enabled    ${Next_BTN}    10
    click button    ${Next_BTN}


######################### SCENARIOS ############################

Enter P2 Activation Details
    ZidshipActivation Choose WareHouse    ${Zidship_WareHouseName}
    ZidshipActivation Proceed to 3rd Activation Page
