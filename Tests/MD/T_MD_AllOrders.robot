*** Settings ***
Documentation    This is Check Out test cases script

Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_AllOrders.robot
Resource    ../../Resources/Common.robot

Test Setup       Start WebTest
Test Teardown    End WebTest

*** Variables ***

*** Keywords ***

open Orders Page
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    #P_MD_Login.MD_Login
    P_MD_AllOrders.Open Orders Page

*** Test Cases ***
############################################## NewOrder & Number of orders #############################################
Open NewOrder Page
     [Tags]    NewOrderPage
     [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
     open Orders Page
     P_MD_allorders.New Order Page

Check number of previewed order as selected
    [Tags]    OrdersNumber
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    click button    //label[text()="عدد الطلبات المعروضة في الصفحة"]//following-sibling::div//button
    #click element    //div[text()="10 طلبات"]
    #${count}    get count    //table    //table//tbody
    #run keyword if   '${count}'=='10'    log to console    success
    p_md_allorders.select number of previewed orders  10

######################################### Preview according order status################################################
preview all_orders
    [Tags]    Preview_All
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    P_MD_allorders.Preview orders_status    الكل

preview new_orders
    [Tags]    Preview_new
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open orders page
    P_MD_allorders.Preview orders_status    جديد

preview preparing_orders
    [Tags]    Preview_preparing
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open orders page
    P_MD_allorders.Preview orders_status    جاري التجهيز

preview ready_orders
    [Tags]    Preview_ready
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open orders page
    P_MD_allorders.Preview orders_status    جاهز

preview shipping_orders
    [Tags]    Preview_shipping
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open orders page
    P_MD_allorders.Preview orders_status   جاري التوصيل

preview completed_orders
    [Tags]    Preview_completed
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open orders page
    P_MD_allorders.Preview orders_status   مكتمل

preview canceled_orders
    [Tags]    Preview_canceled
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open orders page
    P_MD_allorders.Preview orders_status    ملغي

##################################################### Searching ########################################################
Search for order by ID
    [Tags]    Search_OrderID
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.search for order    767860

Search for order by Customer Name
    [Tags]    Search_CustomerName
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.search for order    aya

Search for order by Customer Phone
    [Tags]    Search_CustomerPhone
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.search for order    966566666665

Search for order by Customer Email
    [Tags]    Search_CustomerEmail
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.search for order    aya@test.com

#################################################### Filteration #######################################################
Filter by OrderID
    [Tags]    Filter_OrderID
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by order id  767860
    p_md_allorders.confirm filteration

Filter by OrderStatus
    [Tags]    Filter_OrderStatus
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by order status  جديد
    p_md_allorders.confirm filteration

Filter by PaymentID
    [Tags]    Filter_PaymentID
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by payment id  chg_TS033520211724i3DB2612765
    p_md_allorders.confirm filteration

Filter by PaymentMethod
    [Tags]    Filter_PaymentMethod
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by payment method    التحويل البنكي
    p_md_allorders.confirm filteration

Filter by ShippingMethod
    [Tags]    Filter_ShippingMethod
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by Shipping Method     سمسا
    p_md_allorders.confirm filteration

Filter by City
    [Tags]    Filter_City
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by city    الرياض
    p_md_allorders.confirm filteration

Filter by CustomerName
    [Tags]    Filter_CustomerName
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by Customer Name     aya
    p_md_allorders.confirm filteration

Filter by CreationDate
    [Tags]    Filter_CreationDate
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by Creation Date
    p_md_allorders.select from date    9   فبراير    2021
    P_MD_allorders.Select To Date      9   يناير    2022
    p_md_allorders.confirm filteration

Filter by UpdatingDate
    [Tags]    Filter_UpdatingDate
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by UpdatingDate
    p_md_allorders.select from date    9   فبراير    2021
    P_MD_allorders.Select To Date      9   يناير    2022
    p_md_allorders.confirm filteration

Remove applied filter
    [Tags]    Remove_Filter
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.filter by payment method    التحويل البنكي
    p_md_allorders.confirm filteration
    p_md_allorders.remove applied filter    طريقة الدفع

############################################# Exporting Orders & Analysis ##############################################
Export all orders
    [Tags]    ExportAll
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.export all orders
    p_md_allorders.verify successfully exporting

Export products analysis report
    [Tags]    AnalysisReport
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.export products analysis report   جاهز

########################################### Actions on Selected Orders #################################################
Export selected orders
    [Tags]    Export_Selected
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.select order    767857
    p_md_allorders.export selected orders

Preview selected orders invoice
    [Tags]    previewInvoice_Selected
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.select order    767857
    p_md_allorders.preview invoice

#Print shipping receipt
    #[Tags]    Print
    #open Orders Page
    #p_md_orderspage.select order  767857
    #p_md_orderspage.print shipping receipt

Change selected orders status
    [Tags]    Change_selectedStatus
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    p_md_allorders.select order  767939
    p_md_allorders.select order  767860
    p_md_allorders.change order status    ملغي
    verify successfully status changing    767939    ملغي
    verify successfully status changing    767860    ملغي
    #p_md_orderspage.change order status    مكتمل

#################################################### Sorting ###########################################################

#Arrange Orders_ID ascendingly

#Arrange Customer_Name descendingly

################################################### Order Row ##########################################################
open order details page via orders list
    [Tags]    Open_OrderDetailsPage_list
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    P_MD_AllOrders.open order details    767847

open order details page via order preview
    [Tags]    Open_OrderDetailsPage_preview
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    P_MD_allorders.expand order details    767847
    click link    //a[text()="767847"]//ancestor::tr//following-sibling::tr//a[text()="عرض تفاصيل الطلب"]
    wait until page contains    //span[text()="#767847"]

change order status
    [Tags]    Change_OrderStatus
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    P_MD_allorders.order status    767847    جاهز

Preview order details
    [Tags]    preview_OrderDetails
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    P_MD_allorders.expand order details    767847

cancel order
    [Tags]    cancelOrder
    [Setup]    Start WebTest   MD  ${MD_STAGING_URL}    zid.test.automation@gmail.com    12345678
    open Orders Page
    P_MD_allorders.expand order details    767847
    click element    //a[text()="767847"]//ancestor::tr//following-sibling::tr//span[text()="إلغاء الطلب"]
    #wait until page contains    //h3[contains(text(),"هل انت متأكد من إلغاء الطلب")]
    sleep    5s
    #click element    //span[text()="تأكيد"]