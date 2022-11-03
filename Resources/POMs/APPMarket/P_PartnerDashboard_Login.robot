*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################
${PD_STAGING_URL} =    https://staging-api.zid.sa/app

######################## LOCATORS ##########################
${PD_Email} =    admin@admin.com
${PD_Password} =    admin@admin.com
${PD_Email_Field} =    id:email_2
${PD_Login_Form} =    //div[@class="layout-login-centered-boxed__form"]
${PD_Password_Field} =    id:password_2
${PD_Login_Btn} =    //button[@type='submit']



*** Keywords ***
####################### ACTIONS ##########################
GoTo PD LoginPage
    [Arguments]    ${PD_STAGING_URL}
    go to    ${PD_STAGING_URL}
Enter Email
    [Arguments]    ${PD_Email}
    wait until element is visible    ${PD_Login_Form}
    input text    ${PD_Email_Field}    ${PD_Email}
Enter Password
    [Arguments]    ${PD_Password}
    input text    ${PD_Password_Field}    ${PD_Password}
Click Login
    click button    ${PD_Login_Btn}
    wait until page contains    Applications