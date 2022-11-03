*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SendersName_title}    //div[@id="addon_sms_sender_id_service"]
${OrdersTextMsgs_title}    //div[@id="addon_order_notifications_package"]
${CampaignsTextMsgs_title}    //div[@id="addon_sms_campaign_package"]

${SendersName_Expand_btn}    (//i[@class="fa fa-chevron-down"])[1]
${OrdersTextMsgs_Expand_btn}    (//i[@class="fa fa-chevron-down"])[2]
${CampaignsTextMsgs_Expand_btn}    (//i[@class="fa fa-chevron-down"])[3]

${CouponCode_btn}              //button[@class="btn btn-default btn-subscriptions-coupon"]
${CouponCode_field}            //div[@class="flex-center m-t-sm"]/input
${CouponCode_activation_btn}    //div[@class="flex-center m-t-sm"]/a

${Addition_btn}    //button[@class="btn btn-primary pull-right subscriptions-payment-service-add"]
${Sign}            //div[@class='other-box-content']/h3[contains(text(),'ملخص المشتريات')]
${Continue_btn}    //div[@class="col-md-12"]/a[@class="btn btn-primary"]

${BankTransfer_btn}    //input[@id="bank_transfer"]//parent::div//span
${CreditCard_btn}      //input[@id="embedded_credit_card"]//parent::div//span
*** Keywords ***
SelectPackages
    [Documentation]        ( الباندل : شهري - ٣ أشهر - سنوي )(الباقة : الأساسية - النمو - الإحترافية)
    [Arguments]   ${Package}    ${Bundle}

    ${index1} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index1} =    evaluate  ${index1} + 1
          ${package_status} =    run keyword and return status    element should contain    (//label[@class="subscriptions-payment-package-label"])[${index1}]    ${Package}
          Exit For Loop If    ${package_status}
    END

    ${index2} =    Set Variable    0

    FOR    ${j}  IN RANGE    100
          ${index2} =    evaluate  ${index2} + 1
          ${Bundle_status} =    run keyword if    ${package_status}    run keyword and return status    element should contain    //div[@class="subscriptions-payment-package"]//label[contains(text(),'${Package}')]//following-sibling::div/label[@class="subscriptions-payment-package-radio"][${index2}]/label/p    ${Bundle}
          Run Keyword If    ${Bundle_status}     click element    //div[@class="subscriptions-payment-package"]//label[contains(text(),'${Package}')]//following-sibling::div/label[@class="subscriptions-payment-package-radio"][${index2}]/div
          Exit For Loop If    ${Bundle_status}
    END
           wait until page contains    تم تحديث الطلب

SelectSendersName
    [Documentation]              ( الباندل : السعودية فقط - دول الخليج بدون السعودية - السعودية و دول الخليج )
    [Arguments]      ${SendersName}

    scroll element into view    ${SendersName_Expand_btn}
    click element    ${SendersName_Expand_btn}
    scroll element into view    ${SendersName_title}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index} =    evaluate  ${index} + 1
          ${SendersName_status} =  run keyword and return status    element should contain    (//div[@id="addon_sms_sender_id_service"]//label[@class="subscriptions-payment-package-radio"]//h4)[${index}]    ${SendersName}
          Run Keyword If    ${SendersName_status}     click element    (//div[@id="addon_sms_sender_id_service"]//label[@class="subscriptions-payment-package-radio"]//span)[${index}]
          Exit For Loop If    ${SendersName_status}
    END

SelectOrdersTextMsgs
    [Documentation]              ( الباندل : 5000 - 10000 - 15000 )
    [Arguments]      ${OrdersTextMsgs}

    scroll element into view    ${OrdersTextMsgs_Expand_btn}
    click element    ${OrdersTextMsgs_Expand_btn}
    scroll element into view    ${OrdersTextMsgs_title}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index} =    evaluate  ${index} + 1
          ${OrdersTextMsgs_status} =  run keyword and return status    element should contain    (//div[@id="addon_order_notifications_package"]//h4)[${index}]    ${OrdersTextMsgs}
          Run Keyword If    ${OrdersTextMsgs_status}     click element    (//div[@id="addon_order_notifications_package"]//span[@class="checkmark"])[${index}]
          Exit For Loop If    ${OrdersTextMsgs_status}
    END

SelectCampaignsTextMsgs
    [Documentation]              ( الباندل : 1000 - 5000 - 10000 )
    [Arguments]      ${CampaignsTextMsgs}

    scroll element into view    ${CampaignsTextMsgs_Expand_btn}
    click element    ${CampaignsTextMsgs_Expand_btn}
    scroll element into view    ${CampaignsTextMsgs_title}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index} =    evaluate  ${index} + 1
          ${CampaignsTextMsgs_status} =  run keyword and return status    element should contain    (//div[@id="addon_sms_campaign_package"]//h4)[${index}]   ${CampaignsTextMsgs}
          Run Keyword If    ${CampaignsTextMsgs_status}     click element    (//div[@id="addon_sms_campaign_package"]//span[@class="checkmark"])[${index}]
          Exit For Loop If    ${CampaignsTextMsgs_status}
    END

AddCouponCode
    [Arguments]      ${CouponCode}

    scroll element into view    ${CouponCode_btn}
    click button    ${CouponCode_btn}
    input text     ${CouponCode_field}     ${CouponCode}
    click element    ${CouponCode_activation_btn}
    wait until page contains    تم إضافة الرمز التسويقي

ClickOnAdditionButton
    scroll element into view    ${Addition_btn}
    click element    ${Addition_btn}
    wait until page contains    تم إضافة الخدمات بالطلب

ClickOnContinueButton
    scroll element into view   ${Sign}
    scroll element into view    ${Continue_btn}
    click element    ${Continue_btn}
    wait until page contains element    ${BankTransfer_btn}

ClickOnContinueButton2
    scroll element into view   ${Sign}
    scroll element into view    ${Continue_btn}
    click element    ${Continue_btn}
    wait until page contains element    ${CreditCard_btn}



