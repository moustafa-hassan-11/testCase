*** Settings ***

Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_SignupPage.robot
Resource  ../../Resources/Common.robot

Test Setup       Start WebTest    None
Test Teardown    End WebTest

*** Variables ***
${CT_TESTING_URL} =    https://yqo67n.zidtest.com
${CT_SignUp_RandomEmail}
${CT_SignUp_RandomEgyptianNum}

*** Test Cases ***
######################### 1.Sign Up with Email ###################################

SignUpWithValidEmail,ValidCredentialsAndValidCode.
    [Documentation]     Sign up with valid email, valid credentials and valid code.
    [Tags]  T_CT_SignupPage_Test1    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithEmail
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.SetEmail    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.VerifyEmailRecaptcha
    P_CT_SignupPage.ClickContinueButtonEmail
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   Habibaatestting1
    P_CT_SignupPage.SelectCountryCode   مصر
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.EnterPhoneNumber    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.EnterRegisterButton
    #Verify email with code
    P_CT_SignupPage.SetVerificationCodeEmail   1234
    P_CT_SignupPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin

SignUpWithInvalidEmail
    [Documentation]    Sign up with invalid email
    [Tags]  T_CT_SignupPage_Test2    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithEmail
    P_CT_SignupPage.SetEmail    habibamagdyy
    P_CT_SignupPage.VerifyEmailRecaptcha
    P_CT_SignupPage.ClickContinueButtonEmail
    P_CT_SignupPage.VerifyInvalidEmailErrorMessage

SignUpWithValidEmailAndTheNameFieldIsEmpty
    [Documentation]    Sign up with valid email and the name field is empty
    [Tags]  T_CT_SignupPage_Test3    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithEmail
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.SetEmail    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.VerifyEmailRecaptcha
    P_CT_SignupPage.ClickContinueButtonEmail
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.SelectCountryCode   مصر
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.EnterPhoneNumber    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.RegistrationEmptyFieldsErrorMessage

SignUpWithValidEmailAndThePhoneNumberFieldIsEmpty
    [Documentation]    Sign up with valid email and the phone number field is empty
    [Tags]  T_CT_SignupPage_Test4    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithEmail
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.SetEmail    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.VerifyEmailRecaptcha
    P_CT_SignupPage.ClickContinueButtonEmail
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   testting3
    P_CT_SignupPage.SelectCountryCode   مصر
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.RegistrationEmptyFieldsErrorMessage

SignUpWithValidEmailAndInvalidPhoneNumber
    [Documentation]    Sign up with valid email and invalid phone number
    [Tags]  T_CT_SignupPage_Test5    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithEmail
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.SetEmail    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.VerifyEmailRecaptcha
    P_CT_SignupPage.ClickContinueButtonEmail
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   testtiing
    P_CT_SignupPage.SelectCountryCode   مصر
    P_CT_SignupPage.EnterPhoneNumber    0115
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.RegistrationPhoneNumberErrormessage

SignUpWithValidEmail,ValidCredentialsAndInvalidCode
    [Documentation]     Sign up with valid email, valid credentials and invalid code
    [Tags]      T_CT_SignupPage_Test6    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithEmail
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.SetEmail    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.VerifyEmailRecaptcha
    P_CT_SignupPage.ClickContinueButtonEmail
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   Habibayy116
    P_CT_SignupPage.SelectCountryCode   مصر
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.EnterPhoneNumber    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.EnterRegisterButton
    #Verify email with code
    P_CT_SignupPage.SetVerificationCodeEmail   9999
    P_CT_SignupPage.ClickLoginButtonEmail
    P_CT_SignupPage.VerifyErrorRegistrationInvalidCodeNumber

######################### 2.Sign Up with phone number ###################################
SignUpWithValidPhoneNumber,ValidCredentialsAndValidCode
    [Documentation]     Sign up with valid phone number, valid credentials and valid code
    [Tags]  T_CT_SignupPage_Test7    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithPhone
    P_CT_SignupPage.selectphonenumkey    +20
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.SetPhoneNum    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.VerifyMobileRecaptcha
    P_CT_SignupPage.ClickRegisterphonenumber
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   HabibaQah812
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.EnterEmailAddress    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.VerifyReachCodeVerificationPage
    #####Verify phonenumber with code####
    P_CT_SignupPage.SetVerificationCodePhone
    P_CT_HomePage.VerifySuccessfulLogin


SignUpWithInvalidPhoneNumber
    [Documentation]    Sign up with invalid phone number
    [Tags]    T_CT_SignupPage_Test8    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithPhone
    P_CT_SignupPage.selectphonenumkey    +20
    P_CT_SignupPage.SetPhoneNum    jbfd
    P_CT_SignupPage.VerifyMobileRecaptcha
    P_CT_SignupPage.ClickRegisterphonenumber
    P_CT_SignupPage.VerifyPhonenumberErrorMsg

SignUpWithValidPhoneNumberAndTheNameFieldIsEmpty
    [Documentation]    Sign up with valid phone number and the name field is empty
    [Tags]    T_CT_SignupPage_Test9    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithPhone
    P_CT_SignupPage.selectphonenumkey    +20
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.SetPhoneNum    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.VerifyMobileRecaptcha
    P_CT_SignupPage.ClickRegisterphonenumber
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.EnterEmailAddress    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.RegistrationEmptyFieldsErrorMessage

SignUpWithValidPhoneNumberAndTheEmailFieldIsEmpty
    [Documentation]    Sign up with valid phone number and the email field is empty
    [Tags]    T_CT_SignupPage_Test10    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithPhone
    P_CT_SignupPage.selectphonenumkey    +20
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.SetPhoneNum    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.VerifyMobileRecaptcha
    P_CT_SignupPage.ClickRegisterphonenumber
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   Hhabibaqa812
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.RegistrationPhoneNumberEmptyEmailErrormessage

SignUpWithValidPhoneNumberAndInvalidEmail
    [Documentation]    Sign up with valid phone number and invalid email
    [Tags]    T_CT_SignupPage_Test11    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithPhone
    P_CT_SignupPage.selectphonenumkey    +20
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.SetPhoneNum    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.VerifyMobileRecaptcha
    P_CT_SignupPage.ClickRegisterphonenumber
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   Hhabibaqa5816
    P_CT_SignupPage.EnterEmailAddress   teestttt5
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.RegistrationPhoneNumberInvalidEmailErrormessage

SignUpWithValidPhoneNumber,ValidCredentialsAndInvalidCode
    [Documentation]    Sign up with valid phone number, valid credentials and invalid code
    [Tags]  T_CT_SignupPage_Test12    Signup
    P_CT_HomePage.GoToCatalog    ${CT_TESTING_URL}
    P_CT_HomePage.ClickHeaderLogin
    P_CT_SignupPage.ClickLoginWithPhone
    P_CT_SignupPage.selectphonenumkey    +20
    ${CT_SignUp_RandomEgyptianNum}    GenerateRandomCatalogEgyptianPhoneNum
    P_CT_SignupPage.SetPhoneNum    ${CT_SignUp_RandomEgyptianNum}
    P_CT_SignupPage.VerifyMobileRecaptcha
    P_CT_SignupPage.ClickRegisterphonenumber
    #Register info
    P_CT_SignupPage.VerifyReachSignupPage
    P_CT_SignupPage.EnterFullName   Habibaqaa5812
    ${CT_SignUp_RandomEmail}    p_ct_signuppage.generaterandomcatalogemail
    P_CT_SignupPage.EnterEmailAddress    ${CT_SignUp_RandomEmail}
    P_CT_SignupPage.EnterRegisterButton
    P_CT_SignupPage.VerifyReachCodeVerificationPage
    #####Verify phonenumber with code####
    P_CT_SignupPage.SetInvalidVerificationCodePhone
    P_CT_SignupPage.RegistrationPhoneNumberInvalidCodeErrormessage



