*** Settings ***
Documentation
Library    SeleniumLibrary
Resource    P_MD_RegisterOTP.robot
Resource    P_MD_RegisterSaveReadiness.robot
*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${Name_Field} =    //label[contains(text(),"اسمك الكريم ")]//following-sibling::div/input
${Mail_Field} =    //label[contains(text(),"البريد الإلكتروني ")]//following-sibling::div/input
${Password_Field} =    //label[contains(text(),"كلمة المرور")]//following-sibling::div/input
${Eye_Icon} =    btn-eye
${Mobile_Field} =    //label[contains(text(),"رقم الجوال ")]//following-sibling::div/div/input
${Register_BTN} =    //button[contains(text(),"تسجيل")]
${CountryCode_DDL} =    //a[@data-toggle="dropdown"]
${NameErrorMessage} =     الاسم يجب ان يحتوي على 3 حروف على الأقل.
${PasswordErrorMessage} =     كلمة المرور يجب ان تحتوي على 8 حروف أو ارقام على الأقل
${MobileMinErrorMessage} =     رقم الجوال يجب ان يحتوي على 8 أرقام على الأقل
${PasswordMaxErrorMessage} =     كلمة المرور يجب ان يحتوي على 50 حروف على الأكثر.
${UsedEmailErrorMessage} =    البريد الإلكتروني مستخدم من قبل.


*** Keywords ***
####################### ACTIONS ##########################
EnterMerchantName
    [Arguments]    ${MerchantName}
    click element    ${Name_Field}
    input text    ${Name_Field}    ${MerchantName}

CheckNameCharactersLimit
    page should contain    ${NameErrorMessage}

EnterMerchantEmail
    [Arguments]    ${MerchantEmail}
    click element    ${Mail_Field}
    input text    ${Mail_Field}    ${MerchantEmail}

CheckEmailAvailability
    wait until page contains    ${UsedEmailErrorMessage}
EnterMerchantPassword
    [Arguments]    ${MerchantPassword}
    click element    ${Password_Field}
    input text    ${Password_Field}    ${MerchantPassword}

ClickOnEyeIcon
    click element    ${Eye_Icon}

EnterMerchantMobile
    [Arguments]    ${MerchantMobile}
    click element    ${Mobile_Field}
    input text    ${Mobile_Field}    ${MerchantMobile}

ChooseCountryCode
    [Arguments]    ${Code}
    click element    ${CountryCode_DDL}
    click element    //a[contains(text(),"${Code}")]

ClickRegister
    click element    ${Register_BTN}
########################## SCENARIOS #########################
ValidRegister
    [Documentation]
    [Arguments]    ${MerchantName}    ${MerchantEmail}    ${MerchantPassword}    ${MerchantMobile}    ${Code}    ${OTP}    ${Status1}    ${Status2}    ${Status3}    ${Status4}    ${Status5}    ${Status6}    ${Status7}
    EnterMerchantName    ${MerchantName}
    EnterMerchantEmail    ${MerchantEmail}
    EnterMerchantPassword    ${MerchantPassword}
    EnterMerchantMobile    ${MerchantMobile}
    ChooseCountryCode    ${Code}
    ClickRegister
    VerifyOTPLoaded
    EnterOTP    ${OTP}
    ClickCheckBTN
    VerifySaveReadinessLoaded
    SelectIsCommerceEstablished    ${Status1}
    SelectIsProductsReady       ${Status2}
    SelectIsProductImagesReady    ${Status3}
    SelectBusinessText    ${Status4}
    SelectNeedHelp    ${Status5}    ${Status6}    ${Status7}
    ClickStartNow