*** Settings ***
Documentation
Library    SeleniumLibrary
Resource    ../../Common.robot
*** Variables ***

#################### GLOBAL VARIABLES ##########################
${ZidshipActivation_ImagePath} =    Resources/TestData/Image1.jpg
${ZidshipActivation_CommercialRecord} =    77218694278916241
${ZidshipActivation_FullName} =    Esm Gdeed
${ZidshipActivation_ZidShipEmail} =    Test@Test.Test
${ZidshipActivation_PhoneNumber} =    512345678
${ZidshipActivation_CountryCode} =    966+
${ZidshipActivation_StoreName} =    TestStoreZidship
${ZidshipActivation_Bank} =    بنك مسقط
${ZidshipActivation_BankAccount_FullName} =    BANK ACCountName
${ZidshipActivation_IBAN} =    SA63575378376265324326432543264326432


######################## LOCATORS ##########################
${ZidshipActivation_UploadIDImageBTN}=    xpath=//button[./span='أضف صورة']
${ZidshipActivation_UploadIDImage}=    xpath=//input[@type='file']
${ZidshipActivation_CommercialRecord_ChkBox} =    xpath= //input[@id='checkbox-0']/following::label[1]
${ZidshipActivation_CommercialRecord_Field} =    xpath= //label[text()='رقم السجل التجاري']/following::input[1]   #wait until element is enabled
${ZidshipActivation_FullName_Field} =    xpath= //label[text()='الاسم بالكامل']/following::input[1]
${ZidshipActivation_ZidShip_Email_Field} =    xpath= //label[text()='البريد الإلكتروني']/following::input[1]
${ZidshipActivation_PhoneNumber_Field} =    xpath= //label[text()='رقم الجوال ']/following::input[1]
${ZidshipActivation_CountryCode_DDB} =    xpath= //label[text()='رقم الجوال ']/following::select[1]
${ZidshipActivation_StoreName_Field} =    xpath= //label[text()='اسم المتجر الذي سيظهر في بوليصة الشحن']/following::input[1]
${ZidshipActivation_Bank_DDB} =    xpath= //label[text()='اسم البنك']/following::select[1]
${ZidshipActivation_BankAccount_FullName_Field} =    xpath= //label[text()='اسم صاحب الحساب']/following::input[1]
${ZidshipActivation_IBAN_Field} =    xpath= //label[text()='الأيبان']/following::input[1]
${ZidshipActivation_Next_BTN} =    xpath= //button[./span='التالي']

*** Keywords ***

########################## ACTIONS ##############################

ZidshipActivation Toggle CommercialRecord
    wait until page contains element    ${ZidshipActivation_CommercialRecord_ChkBox}    10
    click element    ${ZidshipActivation_CommercialRecord_ChkBox}

ZidshipActivation Enter CommercialRecord
    [Arguments]    ${ZidshipActivation_CommercialRecord}
    wait until element is enabled    ${ZidshipActivation_CommercialRecord_Field}
    input text    ${ZidshipActivation_CommercialRecord_Field}    ${ZidshipActivation_CommercialRecord}

ZidshipActivation Upload ID Image
    wait until page contains element    ${ZidshipActivation_UploadIDImage}    10
    choose file    ${ZidshipActivation_UploadIDImage}    ${PROJECT_DIR}${/}${ZidshipActivation_ImagePath}

ZidshipActivation Enter FullName
    [Arguments]    ${ZidshipActivation_FullName}
    wait until page contains element    ${ZidshipActivation_FullName_Field}
    input text    ${ZidshipActivation_FullName_Field}    ${ZidshipActivation_FullName}
ZidshipActivation Enter Email
    [Arguments]    ${ZidshipActivation_ZidShipEmail}
    wait until page contains element    ${ZidshipActivation_ZidShip_Email_Field}
    input text    ${ZidshipActivation_ZidShip_Email_Field}    ${ZidshipActivation_ZidShipEmail}
ZidshipActivation Enter PhoneNumber
    [Arguments]    ${ZidshipActivation_PhoneNumber}
    wait until page contains element    ${ZidshipActivation_PhoneNumber_Field}
    input text    ${ZidshipActivation_PhoneNumber_Field}    ${ZidshipActivation_PhoneNumber}
ZidshipActivation Select CountryCode
    [Arguments]    ${ZidshipActivation_CountryCode}
    wait until element is visible    ${ZidshipActivation_CountryCode_DDB}
    click element    ${ZidshipActivation_CountryCode_DDB}
    select from list by value    ${ZidshipActivation_CountryCode_DDB}    ${ZidshipActivation_CountryCode}

ZidshipActivation Enter StoreName
    [Arguments]    ${ZidshipActivation_StoreName}
    wait until page contains element    ${ZidshipActivation_StoreName_Field}
    input text    ${ZidshipActivation_StoreName_Field}    ${ZidshipActivation_StoreName}

ZidshipActivation Enter Bank Account Full Name
    [Arguments]    ${ZidshipActivation_BankAccount_FullName}
    wait until page contains element    ${ZidshipActivation_BankAccount_FullName_Field}
    input text    ${ZidshipActivation_BankAccount_FullName_Field}    ${ZidshipActivation_BankAccount_FullName}

ZidshipActivation Enter IBAN
    [Arguments]    ${ZidshipActivation_IBAN}
    wait until page contains element    ${ZidshipActivation_IBAN_Field}
    input text    ${ZidshipActivation_IBAN_Field}    ${ZidshipActivation_IBAN}

ZidshipActivation Proceed to 2nd Activation Page
    wait until element is enabled    ${ZidshipActivation_Next_BTN}    10
    click button    ${ZidshipActivation_Next_BTN}


######################### SCENARIOS ############################

Enter P1 Activation Details
    ZidshipActivation Toggle CommercialRecord
    ZidshipActivation Enter CommercialRecord    ${ZidshipActivation_CommercialRecord}
    ZidshipActivation Toggle CommercialRecord
    ZidshipActivation Upload ID Image
    ZidshipActivation Enter FullName    ${ZidshipActivation_FullName}
    ZidshipActivation Enter Email    ${ZidshipActivation_ZidShipEmail}
    ZidshipActivation Enter PhoneNumber    ${ZidshipActivation_PhoneNumber}
    ZidshipActivation Select CountryCode    ${ZidshipActivation_CountryCode}
    ZidshipActivation Enter StoreName    ${ZidshipActivation_StoreName}
    ZidshipActivation Enter Bank Account Full Name    ${ZidshipActivation_BankAccount_FullName}
    ZidshipActivation Enter IBAN    ${ZidshipActivation_IBAN}
    ZidshipActivation Proceed to 2nd Activation Page
