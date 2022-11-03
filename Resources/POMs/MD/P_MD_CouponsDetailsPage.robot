*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
${CouponsName_Field}    //input[@id="name"]
${MD_CouponCode_Field}    //input[@id="code"]

${CouponValue_Field}    //div[@class="form-group"]/input[@id="discount"]
${FreeShipping_CHB}    //input[@id="free_shipping_checkbox"]/parent::div/ins
${FreeCOD_CHB}    //input[@id="free_cod_checkbox"]/parent::div/ins

${MinimumAmountOfOrder_Field}    //input[@id="total"]

${StartDate_Field}    //input[@id="date_start"]
${EndDate_Field}    //input[@id="date_end"]

${CouponUsageLimit_Field}    //input[@id="uses_total"]
${CouponUsageLimitForOneCustomer_Field}    //input[@id="uses_customer"]

${CouponStatus_Toggle}    //div[@class="opp-dir"]//input[2]
${CouponToggle_Btn}       //div[@class="opp-dir"]//span

${Save_Btn}    //button[@type="submit"]
${Delete_Btn}  (//button[@id="add-form-delete-button"])[1]

*** Keywords ***
EnterCouponName
    [Documentation]        Enter Coupon name
    [Arguments]   ${CouponName}

    input text    ${CouponsName_Field}    ${CouponName}

EnterCouponCode
    [Documentation]        Enter Coupon code
    [Arguments]   ${CouponCode}

    input text    ${MD_CouponCode_Field}   ${CouponCode}

EnterCouponType
    [Documentation]        Enter Coupon type    مبلغ من المجموع او نسبة من المجموع
    [Arguments]   ${CouponType}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    3
          ${index} =    evaluate  ${index} + 1
          ${CouponType_ref} =    get text    (//label[@class="custom-control-label"])[${index}]
          run keyword if    '${CouponType_ref}' == '${CouponType}'  click element    (//label[@class="custom-control-label"])[${index}]/div/ins
          Exit For Loop If    '${CouponType_ref}' == '${CouponType}'
    END

EnterCouponValue
    [Documentation]        Enter Coupon value  (number)
    [Arguments]   ${CouponValue}

    input text    ${CouponValue_Field}   ${CouponValue}

UnselectAdditionalOptionsFreeShipping
    [Documentation]        Enter additional options ( شحن مجاني) , checked by default

    click element    ${FreeShipping_CHB}

UnselectAdditionalOptionsFreeCOD
    [Documentation]        Enter additional options ( بدون رسوم دغع عند الاستلام) , checked by default

    click element    ${FreeCOD_CHB}

EnterMinimumAmountOfOrder
    [Documentation]        Enter Minimum Amount Of Order
    [Arguments]   ${MinimumAmount}

    input text    ${MinimumAmountOfOrder_Field}    ${MinimumAmount}

SelectCouponStartDate
    [Documentation]        Select Start Date    ie: month -> october 2021 , day -> (1 - 31)
    [Arguments]   ${StartMonth}    ${StartDay}

    scroll element into view    ${StartDate_Field}
    click element    ${StartDate_Field}

    FOR    ${i}  IN RANGE    1000000
          ${StartMonth_ref} =    get text    //div[@class="datepicker-days"]//thead//th[@class="datepicker-switch"]
          run keyword if    '${StartMonth_ref}' != '${StartMonth}'  click element    //div[@class="datepicker-days"]//thead//th[@class="next"]
          Exit For Loop If    '${StartMonth_ref}' == '${StartMonth}'
    END

    sleep    1s

    ${index} =    Set Variable    0

    FOR    ${j}  IN RANGE    35
          ${index} =    evaluate  ${index} + 1
          ${StartDay_ref} =    get text    (//div[@class="datepicker-days"]//tbody//td[@class="day"])[${index}]
          run keyword if    '${StartDay_ref}' == '${StartDay}'  click element    (//div[@class="datepicker-days"]//tbody//td[@class="day"])[${index}]
          Exit For Loop If    '${StartDay_ref}' == '${StartDay}'
    END

SelectCouponEndDate
    [Documentation]        Select End Date    ie: month -> october 2021 , day -> (1 - 31)
    [Arguments]   ${EndMonth}    ${EndDay}

    scroll element into view    ${EndDate_Field}
    click element    ${EndDate_Field}

    FOR    ${i}  IN RANGE    1000000
          ${EndMonth_ref} =    get text    //div[@class="datepicker-days"]//thead//th[@class="datepicker-switch"]
          run keyword if    '${EndMonth_ref}' != '${EndMonth}'  click element    //div[@class="datepicker-days"]//thead//th[@class="next"]
          Exit For Loop If    '${EndMonth_ref}' == '${EndMonth}'
    END

    sleep    1s

    ${index} =    Set Variable    0

    FOR    ${j}  IN RANGE    35
          ${index} =    evaluate  ${index} + 1
          ${EndDay_ref} =    get text    (//div[@class="datepicker-days"]//tbody//td[@class="day"])[${index}]
          run keyword if    '${EndDay_ref}' == '${EndDay}'  click element    (//div[@class="datepicker-days"]//tbody//td[@class="day"])[${index}]
          Exit For Loop If    '${EndDay_ref}' == '${EndDay}'
    END

EnterCouponUsageLimit
    [Documentation]        Enter Coupon Usage Limit
    [Arguments]   ${CouponUsageLimit}

    scroll element into view    ${CouponUsageLimit_Field}
    input text    ${CouponUsageLimit_Field}    ${CouponUsageLimit}

EnterCouponUsageLimitForOneCustomer
    [Documentation]        Enter Coupon Usage Limit For One Customer
    [Arguments]   ${CouponUsageLimitForOneCustomer}

    scroll element into view    ${CouponUsageLimitForOneCustomer_Field}
    input text    ${CouponUsageLimitForOneCustomer_Field}    ${CouponUsageLimitForOneCustomer}

ActivateCoupon
     [Documentation]        Activate Coupon

     ${CouponStatus} =    get value    ${CouponStatus_Toggle}
     run keyword if    '${CouponStatus}' == '0'    click element    ${CouponToggle_BTN}

DeactivateCoupon
    [Documentation]        Deactivate Coupon

    ${CouponStatus} =    get value    ${CouponStatus_Toggle}
    run keyword if    '${CouponStatus}' == '1'    click element    ${CouponToggle_BTN}

ClickOnSaveButton
    [Documentation]        Click On Save Button

    click element    ${Save_Btn}

ClickOnDeleteButton
    [Documentation]        Click On Delete Button

    click element    ${Delete_Btn}

VerifySuccessfulAddition
    [Documentation]       Verify Successful Addition of new Coupon

    WAIT UNTIL PAGE CONTAINS    تمت إضافة الكوبون بنجاح

VerifySuccessfulEditing
    [Documentation]       Verify Successful Editing of existing Coupon

    WAIT UNTIL PAGE CONTAINS      تمت عملية تحديث الكوبون بنجاح