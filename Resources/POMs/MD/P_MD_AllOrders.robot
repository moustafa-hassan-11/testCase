*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
${Complete_Status}    مكتمل

${Orders}    //span[text()="الطلبات"]
${AllOrders}    //span[text()="جميع الطلبات"]

${NewOrder_BTN}    //span[text()="إنشاء طلب جديد"]
#${Drafts_BTN}
#${StatusMsg_BTN}
${All_Link}    //a[text()="الكل"]
${New_Link}    //a[text()="جديد"]
${Preparing_Link}    //a[text()="جاري التجهيز"]
${Ready_Link}    //a[text()="جاهز"]
${Shipping_Link}    //a[text()="جاري التوصيل"]
${Completed_Link}    //a[text()="مكتمل"]
${Canceled_Link}

${PreviewdOrdersNumber_DDB}    //label[text()="عدد الطلبات المعروضة في الصفحة"]//following-sibling::div//button

${Search_Field}    //input[@placeholder="بحث في الطلبات"]

${Filteration_DDB}    (//span[text()="فلترة الطلبات"] )[1]
${OrderID_Field}    //input[@placeholder="رقم الطلب"]
${OrderStatus_DDB}    //label[text()="حالة الطلب"]//following-sibling::select
${PaymentID_Field}    //input[@placeholder="معرف عملية الدفع"]
${PaymentMethod_DDB}    //label[text()="طريقة الدفع"]//following-sibling::select
${ShippingMethod_DDB}    //label[text()="طريقة الشحن"]//following-sibling::select
${City_Field}    //label[text()="المدينة"]//following-sibling::div//input
${CustomerName_Field}    //label[text()="اسم العميل"]//following-sibling::div//input
${CreationDate_Checkbox}     //label[text()="حسب تاريخ الإنشاء"]//preceding-sibling::div
${UpdatingDate_Checkbox}     //label[text()="حسب تاريخ التعديل"]//preceding-sibling::div
${FromDate_Bar}     //label[text()="من تاريخ"]//following-sibling::div//input
${ToDate_Bar}     //label[text()="إلى تاريخ"]//following-sibling::div//input
${Confirm_Filteration_BTN}    (//span[text()="فلترة الطلبات"] )[2]
${Cancel_Filteration_BTN}    //span[text()="إلغاء"]

${Export_BTN}    //span[text()="تصدير"]
${Preview_Invoice_BTN}    //span[text()="عرض الفاتورة"]
${Print_ShippingReceipt_BTN}    //span[text()="طباعة بوليصة الشحن"]
${Change_OrderStatus_DDB}    //span[text()="تغيير حالة الطلب"]

${ExportAll_BTN}    //span[text()="تصدير الكل"]
${ProductsSales_BTN}    //span[text()="مبيعات المنتجات"]
${Confirm_BTN}    //span[text()="تأكيد"]

${SelectAll_Checkbox}    //input[@id="checkbox-130"]//parent::div
${AscendingSorting_OrderID_BTN}    //span[text()="رقم الطلب"] //following-sibling::div//span[1]
${DescendingSorting_OrderID_BTN}    //span[text()="رقم الطلب"] //following-sibling::div//span[2]
${AscendingSorting_CustomerName_BTN}    //span[text()="العميل"] //following-sibling::div//span[1]
${DescendingSorting_CustomerName_BTN}    //span[text()="العميل"] //following-sibling::div//span[2]
${AscendingSorting_OrderDate_BTN}    //span[text()="تاريخ الطلب"] //following-sibling::div//span[1]
${DescendingSorting_OrderDate_BTN}    //span[text()="تاريخ الطلب"] //following-sibling::div//span[2]
${AscendingSorting_UpdatingDate_BTN}    //span[text()="تاريخ التعديل"] //following-sibling::div//span[1]
${DescendingSorting_UpdatingDate_BTN}    //span[text()="تاريخ التعديل"] //following-sibling::div//span[2]
${AscendingSorting_Total_BTN}    //span[text()="المجموع"] //following-sibling::div//span[1]
${DescendingSorting_Total_BTN}    //span[text()="المجموع"] //following-sibling::div//span[2]

*** Keywords ***

Open Orders Page
    click element    ${Orders}
#    click element    ${allorders}
    wait until page contains    قائمة الطلبات

New Order Page
    click element    ${NewOrder_BTN}
    #wait until element is visible    //h2[text()="إنشاء طلب جديد"]
    sleep    3s
#Open Drafts Page
#Open OrderStatusMsg Page

################################################## Status Tabs #########################################################
Preview orders_status
    [Arguments]    ${status}
    click link    //a[text()="${status}"]
    sleep    2s

########################################### Number of previewed orders #################################################
Select number of previewed orders
    [Arguments]    ${number}
    click button    ${previewdordersnumber_ddb}
    click element    //div[text()="${number} ["طلبات
    ${count}    get count    //table    //table//tbody
    run keyword if   '${number}'=='${count}'    log    success

################################################## Search for order ####################################################
Search for Order
    [Arguments]    ${data}
    click element    ${search_field}
    input text    ${search_field}    ${data}

################################################# Filteration ##########################################################
Filter by Order ID
    [Arguments]    ${ID}
    click element    ${filteration_ddb}
    click element    ${orderid_field}
    input text    ${orderid_field}    ${ID}

Filter by Order Status
    [Arguments]    ${status}
    click element    ${filteration_ddb}
    click element    ${orderstatus_ddb}
    click element    //label[text()="حالة الطلب"]//following-sibling::select//option[text()="${status}"]

Filter by Payment ID
    [Arguments]    ${ID}
    click element    ${filteration_ddb}
    click element    ${paymentid_field}
    input text    ${paymentid_field}    ${ID}

Filter by Payment Method
    [Arguments]    ${method}
    click element    ${filteration_ddb}
    click element    ${paymentmethod_ddb}
    click element    //option[text()="${method}"]

Filter by Shipping Method
    [Arguments]    ${method}
    click element    ${filteration_ddb}
    click element    ${shippingmethod_ddb}
    click element    //label[text()="طريقة الشحن"]//following-sibling::select//option[text()="${method}"]

Filter by City
    [Arguments]    ${city}
    click element    ${filteration_ddb}
    click element    ${city_field}
    input text    ${city_field}    ${city}
    wait until element is visible    //li[text()="${city}"]
    click element    //li[text()="${city}"]

Filter by Customer Name
    [Arguments]    ${name}
    click element    ${filteration_ddb}
    click element    ${customername_field}
    input text    ${customername_field}    ${name}

Filter by Creation Date
    click element    ${filteration_ddb}
    click element    ${creationdate_checkbox}

Filter by Updating Date
    click element    ${filteration_ddb}
    click element    ${creationdate_checkbox}

Select From Date
    [Arguments]    ${day}    ${month}    ${year}
    click element    ${fromdate_bar}
    wait until element is visible    (//span[@class="day__month_btn up"])[1]
    click element    (//span[@class="day__month_btn up"])[1]
    wait until element is visible    (//span[@class="month__year_btn up"])[1]
    click element    (//span[@class="month__year_btn up"])[1]
    click element    (//span[@class="cell year" and text()="${year}"])[1]
    click element    (//span[@class="cell month" and text()="${month}"])[1]
    click element    (//span[text()="${day}"])[1]    #can select by the day_name

Select To Date
    [Arguments]    ${day}    ${month}    ${year}
    click element    ${todate_bar}
    wait until element is visible   (//span[@class="day__month_btn up"])[2]
    click element    (//span[@class="day__month_btn up"])[2]
    wait until element is visible   (//span[@class="month__year_btn up"])[2]
    click element    (//span[@class="month__year_btn up"])[2]
    click element    (//span[@class="cell year" and text()="${year}"])[2]
    click element    (//span[@class="cell month" and text()="${month}"])[2]
    click element    (//span[text()="${day}"])[2]    #can select by the day_name

Confirm Filteration
    click element  ${confirmfilteration_btn}
    sleep    2s

Cancel Filteration
    click element    ${cancelfilteration_btn}

Remove applied filter
     [Arguments]    ${filter}
     click element    //label[text()="${filter} :"]//preceding-sibling::span
     sleep    2s
############################################### Selecting Orders #######################################################
Select all orders
    click element    ${selectall_checkbox}

Select Order
    [Arguments]    ${ID}
    click element    //a[text()="${ID}"]//parent::td//preceding-sibling::td//div

######################################### Actions for Selected orders ##################################################
Export selected orders
    wait until element is enabled    ${export_btn}
    click element  ${export_btn}

Preview invoice
    wait until element is enabled    ${preview_invoice_btn}
    click element    ${preview_invoice_btn}
    sleep    2s

#Print shipping receipt
    #wait until element is enabled    ${print_shippingreceipt_btn}
    #click element    ${print_shippingreceipt_btn}

Change order status
    [Arguments]    ${status}
    wait until element is enabled    ${change_orderstatus_ddb}
    click element    ${Change_OrderStatus_DDB}
    run keyword if    '${status}'=='${complete_status}'    click element  //span[text()="مكتمل"]
    run keyword if    '${status}'!='${complete_status}'    click element   //div[text()="${status}"]

verify successfully status changing
    [Arguments]    ${Order_ID}    ${status}
    wait until element contains    //a[text()="767939"]//ancestor::tr//td[9]//span    ${status}
######################################### Export_all&Products_Report ###################################################
Export all orders
    click element    ${exportall_btn}
    click element    ${confirm_btn}
    sleep    2s

verify successfully exporting
    page should contain element    //div[text()="تم إرسال طلبك بنجاح وسوف يتم إرسال بريد إلكتروني لك."]

Export products analysis report
    [Arguments]    ${status}
    click element    ${productssales_btn}
    wait until element is visible    //div[@class="abb54f15"]//div[text()="${status}"]//div
    click element    //div[@class="abb54f15"]//div[text()="${status}"]//div
    click element    ${confirm_btn}

######################################################### Sorting ######################################################
Arrange Ascendingly
    [Arguments]    ${Title}
    click element    //span[text()="${Title}"] //following-sibling::div//span[1]

Arrange Descendingly
    [Arguments]    ${Title}
    click element    //span[text()="${Title}"] //following-sibling::div//span[2]

###################################################### Order Row #######################################################
open order details
    [Arguments]    ${ID}
    wait until element is visible    //a[text()="${ID}"]
    click link    //a[text()="${ID}"]
    wait until element is visible    //span[text()="#${ID}"]

order status
    [Arguments]    ${ID}    ${status}
    click element    //a[text()="${ID}"]//parent::td//following-sibling::td[7]//span[2]
    click element    //a[text()="${ID}"]//parent::td//following-sibling::td[7]//button//parent::div//following-sibling::div//div[text()="${status}"]    #complted:span

Expand order details
      [Arguments]    ${ID}
      click button    //a[text()="${ID}"]//parent::td//following-sibling::td[9]//button
      sleep    2s
      #wait until element is visible    //a[text()="767860"]//ancestor::tr//following-sibling::tr


open 1st order
    wait until page contains    (//tr[1]//td[2])[1]/a
    click element    (//tr[1]//td[2])[1]/a

change 1st order status
    click element    (//tr[1]//td[9])[1]//span[2]
    click element    (//tr[1]//td[9])[1]//button//parent::div//following-sibling::div//div[2]













