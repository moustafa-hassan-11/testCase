*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${RenewSuspendedSubscription_button}    //a[@class="btn bg-primary text-hover-white p-x-xl m-t-sm"]
${Renew_button}            //div[@class="m-b-md m-b-lg-0 col-md-6"]//a[@class="btn btn-primary"]

${UpgradeToGrowth_button}         //div[@class="col-md-12"]//a[contains(text(),'رق لنمو')]
${UpgradeToProfessional_button}         //div[@class="col-md-12"]//a[contains(text(),'رق للباقة الإحترافية')]

${SendersName_title2}    //div[@id="addon_sms_sender_id_service"]
${OrdersTextMsgs_title2}    //div[@id="addon_order_notifications_package"]
${CampaignsTextMsgs_title2}    //div[@id="addon_sms_campaign_package"]

${Addition_btn2}    //a[@class="btn btn-primary p-x-xl pull-right"]
*** Keywords ***
ClickOnRenewSubscription
    [Documentation]    Go To Subscription Order Page in suspended or new account

    click element    ${RenewSuspendedSubscription_button}
    wait until page contains    ملخص الطلب

ClickOnRenewPackage
    [Documentation]    Go To Subscription Order Page to renew package

    click element    ${Renew_button}
    wait until page contains    ملخص الطلب

ClickOnUpgradeToGrowthPackage
    [Documentation]    Go To Subscription Order Page to upgrade package

    click element    ${UpgradeToGrowth_button}
    wait until page contains    ملخص الطلب

ClickOnUpgradeToProfessionalPackage
    [Documentation]    Go To Subscription Order Page to upgrade package

    click element    ${UpgradeToProfessional_button}
    wait until page contains    ملخص الطلب

SelectSendersName
    [Documentation]              ( الباندل : السعودية فقط - دول الخليج بدون السعودية - السعودية و دول الخليج )
    [Arguments]      ${SendersName}

    scroll element into view    ${SendersName_title2}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index} =    evaluate  ${index} + 1
          ${SendersName_status} =  run keyword and return status    element should contain    (//div[@id='addon_sms_sender_id_service']//h4)[${index}]    ${SendersName}
          Run Keyword If    ${SendersName_status}     click element    (//div[@id='addon_sms_sender_id_service']//div[@class='container-checkmark']/span)[${index}]
          Exit For Loop If    ${SendersName_status}
    END

SelectOrdersTextMsgs
    [Documentation]              ( الباندل : 5000 - 10000 - 15000 )
    [Arguments]      ${OrdersTextMsgs}

    scroll element into view    ${OrdersTextMsgs_title2}

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

    scroll element into view    ${CampaignsTextMsgs_title2}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
          ${index} =    evaluate  ${index} + 1
          ${CampaignsTextMsgs_status} =  run keyword and return status    element should contain    (//div[@id="addon_sms_campaign_package"]//h4)[${index}]   ${CampaignsTextMsgs}
          Run Keyword If    ${CampaignsTextMsgs_status}     click element    (//div[@id="addon_sms_campaign_package"]//span[@class="checkmark"])[${index}]
          Exit For Loop If    ${CampaignsTextMsgs_status}
    END

ClickOnAdditionButton
    scroll element into view    ${Addition_btn2}
    click element    ${Addition_btn2}
    wait until page contains    ملخص الطلب