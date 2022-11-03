*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***

######################## LOCATORS ##########################
${SmsaActivationPage_BTN} =    //a[@href="https://staging-web.zid.sa//account/settings/delivery-options/system-delivery-options/smsa"]
${SmsaPassKey} =    //input[@name="credentials[token]"]
${ShippingPrice_Field} =    //select[@id="weight_cost_edit"]
${FixedShippingPrice_Field_Saudi} =    //h3[contains(text(),'السعودية')]//following-sibling::div//input
${FixedShippingPrice_COD_Checkbox_Saudi} =    (//h3[contains(text(),'السعودية')]//ancestor::div[@class="shipping-cost d-flex align-items-center"]//label//span)[1]
${FixedShippingPrice_COD_Field_Saudi} =    //h3[contains(text(),'السعودية')]//ancestor::div[@class="shipping-cost d-flex align-items-center"]//input[@name="countries[SA][cod][cost]"]
${SmsaConfirmationCheckBox} =    //div[@class="shipping-activation-confirmation"]/label/span/span
${SmsaActivation_BTN} =    //button[@id="submit-activation-btn"]
${SmsaLogo} =    //img[@src="https://zid-platform.s3.eu-west-1.amazonaws.com/static/default/icons/zid_smsa_2.png"]
*** Keywords ***

ActivateSmsa
    [Arguments]    ${ShippingPrice}    ${ShippingCOD}
    scroll element into view    ${SmsaLogo}
    click link    ${SmsaActivationPage_BTN}
    wait until page contains    إذا كان لديك حساب تجارة إلكترونية في سمسا
    #Needs a valid pass key.
    input text    ${SmsaPassKey}    Ujt@1755
    select from list by value    ${ShippingPrice_Field}    0
    input text    ${FixedShippingPrice_Field_Saudi}    ${ShippingPrice}
    click element    ${FixedShippingPrice_COD_Checkbox_Saudi}
    input text    ${FixedShippingPrice_COD_Field_Saudi}    ${ShippingCOD}
    scroll element into view    ${SmsaConfirmationCheckBox}
    click element     ${SmsaConfirmationCheckBox}
    wait until element is enabled    ${SmsaActivation_BTN}
    click button    ${SmsaActivation_BTN}