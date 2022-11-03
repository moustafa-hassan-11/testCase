*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################
${MD_STAGING_URL} =    https://staging-web.zid.sa/login
${MD_STAGING_EMAIL} =    lailamansourahmed@gmail.com
${MD_STAGING_PASSWORD} =    12345678

${MD_Testing_URL} =    https://testing-web.zid.sa/login
${MD_Testing_EMAIL} =    lailamansourahmed@gmail.com
${MD_Testing_PASSWORD} =    12345678

######################## LOCATORS ##########################
${LOGIN_BTN} =    xpath=//div[@class="col-sm-12 text-center mt-5"]/button
${EMAIL_FIELD} =    email
${PASSOWRD_FIELD} =    password


*** Keywords ***
####################### ACTIONS ##########################
GoTo MD LoginPage
    [Arguments]   ${MD_STAGING_URL}
    go to    ${MD_STAGING_URL}
Enter Email
    [Arguments]    ${MD_Testing_EMAIL}
    wait until element is visible    ${EMAIL_FIELD}
    input text    ${EMAIL_FIELD}    ${MD_Testing_EMAIL}
Enter Password
    [Arguments]    ${MD_Testing_PASSWORD}
    wait until element is visible    ${PASSOWRD_FIELD}
    input text    ${PASSOWRD_FIELD}    ${MD_Testing_PASSWORD}
Click Login
    click button    ${LOGIN_BTN}

########################## SCENARIOS #########################
#LoginToMD
#    GoTo MD LoginPage
#    Enter Email
#    Enter Password
#    Click Login