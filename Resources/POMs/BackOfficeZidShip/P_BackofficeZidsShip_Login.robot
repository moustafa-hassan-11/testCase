*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
######################## LOCATORS ##########################
${BKOFFICE_ZIDSHIP_LOGIN_BTN} =
${BKOFFICE_ZIDSHIP_EMAIL_FIELD} =
${BKOFFICE_ZIDSHIP_PASSOWRD_FIELD} =

*** Keywords ***
####################### ACTIONS ##########################
GoTo LoginPage
    [Arguments]   ${BKOFFICE_ZIDSHIP_URL}
    go to    ${BKOFFICE_ZIDSHIP_URL}
Enter Email
    [Arguments]    ${BKOFFICE_ZIDSHIP_EMAIL}
    wait until element is visible    ${BKOFFICE_ZIDSHIP_EMAIL_FIELD}
    input text    ${BKOFFICE_ZIDSHIP_EMAIL_FIELD}    ${BKOFFICE_ZIDSHIP_EMAIL}
Enter Password
    [Arguments]    ${BKOFFICE_ZIDSHIP_PASSWORD}
    wait until element is visible    ${BKOFFICE_ZIDSHIP_PASSOWRD_FIELD}
    input text    ${BKOFFICE_ZIDSHIP_PASSOWRD_FIELD}    ${BKOFFICE_ZIDSHIP_PASSWORD}
Click Login
    click button    ${BKOFFICE_ZIDSHIP_LOGIN_BTN}

########################## SCENARIOS #########################
LoginToMD
    [Arguments]    ${BKOFFICE_ZIDSHIP_URL}    ${BKOFFICE_ZIDSHIP_EMAIL}    ${BKOFFICE_ZIDSHIP_PASSWORD}
    GoTo LoginPage    ${BKOFFICE_ZIDSHIP_URL}
    Enter Email    ${BKOFFICE_ZIDSHIP_EMAIL}
    Enter Password    ${BKOFFICE_ZIDSHIP_PASSWORD}
    Click Login