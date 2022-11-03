*** Settings ***
Documentation    This is Check Out test cases script

#Resource    ../../Resources/POMs/MD/P_MD_LoginPage.robot
Resource    ../../Resources/POMs/MD/P_MD_AllOrders.robot
Resource    ../../Resources/POMs/MD/P_MD_OrderDetails.robot
Resource    ../../Resources/Common.robot

Test Setup       Start WebTest
Test Teardown    End WebTest

*** Variables ***
${ClosePopup_button}    //a[@id="pushActionRefuse"]
${Email}     zid.test.automation@gmail.com
${Password}    12345678

*** Keywords ***

open order Details Page
    [Arguments]    ${ID}
    #P_MD_LoginPage.MD_Login
    wait until element is visible    ${ClosePopup_button}
    click link     ${ClosePopup_button}
    P_MD_allorders.Open Orders Page
    P_MD_allorders.open order details    ${ID}

*** Test Cases ***

Go Back to Orders Page
    [Tags]    BackTo_Orders
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767718
    P_MD_orderdetails.Back to Orders Page

Preview Order Invoice
    [Tags]    Preview_Invoice
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767718
    P_MD_orderdetails.Preview Invoice

Go To Customer Profile Page
    [Tags]    Open_CustomerProfile
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767718
    p_md_orderdetails.open customer page

Change the Order Status
    [Tags]    Change_Status
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767723
    p_md_orderdetails.change order status     جاري التجهيز
    p_md_orderdetails.verify changing status  جاري التجهيز

Change the Order Status to be Completed
    [Tags]    Order_Completed
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767723
    p_md_orderdetails.change order status     جاهز
    p_md_orderdetails.enter boxes number    2
    p_md_orderdetails.select store    مخزون الرياض
    p_md_orderdetails.confirm shipping boxes
    p_md_orderdetails.verify changing status  جاهز

Change the Order Status to be Canceled
    [Tags]    Order_Canceled
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767720
    p_md_orderdetails.cancel the order
    p_md_orderdetails.verify changing status  ملغي

Reactive The Order
    [Tags]    Reactive_Order
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    OPEN ORDER DETAILS PAGE    767721
    p_md_orderdetails.reactive the order
