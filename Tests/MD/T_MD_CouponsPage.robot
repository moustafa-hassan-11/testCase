*** Settings ***
Documentation    This is MD Coupons test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource  ../../Resources/POMs/MD/P_MD_CouponsPage.robot
Resource  ../../Resources/POMs/MD/P_MD_CouponsDetailsPage.robot

Test Setup       Start WebTest
Test Teardown    End WebTest

*** Variables ***
${CouponName}    Abdallah

${NewCouponName}    maya
${CouponCode}       maya
${CouponType}    نسبة من المجموع
${CouponValue}    100

${MinimumAmount}    10

${StartMonth}    February 2022
${StartDay}    28
${EndMonth}    March 2022
${EndDay}       22

${CouponUsageLimit}     33
${CouponUsageLimitForOneCustomer}    2

*** Test Cases ***
EditExistingCoupon
    [Documentation]    Edit Existing Coupon
    [Tags]    Coupons
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    os1987@yahoo.com    12345678

    P_MD_SideMenu.GoTo Marketing
    P_MD_SideMenu.GoTo CouponsPage
    P_MD_CouponsPage.ClickOnEditCoupon    ${CouponName}
    P_MD_CouponsDetailsPage.EnterCouponType    ${CouponType}
    P_MD_CouponsDetailsPage.EnterCouponValue    ${CouponValue}
    P_MD_CouponsDetailsPage.UnselectAdditionalOptionsFreeShipping
    P_MD_CouponsDetailsPage.UnselectAdditionalOptionsFreeCOD
    P_MD_CouponsDetailsPage.EnterMinimumAmountOfOrder    ${MinimumAmount}
    P_MD_CouponsDetailsPage.SelectCouponStartDate    ${StartMonth}    ${StartDay}
    P_MD_CouponsDetailsPage.SelectCouponEndDate    ${EndMonth}   ${EndDay}
    P_MD_CouponsDetailsPage.EnterCouponUsageLimit    ${CouponUsageLimit}
    P_MD_CouponsDetailsPage.EnterCouponUsageLimitForOneCustomer    ${CouponUsageLimitForOneCustomer}
    P_MD_CouponsDetailsPage.ActivateCoupon
    P_MD_CouponsDetailsPage.ClickOnSaveButton
    P_MD_CouponsDetailsPage.VerifySuccessfulEditing

CreateNewCoupon
    [Documentation]    Create New Coupon
    [Tags]    Coupons
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    os1987@yahoo.com    12345678

    P_MD_SideMenu.GoTo Marketing
    P_MD_SideMenu.GoTo CouponsPage
    P_MD_CouponsPage.ClickOnAddNewCoupon
    P_MD_CouponsDetailsPage.EnterCouponName    ${NewCouponName}
    P_MD_CouponsDetailsPage.EnterCouponCode    ${CouponCode}
    P_MD_CouponsDetailsPage.EnterCouponType    ${CouponType}
    P_MD_CouponsDetailsPage.EnterCouponValue    ${CouponValue}
    P_MD_CouponsDetailsPage.UnselectAdditionalOptionsFreeShipping
    P_MD_CouponsDetailsPage.UnselectAdditionalOptionsFreeCOD
    P_MD_CouponsDetailsPage.EnterMinimumAmountOfOrder    ${MinimumAmount}
    P_MD_CouponsDetailsPage.SelectCouponStartDate    ${StartMonth}    ${StartDay}
    P_MD_CouponsDetailsPage.SelectCouponEndDate    ${EndMonth}   ${EndDay}
    P_MD_CouponsDetailsPage.EnterCouponUsageLimit    ${CouponUsageLimit}
    P_MD_CouponsDetailsPage.EnterCouponUsageLimitForOneCustomer    ${CouponUsageLimitForOneCustomer}
    P_MD_CouponsDetailsPage.ActivateCoupon
    P_MD_CouponsDetailsPage.ClickOnSaveButton
    P_MD_CouponsDetailsPage.VerifySuccessfulAddition
