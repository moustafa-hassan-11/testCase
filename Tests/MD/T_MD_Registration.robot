*** Settings ***
############# Libraries ###########
Documentation
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_RegisterInfo.robot
Resource    ../../Resources/Common.robot

Test Setup    Start WebTest
Test Teardown    End WebTest

*** Variables ***
############# Global Variables ###########

*** Test Cases ***

RegisterNewAccount
    [Tags]    We
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    ValidRegister    fix    sapt@oee.sa    12345678    548568235    966    1234    1    0    1    no_record_existed    1    0    1

ChangeMobileNo
    [Tags]    W
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    EnterMerchantName    fix
    EnterMerchantEmail    zed@aa.ceed
    EnterMerchantPassword    12345678
    EnterMerchantMobile    585623569
    ChooseCountryCode    966
    ClickRegister
    VerifyOTPLoaded
    GoToChangeNumberPage
    AddNewNumber    966    587652354
    EnterOTP    1234
    ClickCheckBTN

RegisterWithInvalidName
    [Tags]    Invalid
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    entermerchantname    aa
    CheckNameCharactersLimit

RegisterWithInvalidEmail
    [Tags]    Invalid
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    EnterMerchantName    fix
    EnterMerchantEmail    a.osama@zid.sa
    EnterMerchantPassword    12345678
    EnterMerchantMobile    54856253
    ChooseCountryCode    966
    ClickRegister
    checkemailavailability

CheckPasswordLimits
    [Tags]    Invalid
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    EnterMerchantPassword    1234
    wait until page contains    ${PasswordErrorMessage}
    EnterMerchantPassword    012345678901234567890123456789012345678901234567890123456789
    wait until page contains    ${PasswordMaxErrorMessage}

CheckMobileNoLimit
    [Tags]    Invalid
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    EnterMerchantMobile    59864
    wait until page contains    ${mobileminerrormessage}