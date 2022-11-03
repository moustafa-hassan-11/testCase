*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${OTP_field} =    (//div[@id="verifyPhoneNumber"]/div/input)[1]
${OTP2} =    (//div[@id="verifyPhoneNumber"]/div/input)[2]
${OTP3} =    (//div[@id="verifyPhoneNumber"]/div/input)[3]
${OTP4} =    (//div[@id="verifyPhoneNumber"]/div/input)[4]
${OTP_Resend} =    //a[contains(text(),"اعد ارسال رمز التحقق")]
${Check_BTN} =    verifyOTP
${ChangeNumber_BTN} =    changePhone
${NewMobile_field} =    mobile
${CountryCode} =    country_code
${Next_BTN} =    resetPhone

*** Keywords ***
####################### ACTIONS ##########################
VerifyOTPLoaded
    wait until page contains    تم ارسال رسالة نصية

GoToChangeNumberPage
    click link    ${ChangeNumber_BTN}
    wait until page contains    رقم الجوال

AddNewNumber
    [Arguments]    ${Code}    ${NewMobileNo}
    input text    ${NewMobile_field}    ${NewMobileNo}
    click element    country_code
    wait until keyword succeeds    10s    1s    click link    //ul//a[contains(text(),"${Code}")]
    click element    ${Next_BTN}
    wait until page contains    تم ارسال رسالة نصية

EnterOTP
    [Arguments]    ${OTP}
    input text    ${OTP_field}    ${OTP}

ClickCheckBTN
    click element    ${Check_BTN}

########################## SCENARIOS #########################
