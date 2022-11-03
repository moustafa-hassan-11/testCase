*** Settings ***
Documentation
Library    SeleniumLibrary
Resource  ../Resources/POMs/MD/P_MD_Login.robot
Resource  ../Resources/POMs/AppMarket/P_PartnerDashboard_Login.robot

*** Variables ***
${BROWSER} =  chrome

#################### MERCHANTS DASHBOARD VARIABLES #####################

${MD_TESTING_URL} =    https://testing-web.zid.sa/login
${MD_TESTING_EMAIL} =
${MD_TESTING_PASSWORD}=

${MD_STAGING_URL} =    https://staging-web.zid.sa/login
${MD_STAGING_REG_URL} =    https://staging-web.zid.sa/register
${MD_Testing_URL} =    https://testing-web.zid.sa/login
${MD_Testing_REG_URL} =    https://testing-web.zid.sa/register
${MD_Production_URL} =    https://web.zid.sa/login

${MD_PRODUCTION_URL} =    https://web.zid.sa/login
${MD_PRODUCTION_EMAIL} =
${MD_PRODUCTION_PASSWORD}=

#################### PARTNERS DASHBOARD VARIABLES #####################

${PD_TESTING_URL}=    https://testing-api.zid.sa/app
${PD_TESTING_EMAIL} =
${PD_TESTING_PASSWORD}=

${PD_STAGING_URL}=    https://staging-api.zid.sa/app
${PD_STAGING_EMAIL} =
${PD_STAGING_PASSWORD}=

#################### BACKOFFICE ZIDSHIP VARIABLES #####################

${BKOFFICE_ZIDSHIP_TESTING_URL} =    https://testing-api.zidship.com/ops/login/
${BKOFFICE_ZIDSHIP_TESTING_EMAIL} =
${BKOFFICE_ZIDSHIP_TESTING_PASSWORD} =

${BKOFFICE_ZIDSHIP_PRODUCTION_URL} =
${BKOFFICE_ZIDSHIP_PRODUCTION_EMAIL} =
${BKOFFICE_ZIDSHIP_PRODUCTION_PASSWORD}=

#################### BACKOFFICE ZIDCORE VARIABLES #####################

${BKOFFICE_ZIDCORE_TESTING_URL} =    https://testing-backoffice.zid.sa/login
${BKOFFICE_ZIDCORE_TESTING_EMAIL} =
${BKOFFICE_ZIDCORE_TESTING_PASSWORD}=

${BKOFFICE_ZIDCORE_STAGING_URL} =
${BKOFFICE_ZIDCORE_STAGING_EMAIL} =
${BKOFFICE_ZIDCORE_STAGING_PASSWORD}=

${BKOFFICE_ZIDCORE_PRODUCTION_URL} =
${BKOFFICE_ZIDCORE_PRODUCTION_EMAIL} =
${BKOFFICE_ZIDCORE_PRODUCTION_PASSWORD}=

#################### ARGUMENTS DEFAULT VARIABLES #####################

${DEFAULT_MD_URL}=    ${MD_STAGING_URL}
${DEFAULT_MD_EMAIL}=
${DEFAULT_MD_PASSWORD}=

${DEFAULT_PD_URL}=    ${PD_STAGING_URL}
${DEFAULT_PD_EMAIL}=
${DEFAULT_PD_PASSWORD}=

${DEFAULT_BKOFFICE_ZIDSHIP_URL}=    ${BKOFFICE_ZIDSHIP_TESTING_URL}
${DEFAULT_BKOFFICE_ZIDSHIP_EMAIL}=
${DEFAULT_BKOFFICE_ZIDSHIP_PASSWORD}=

${DEFAULT_BKOFFICE_ZIDCORE_URL}=    ${BKOFFICE_ZIDCORE_TESTING_URL}
${DEFAULT_BKOFFICE_ZIDCORE_EMAIL}=
${DEFAULT_BKOFFICE_ZIDCORE_PASSWORD}=

########################Catalog####################33
${Catalog_Testing_URL}=    https://rw304k.zidtest.com/

*** Keywords ***
Start WebTest
    [Documentation]    login to MD-> MD , url environment , email & password // Open url to regiter -> REG
    [Arguments]    @{Navigation_List}

    open browser    about:blank    ${BROWSER}
    maximize browser window
    delete all cookies
    run keyword if    '${Navigation_List}[0]' == 'MD'    LoginToMD    ${Navigation_List}[1]    ${Navigation_List}[2]    ${Navigation_List}[3]
    run keyword if    '${Navigation_List}[0]' == 'PD'    LoginToPD    ${Navigation_List}[1]    ${Navigation_List}[2]    ${Navigation_List}[3]
    run keyword if    '${Navigation_List}[0]' == 'Backoffice_zidship'    LoginToBackOfficeZidship    ${Navigation_List}[1]    ${Navigation_List}[2]    ${Navigation_List}[3]
    run keyword if    '${Navigation_List}[0]' == 'Backoffice_zidCore'    LoginToBackOfficeZidCore    ${Navigation_List}[1]    ${Navigation_List}[2]    ${Navigation_List}[3]

    run keyword if    '${Navigation_List}[0]' == 'Cataloge'    go to    ${Navigation_List}[1]
    run keyword if    '${Navigation_List}[0]' == 'REG'    go to    ${Navigation_List}[1]

LoginToMD
    [Arguments]     ${MD_URL}    ${MD_EMAIL}    ${MD_PASSWORD}

    P_MD_Login.GoTo MD LoginPage    ${MD_URL}
    P_MD_Login.Enter Email          ${MD_EMAIL}
    P_MD_Login.Enter Password       ${MD_PASSWORD}
    P_MD_Login.Click Login

LoginToPD
    [Arguments]     ${PD_URL}    ${PD_EMAIL}    ${PD_PASSWORD}
    P_PartnerDashboard_Login.GoTo PD LoginPage    ${PD_URL}
    P_PartnerDashboard_Login.Enter Email    ${PD_EMAIL}
    P_PartnerDashboard_Login.Enter Password    ${PD_PASSWORD}
    P_PartnerDashboard_Login.Click Login

LoginToBackOfficeZidCore
    [Arguments]     ${BKOFFICE_ZIDCORE_URL}    ${BKOFFICE_ZIDCORE_EMAIL}    ${BKOFFICE_ZIDCORE_PASSWORD}

    GoTo MD LoginPage    ${BKOFFICE_ZIDCORE_URL}
    Enter Email          ${BKOFFICE_ZIDCORE_EMAIL}
    Enter Password       ${BKOFFICE_ZIDCORE_PASSWORD}
    Click Login

LoginToBackOfficeZidship
    [Arguments]     ${BKOFFICE_ZIDSHIP_URL}    ${BKOFFICE_ZIDSHIP_EMAIL}    ${BKOFFICE_ZIDSHIP_PASSWORD}

    GoTo MD LoginPage    ${BKOFFICE_ZIDSHIP_URL}
    Enter Email          ${BKOFFICE_ZIDSHIP_EMAIL}
    Enter Password       ${BKOFFICE_ZIDSHIP_PASSWORD}
    Click Login

End WebTest
    close browser

Switch to Windows Handle
    [Arguments]    ${Index}
    @{windowHandles} =    get window handles
    switch window    ${windowHandles}[${Index}]