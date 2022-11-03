*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
${OrdersTab_BTN}    //a[text()="الطلبات"]
${PreviewInvoice_BTN}    //span[text()="عرض الفاتورة"]
${OrderStatus_BTN}      //span[text()="حالة الطلب"]//following-sibling::div//button
${ReactiveOrder}    //div[text()="إعادة تفعيل الطلب"]
${CompleteStatus}    مكتمل
${BoxesNumber_Field}    //label[text()="عدد كراتين الشحنة : "]//following-sibling::input
############################################# Customer Info.############################################################
${CustomerName_Link}    //div[text()="العميل"]//parent::header//following-sibling::div//li[1]//a
${CustomerPhone_Link}    //div[text()="العميل"]//parent::header//following-sibling::div//li[2]//a
${CustomerMail_Link}    //div[text()="العميل"]//parent::header//following-sibling::div//li[3]//a

################################################ Payment ###############################################################
${ConfirmTransformation_BTN}    //span[text()="تأكيد الدفع"]
${Confirm_BTN}    //span[text()="تأكيد"]
${Cancel_BTN}    //span[text()="إلغاء"]
${Preview_BankTransformation_BTN}    //a[text()="إيصال التحويل"]

################################################ Footer ################################################################
${Back_BTN}    //a[text()="السابق"]
${Next_BTN}    //a[text()="التالي"]


*** Keywords ***
Back to Orders Page
     click link    ${OrdersTab_BTN}
     wait until element is visible    //h2[text()="قائمة الطلبات"]

Preview Invoice
    click element    ${PreviewInvoice_BTN}
    wait until element is visible    //h2[text()="فاتورة الطلب"]

Change Order Status
    [Arguments]    ${Status}
    click button    ${OrderStatus_BTN}
    run keyword if    '${Status}' == '${CompleteStatus}'    click element    //span[text()="حالة الطلب"]//following-sibling::div//span[text()="${CompleteStatus}"]
    run keyword unless    '${Status}' == '${CompleteStatus}'    click element    //span[text()="حالة الطلب"]//following-sibling::div//div[text()="${status}"]

Verify Changing Status
    [Arguments]    ${Status}
    wait until element is visible    //span[text()="حالة الطلب"]//following-sibling::div//button//span[text()="${Status}"]


Enter Boxes Number
    [Arguments]    ${Number}
    wait until element is visible    ${BoxesNumber_Field}
    input text    ${BoxesNumber_Field}    ${Number}

Select Store
    [Arguments]    ${Number}
    click element    //label[text()="${Number}"]

Confirm Shipping Boxes
    click element    ${Confirm_BTN}

Cancel the Order
    change order status    ملغي
    wait until element is visible    ${confirm_btn}
    click element    ${Confirm_BTN}
    #sleep    2s

Reactive the Order
    click button    ${orderstatus_btn}
    click element    ${reactiveorder}

Open Customer Page
    ${customer}     get text    ${CustomerName_Link}
    click link    ${CustomerName_Link}
    wait until page contains element  //strong[text()="${customer}"]

Go Back to Preceding Order
    click link   ${Back_BTN}

Go Forward to Following Order
    click link   ${Next_BTN}