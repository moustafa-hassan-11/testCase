*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
${AddCoupon_BTN}    //a[@class="btn btn-success btn-sm"]
${Reports_BTN}      //a[@class="btn btn-outline-success btn-sm"]

*** Keywords ***
ClickOnEditCoupon
    [Documentation]        Edit existing coupon
    [Arguments]   ${CouponName}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index} =    evaluate  ${index} + 1
          ${CouponName_status} =    run keyword and return status    element should contain    (//td[@class="zid-table-cell first-cell"])[${index}]/a[text()='${CouponName}']    ${CouponName}
          run keyword if    ${CouponName_status}  click element    (//td[@class="zid-table-cell first-cell"])[${index}]/a[text()='${CouponName}']
          Exit For Loop If    ${CouponName_status}
    END
    wait until page contains    تعديل قسيمة التخفيض

ClickOnAddNewCoupon
    [Documentation]        open page to add new coupon

    click element    ${AddCoupon_BTN}
       wait until page contains     إنشاء قسيمة جديدة

ClickOnReports
    [Documentation]        open reports page

    click element    ${Reports_BTN}
    wait until page contains     تقارير قسائم التخفيض