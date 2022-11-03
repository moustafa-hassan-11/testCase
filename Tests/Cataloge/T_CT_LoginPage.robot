*** Settings ***
Documentation    This is login test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/Cataloge/P_CT_LoginPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot

Test Setup       Start WebTest    none
Test Teardown    End WebTest

*** Variables ***
${CT_TESTING_URL} =    https://qdqqpv.zidtest.com/

*** Test Cases ***
LoginWithValidEmailAndValidCode
    [Documentation]    Login With Valid Email and valid Code
    [Tags]    Login_Email    Login

    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    a.mohamed9966@gmail.com
    P_CT_LoginPage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin

LoginWithInValidEmail
    [Documentation]    Login With Invalid Email
    [Tags]    Login_Email    Login

    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    a.mohamed9966.com
    P_CT_LoginPage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonInvalidEmail
    P_CT_LoginPage.VerifyInvalidEmail

LoginWithValidEmail&InvalidCode
    [Documentation]    Login With Valid Email & Invalid Code
    [Tags]    Login_Email    Login

    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    a.mohamed9966@gmail.com
    P_CT_LoginPage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1236
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_loginpage.verifyinvalidcode
#
LoginWithValidPhoneNumAndValidCode
    [Documentation]    Login With Valid PhoneNum and valid code
    [Tags]    Login_Phone    Login

    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    500000005
    P_CT_LoginPage.VerifyMobileRecaptcha
    P_CT_LoginPage.ClickContinueButtonPhone
    P_CT_loginpage.SetVerificationCodePhone
    P_CT_HomePage.VerifySuccessfulLogin


LoginWithInvalidPhoneNumber
    [Documentation]    Login With Invalid PhoneNumber
    [Tags]    Login_Phone    Login

    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    asdqwertf
    P_CT_LoginPage.VerifyMobileRecaptcha
    P_CT_LoginPage.ClickContinueButtonPhoneInvalid
    P_CT_LoginPage.VerifyUnsuccessfulPhoneLogin

LoginWithValidPhoneNum&InvalidCode
    [Documentation]    Login With Valid PhoneNum & Invalid code
    [Tags]    Login_Phone    Login

    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    500000005
    P_CT_LoginPage.VerifyMobileRecaptcha
    P_CT_LoginPage.ClickContinueButtonPhone
    P_CT_LoginPage.SetInvalidVerificationCodePhone
    P_CT_LoginPage.VerifyUnsuccessfulCode
