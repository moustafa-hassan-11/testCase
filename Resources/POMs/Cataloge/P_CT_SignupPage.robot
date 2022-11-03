*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
#############Common variables with login #####################
${Signup_with_Email}     //button[@class="d-block primary round submit btn block text-left"]/span[@class="icon-envelope envelop-ico"]
${Signup_Email_Field}    //input[@placeholder="email@example.com"]
${Signup_Cont_Email_btn}    //button[@id="btn-email-login"]
${Signup_VerificationCode_Field}    //div[@class="form-group"]//input
${Signup_btn} =  //div[@class="form-group no-m"]//button

${Signup_with_phone}    //button[@class="d-block primary round submit btn block text-left"]/span[@class="icon-phone_iphone phone-ico"]
${Signup_cont_button_phone}     //button[@class="primary round submit btn block"]
${Signup_PhoneKey_List}    //select[@class="form-control"]
${Signup_PhoneNum_Field}    id=mobile
#################################################################
${Registration_FullName_field} =   //input[@id="name"]
${Registration_PhoneNumber_field} =    //input[@id="mobile"]
${CountryCode_ddb} =    //button[@id="dropbtn"]
${CountryCode_field} =    //input[@id="countryInput"]
${registration_btn} =    //button[@class="primary round submit btn block"]
${RegistrationEmail_field} =    //input[@type="email"]
*** Keywords ***
#############Common key words with login #####################
###############################################Email############################################################
ClickLoginWithEmail
    click element   ${Signup_with_Email}

GenerateRandomCatalogEmail
    ${T0}    generate random string    5    [LETTERS]
    ${T3}    set variable    ${T0}@${T0}.${T0}
    return from keyword    ${T3}

SetEmail
    [Arguments]    ${Email}
    input text    ${Signup_Email_Field}     ${Email}

VerifyMobileRecaptcha
    sleep    5s
    execute javascript    ${EXECDIR}/Resources/Recaptcha.js
    sleep    3s
    press keys    none    TAB    TAB    ENTER
    sleep    2s

VerifyEmailRecaptcha
    sleep    5s
    execute javascript    ${EXECDIR}/Resources/Recaptcha2.js
    sleep    3s
    press keys    none    TAB    TAB    ENTER
    sleep    2s

SetVerificationCodeEmail
    [Arguments]    ${verification_code}
    wait until page contains    تأكيد البريد الإلكتروني
    input text   ${Signup_VerificationCode_Field}    ${verification_code}

ClickContinueButtonEmail
    click button   ${Signup_Cont_Email_btn}

ClickLoginButtonEmail
    click button   ${Signup_btn}

VerifyInvalidEmail
    wait until page contains    يجب كتابة البريد الإلكتروني بشكل صحيح

VerifyInvalidCode
    wait until page contains    رمز الدخول غير صحيح

###################################################Phone#############################################################
ClickLoginWithPhone
    wait until element is visible    ${Signup_with_phone}
    click element    ${Signup_with_phone}

GenerateRandomCatalogSaudianPhoneNum
    ${T0}    generate random string    8    [NUMBERS]
    ${T3}    set variable    5${T0}
    return from keyword    ${T3}

GenerateRandomCatalogEgyptianPhoneNum
    ${T0}    generate random string    8    [NUMBERS]
    ${T3}    set variable    10${T0}
    return from keyword    ${T3}

SelectPhoneNumKey
    [Arguments]    ${PhoneKey}
    wait until element is visible    ${Signup_PhoneKey_List}
    select from list by value    ${Signup_PhoneKey_List}    ${PhoneKey}

SetPhoneNum
    [Arguments]    ${Phone}
    wait until element is visible    ${Signup_PhoneNum_Field}
    input text    ${Signup_PhoneNum_Field}     ${Phone}

ClickContinueButtonPhone
    wait until element is visible    ${Signup_cont_button_phone}
    click button   ${Signup_cont_button_phone}
    wait until page contains    تأكيد رقم الجوال

SetVerificationCodePhone
   input text   (//input[@class="form-control"])[1]    1
   input text   (//input[@class="form-control"])[2]    2
   input text   (//input[@class="form-control"])[3]    3
   input text   (//input[@class="form-control"])[4]    4

SetInvalidVerificationCodePhone
   input text   (//input[@class="form-control"])[1]    9
   input text   (//input[@class="form-control"])[2]    9
   input text   (//input[@class="form-control"])[3]    9
   input text   (//input[@class="form-control"])[4]    9
#############################################sign up email
VerifyInvalidEmailErrorMessage
    wait until page contains     يجب كتابة البريد الإلكتروني بشكل صحيح

ClickRegisterphonenumber
    click button   ${Signup_cont_button_phone}
#########################################sign up phonenumber
VerifyPhonenumberErrorMsg
    wait until page contains    يجب أن يكون طول رقم الجوال على الأقل 8 حروف/حرفًا

######################################SignUp###########################
VerifyReachSignupPage
    wait until keyword succeeds    60s    1s    wait until page contains    تسجيل حساب جديد

VerifyReachCodeVerificationPage
    wait until keyword succeeds    60s    1s    wait until page contains    تأكيد رقم الجوال

EnterFullName
    [Arguments]     ${Resgistration_Full_Name}
    input text      ${Registration_FullName_field}  ${Resgistration_Full_Name}

SelectCountryCode
    [Arguments]    ${CountryCode}
    click button    ${CountryCode_ddb}
    input text    ${CountryCode_field}  ${CountryCode}
    wait until element is visible   //span[text()="${CountryCode}"]
    click element    //span[text()="${CountryCode}"]

EnterPhoneNumber
    [Arguments]     ${Resgistration_PhoneNumber}
    input text      ${Registration_PhoneNumber_field}   ${Resgistration_PhoneNumber}

EnterRegisterButton
    click button    ${registration_btn}

RegistrationEmptyFieldsErrorMessage
    wait until page contains    المدخل مطلوب

RegistrationPhoneNumberErrormessage
    wait until page contains    يجب أن يكون طول رقم الجوال على الأقل 8 حروف/حرفًا

VerifyErrorRegistrationInvalidCodeNumber
    wait until page contains    رمز التحقق غير صحيح

#################Register with phone number
EnterEmailAddress
    [Arguments]    ${Email}
    input text    ${RegistrationEmail_field}    ${Email}

RegistrationPhoneNumberEmptyEmailErrormessage
    wait until page contains    خانة البريد مطلوبة!

RegistrationPhoneNumberInvalidEmailErrormessage
    wait until page contains    يجب كتابة البريد الإلكتروني بشكل صحيح

RegistrationPhoneNumberInvalidCodeErrormessage
    wait until page contains    رمز التحقق غير صحيح







