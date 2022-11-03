*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
######################## LOCATORS ##########################
${BKOFFICE_ZIDCORE_LOGIN_BTN} =
${BKOFFICE_ZIDCORE_EMAIL_FIELD} =
${BKOFFICE_ZIDCORE_PASSOWRD_FIELD} =

*** Keywords ***
####################### ACTIONS ##########################
GoTo LoginPage
    [Arguments]   ${BKOFFICE_ZIDCORE_URL}
    go to    ${BKOFFICE_ZIDCORE_URL}
Enter Email
    [Arguments]    ${BKOFFICE_ZIDCORE_EMAIL}
    wait until element is visible    ${BKOFFICE_ZIDCORE_EMAIL_FIELD}
    input text    ${BKOFFICE_ZIDCORE_EMAIL_FIELD}    ${BKOFFICE_ZIDCORE_EMAIL}
Enter Password
    [Arguments]    ${BKOFFICE_ZIDCORE_PASSWORD}
    wait until element is visible    ${BKOFFICE_ZIDCORE_PASSOWRD_FIELD}
    input text    ${BKOFFICE_ZIDCORE_PASSOWRD_FIELD}    ${BKOFFICE_ZIDCORE_PASSWORD}
Click Login
    click button    ${BKOFFICE_ZIDCORE_LOGIN_BTN}

########################## SCENARIOS #########################
LoginToMD
    [Arguments]    ${BKOFFICE_ZIDCORE_URL}    ${BKOFFICE_ZIDCORE_EMAIL}    ${BKOFFICE_ZIDCORE_PASSWORD}
    GoTo LoginPage    ${BKOFFICE_ZIDCORE_URL}
    Enter Email    ${BKOFFICE_ZIDCORE_EMAIL}
    Enter Password    ${BKOFFICE_ZIDCORE_PASSWORD}
    Click Login