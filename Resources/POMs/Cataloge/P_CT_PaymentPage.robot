*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CT_CHECKOUT_PAYMENT_CONFIRM_BTN}    //div[@class="div-review-order-confirm-button-bottom ml-auto"]//child::span
${CT_CHECKOUT_PAYMENT_NOTES_FIELD}    //textarea[@id="orderNotes"]
${OrderNumber_Span} =    //span[contains(text(),'رقم الطلب')]//following-sibling::span
*** Keywords ***
SelectPayment
    [Arguments]    ${ct_checkout_payment}
    #wait until element is visible    //span[text()="بطاقة إئتمانية [tap]"]//ancestor::label//div[1]/span
#    wait until element is visible    //span[text()="${ct_checkout_payment}"]//ancestor::label//div[1]/span  7s
    wait until keyword succeeds    21s    3s    click element    //span[text()="${ct_checkout_payment}"]//ancestor::label//div[1]/span
    sleep    2s

OrderNotes
    [Arguments]    ${ct_checkout_notes}
     input text    ${CT_CHECKOUT_PAYMENT_NOTES_FIELD}    ${ct_checkout_notes}

ConfirmPayment
    #click element    ${CT_CHECKOUT_PAYMENT_CONFIRM_BTN}
    #sleep    10s
    wait until keyword succeeds    21s    3s    click element    //a[@id="review-order-confirm-button-bottom"]
   # wait until page contains element    //div[text()='عرض تفاصيل الطلب']

Verify_Successfully_CheckOut
    wait until element is visible    //span[text()='تم إرسال طلبك بنجاح']

GetOrderNumber
    ${OrderNumber} =    get text    ${OrderNumber_Span}
    return from keyword    ${OrderNumber}
OrderDetails
    click element    //span[text()='عرض تفاصيل الطلب']
    wait until page contains element    //h1[contains(text(),'رقم الطلب')]
    sleep    2s

BacKToHome
    click element    //span[text()='العودة للمتجر']
    wait until page contains element    //a[contains(text(),' الصفحة الرئيسية')]
    sleep    2s

CheckPaymentMethodAvailability
    [Arguments]    ${CT_CHECKOUT_PAYMENT_METHOD_NAME}
    ${bool}=    Run Keyword And Return Status    page should contain     ${CT_CHECKOUT_PAYMENT_METHOD_NAME}
    [Return]    ${bool}


verify sucess payment with mada
    wait until page contains element  id=card_number_entry  5s
    input text  id=card_number_entry  4508750015741019
    input text  id=card_holder_name_entry  MIDO AHMED
    input text  //input[@class="expiry"]  0727
    input text  id=cvc_entry  100
    click button  payfor_pay_btn


verify successful payment with selected payment option
    wait until page contains element    //*[@class="container container-mini order-completed-content"]//*[contains(text(),'تم إرسال طلبك بنجاح')]    20s

