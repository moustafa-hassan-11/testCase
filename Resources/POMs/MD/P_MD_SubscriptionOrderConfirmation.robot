*** Settings ***
Library    SeleniumLibrary

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AddBankTransfer_btn}    //div[@class="subscriptions-payment-package__bank-transfer-slip"]//input

${AgreeOnTerms_ChB}    (//label[@class="container-checkmark"]//span)[2]

${Confirmation_btn}    //div[@class="col-md-12"]//button[@id="confirm-purchase"]

${Frame2}        //iframe[@id='challengeFrame']
${Submit_btn}    //td/input[@id="acssubmit"]

${image}    ${EXECDIR}/Resources/image.png
*** Keywords ***
AddBankTransfer
    choose file    ${AddBankTransfer_btn}    ${image}

ClickOnConfirmationButton
    wait until element is visible    ${Confirmation_btn}
    scroll element into view    ${Confirmation_btn}
    click element    ${Confirmation_btn}
    wait until keyword succeeds    60s    1s    wait until page contains    تم رفع إيصال التحويل البنكي بنجاح

ClickOnConfirmationButton2
    wait until element is visible    ${Confirmation_btn}
    scroll element into view    ${Confirmation_btn}
    click element    ${Confirmation_btn}

ClickOnAgreeOnTermsCheckbox
    wait until element is visible    ${AgreeOnTerms_ChB}
    scroll element into view    ${AgreeOnTerms_ChB}
    click element    ${AgreeOnTerms_ChB}

VerifyPayWithBankTransfer
    wait until page contains    تم رفع إيصال التحويل البنكي بنجاح

ConfirmPayWithCreditCard
    wait until keyword succeeds    180s    1s    select frame    ${Frame2}
    wait until keyword succeeds    60s    1s    wait until element is visible    ${Submit_btn}
    click element    ${Submit_btn}
    unselect frame
    wait until keyword succeeds    180s    1s    wait until page contains    تم تأكيد عملية الشراء

VerifyPayWithCreditCard
    wait until page contains     تم تأكيد عملية الشراء

