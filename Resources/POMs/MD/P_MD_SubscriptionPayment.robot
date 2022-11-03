*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CouponCode_btn}              //button[@class="btn btn-default btn-subscriptions-coupon"]
${CouponCode_field}            //div[@class="flex-center m-t-sm"]/input
${CouponCode_activation_btn}    //div[@class="flex-center m-t-sm"]/a

${Frame}    //div[@id="root"]//iframe[@id="myFrame"]
${VisaNumber_field}    (//div[@id='col-1-0'])[1]//input
${Month/Year_field}    //div[@id='col-2-1']//input[@id='expiration-date']
${CCV_field}           //div[@id='col-2-2']//input[@id='cvv']
${NameOnCard_field}    //div[@id='col-1-3']//input[@id='card-holder']

${BankTransfer_btn}     //input[@id="bank_transfer"]//parent::div//span

${Continue_btn2}        //div[@class="col-md-12"]/button[@class="btn btn-primary update-purchase"]

${AgreeOnTerms_ChB}    //div[@class='col-md-4']//label[@class="container-checkmark"]//span
*** Keywords ***
AddCouponCode
    [Arguments]      ${CouponCode}

    scroll element into view    ${CouponCode_btn}
    click button    ${CouponCode_btn}
    input text     ${CouponCode_field}     ${CouponCode}
    click element    ${CouponCode_activation_btn}
    wait until page contains    تم إضافة الرمز التسويقي

PayWithCreditCard
    [Arguments]    ${VisaNumber}    ${Month/Year}    ${CCV}    ${NameOnCard}
    sleep    3s
    execute javascript    document.getElementById('tapContainer').remove()
    sleep    3s
    select frame    ${Frame}
    input text    ${VisaNumber_field}    ${VisaNumber}
    input text    ${Month/Year_field}    ${Month/Year}
    input text    ${CCV_field}    ${CCV}
    input text    ${NameOnCard_field}    ${NameOnCard}
    unselect frame

PayWithBankTransfer
    wait until element is visible    ${BankTransfer_btn}
    scroll element into view    ${BankTransfer_btn}
    click element    ${BankTransfer_btn}

ClickOnContinueButton
    wait until page contains element    ${Continue_btn2}
    scroll element into view    ${Continue_btn2}
    click element    ${Continue_btn2}
    wait until keyword succeeds    30s    1s    wait until page contains element    ${AgreeOnTerms_ChB}