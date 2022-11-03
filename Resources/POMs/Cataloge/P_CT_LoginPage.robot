*** Settings ***
Library   SeleniumLibrary

*** Variables ***

${login_with_Email}     //button[@class="d-block primary round submit btn block text-left"]/span[@class="icon-envelope envelop-ico"]
${Login_Email_Field}    //input[@placeholder="email@example.com"]
${login_Cont_button_Email}    (//button[@class="primary round submit btn block"])[2]
${VerificationCode_Field}    id=input-code
${login_button}        //button[@class="primary round submit btn block"]

${login_with_phone}    //button[@class="d-block primary round submit btn block text-left"]/span[@class="icon-phone_iphone phone-ico"]
${login_cont_button_phone}     //button[@class="primary round submit btn block"]
${PhoneKey_List}    //select[@class="form-control"]
${PhoneNum_Field}    id=mobile

*** Keywords ***

###############################################Email############################################################
ClickLoginWithEmail
    click element   ${login_with_Email}

SetEmail
    [Arguments]    ${Email}
    input text    ${Login_Email_Field}     ${Email}

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
    input text   ${VerificationCode_Field}  ${verification_code}

ClickContinueButtonEmail
    click button   ${login_Cont_button_Email}
    wait until page contains    تأكيد البريد الإلكتروني

ClickLoginButtonEmail
    click button   ${login_button}

ClickContinueButtonInvalidEmail
    click button   ${login_Cont_button_Email}

VerifyInvalidEmail
    wait until page contains    يجب كتابة البريد الإلكتروني بشكل صحيح

VerifyInvalidCode
    wait until page contains    رمز التحقق غير صحيح

###################################################Phone#############################################################
ClickLoginWithPhone
    wait until element is visible    ${login_with_phone}
    click element    ${login_with_phone}

SelectPhoneNumKey
    [Arguments]    ${PhoneKey}
    wait until element is visible    ${PhoneKey_List}
    select from list by value    ${PhoneKey_List}    ${PhoneKey}

SetPhoneNum
    [Arguments]    ${Phone}
    wait until element is visible    ${PhoneNum_Field}
    input text    ${PhoneNum_Field}     ${Phone}

ClickContinueButtonPhone
    wait until element is visible    ${login_cont_button_phone}
    click button   ${login_cont_button_phone}
    wait until page contains    تأكيد رقم الجوال

ClickContinueButtonPhoneInvalid
    wait until element is visible    ${login_cont_button_phone}
    click button   ${login_cont_button_phone}


SetVerificationCodePhone
   input text   (//input[@class="form-control"])[1]    0
   input text   (//input[@class="form-control"])[2]    0
   input text   (//input[@class="form-control"])[3]    0
   input text   (//input[@class="form-control"])[4]    0


SetInvalidVerificationCodePhone
   input text   (//input[@class="form-control"])[1]    2
   input text   (//input[@class="form-control"])[2]    0
   input text   (//input[@class="form-control"])[3]    0
   input text   (//input[@class="form-control"])[4]    2

VerifyUnsuccessfulCode
    wait until page contains    رمز التحقق غير صحيح

VerifyUnsuccessfulPhoneLogin
    wait until page contains    رقم الجوال غير صحيح



