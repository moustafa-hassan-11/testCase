*** Settings ***
############# Libraries ###########
Documentation

Library    String
Resource  ../Resources/POMs/MD/P_MD_CreateProduct.robot
Resource  ../Resources/POMs/MD/P_MD_SubscriptionManagement.robot
Resource  ../Resources/POMs/MD/P_MD_SubscriptionOrder.robot
Resource  ../Resources/POMs/MD/P_MD_SideMenu.robot
Resource  ../Resources/POMs/MD/P_MD_SubscriptionPayment.robot
Resource  ../Resources/POMs/MD/P_MD_SubscriptionOrderConfirmation.robot
Resource    ../Resources/POMs/MD/P_MD_Login.robot
Resource    ../Resources/POMs/MD/P_MD_RegisterInfo.robot
Resource    ../Resources/POMs/MD/P_MD_Warehouse.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/POMs/MD/P_MD_PaymentOptions.robot
Resource    ../Resources/POMs/MD/P_MD_ShippingAndDeliveryCompanies.robot
Resource  ../Resources/POMs/MD/P_MD_CouponsPage.robot
Resource  ../Resources/POMs/MD/P_MD_CouponsDetailsPage.robot
Resource    ../Resources/POMs/MD/P_MD_AllProducts.robot
Resource    ../Resources/POMs/Cataloge/P_CT_MainKeywords.robot
Resource    ../Resources/POMs/MD/P_MD_AllOrders.robot



Test Setup    Start WebTest
Test Teardown    End WebTest

*** Variables ***
############# Global Variables ###########
${EMAIL} =    at.recurring.testing2@gmail.com
${PASSWORD} =    Tarek12345
${Catalog_URL} =    https://staging-catalog.zid.sa/atrecurring2
${Package}    النمو
${Bundle}    ٣ أشهر

${CouponName}    Abdallah

${NewCouponName}    Discount2
${CouponCode}       Discount2
${CouponType}    نسبة من المجموع
${CouponValue}    100

${MinimumAmount}    10

${StartMonth}    February 2022
${StartDay}    7
${EndMonth}    March 2023
${EndDay}       30

${CouponUsageLimit}     33
${CouponUsageLimitForOneCustomer}    2

*** Test Cases ***

RegisterNewAccount
    [Tags]    We
    [Setup]    Start WebTest   REG  ${MD_Testing_REG_URL}
    ValidRegister    fix    TestName@ffe.sa    12345678    548568235    966    1234    1    0    1    no_record_existed    1    0    1

SubscribeToRenewPackage
    [Documentation]    renew package
    [Tags]    Subscription1
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    ${EMAIL}    ${PASSWORD}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectPackages    ${Package}    ${Bundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.ClickOnAgreeOnTermsCheckBox
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton

AddNewWarehouseTest
    [Tags]    Main
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    ${EMAIL}    ${PASSWORD}
    P_MD_SideMenu.GoTo PaymentOptions
    P_MD_PaymentOptions.Add New Bank Account
        #add warehouse
    P_MD_SideMenu.GoTo Setting
    P_MD_Warehouse.GoTo WarehousePage
    P_MD_Warehouse.Add New Warehouse
        #modify warehouse
    P_MD_Warehouse.Edit Warehouse

ActivateSmsa_Demo
    [Tags]    demo_activateSMSA
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    ${EMAIL}    ${PASSWORD}
    P_MD_SideMenu.GoTo Setting
    P_MD_SideMenu.GoTo ShippingOptions
    P_MD_ShippingAndDeliveryCompanies.ActivateSmsa    20    10

CreateNewCoupon
    [Documentation]    Create New Coupon
    [Tags]    Coupons1
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    ${Email}    ${Password}

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

Add New Product
    [Documentation]   Add New Product
    [Tags]    Demo_AddNewProduct
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.click New Product
    P_MD_AllProducts.Enter Arabic_Name    منتج
    P_MD_AllProducts.Enter English_Name   Product
    P_MD_AllProducts.Enter Product Price    100
    P_MD_AllProducts.Product Discount    50
    P_MD_AllProducts.Enter Product Weight    100
    P_MD_AllProducts.Select Unlimited Quantity
    P_MD_AllProducts.Enter Product Cost    30
    P_MD_AllProducts.Publish Product On Store
    P_MD_AllProducts.Save the Product

Create Order
    [Setup]    Start WebTest   None
    [Tags]    CT1
    P_CT_HomePage.GoToCatalog    ${Catalog_URL}
    ${OrderNumber} =    P_CT_MainKeywords.Complete Checkout    ${NewCouponName}
















