*** Settings ***
Documentation
Library    SeleniumLibrary
*** Variables ***
#################### GLOBAL VARIABLES ##########################

######################## LOCATORS ##########################
${Terms_And_Conditions_ChkBox}=    //label[text()='أوافق على الشروط والأحكام']//parent::div
${Activate_BTN} =    xpath= //button[./span='تفعيل']
${Back_BTN} =    xpath= //button[./span='السابق']
${Activation_Success_Msg} =    //h1[text()='تم تفعيل الخدمة بنجاح']
*** Keywords ***

########################## ACTIONS ##############################

ZidshipActivation Toggle Terms and Conditions
    wait until page contains element    ${Terms_And_Conditions_ChkBox}    10
    click element    ${Terms_And_Conditions_ChkBox}


ZidshipActivation Click Activate
    wait until element is enabled    ${Activate_BTN}    10
    click button    ${Activate_BTN}

ZidshipActivation Verify Activation_Success_Msg Appears
    wait until element is enabled    ${Activation_Success_Msg}    10

######################### SCENARIOS ############################

Finish Activation
    ZidshipActivation Toggle Terms and Conditions
    ZidshipActivation Click Activate
    ZidshipActivation Verify Activation_Success_Msg Appears
