*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CT_CHECKOUT_SHIPPING_CONFIRM_BTN}     //div[@class="container container-mini mt-4 continue-wrapper-div-lg"]/a
${ADD_NEW_ADDRESS_BUTTON}  //label[@class="d-flex flex-fill justify-content-center align-items-center"]
${COUNTRY_DROPDOWN}  //div[@class="selectr-container selectr-desktop has-selected"]
${CHOOSEN_COUNTRY}   //*[@class="selectr-options-container"]//*[contains(text(),'السعودية')]
${CITY_DROPDOWN}  //*[@id="app"]/div/div/div/div[2]/div/div/div[3]/div/form/div[1]/div[2]/div
${CHOOSEN_CITY}  //*[@class="selectr-options-container"]//*[contains(text(),'الرياض')]
${STREET_FIELD}  //input[@id="street"]
${STREET_NAME}  maadi
${REGION_FIELD}  //input[@id="region"]
${REGION_NAME}  zahraa almaadi
${ADD_NEW_ADDRESS_SAVE_BUTTON}  //button[@class="btn round primary"]

${UPDATE_ADDRESS_CONTINUE_BUTTON}  //button[@class="btn round primary"]
${ADDRESS_OPTIONS_DROPDOWN_LIST}  //div[@class="card-2 checked"]/div[@class="dropdown-options dropdown show"]
${EDIT_ADDRESS_BUTTON}  //*[@class="card-2 checked"]//*[contains(text(),'تعديل')]

${DELETE_BUTTON}  //*[@class="card-2 checked"]//*[contains(text(),'حذف')]

${SOMEONE_ELSE_WILL_RECIEVE_ORDER_BUTTON}  //label[@class="switch"]
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_NAME_FIELD}  id=name
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_MOBILE_FIELD}  id=mobile
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_COUNTRY_FIELD}  //div[@class="address-select-container"]//div//div[@class="selectr-selected"]
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_COUNTRY}  //*[@class="selectr-options-container"]//*[contains(text(),'السعودية')]
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_STREET}  id=street
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_REGION}  id=region
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_CITY_FIELD}  //div[@class="address-select-container"]/*[@class="selectr-container selectr-desktop"]
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_CITY}  //*[@class="selectr-options-container"]//*[contains(text(),'الرياض')]
${SOMEONE_ELSE_WILL_RECIEVE_ORDER_CONTINUE_BUTTON}  //button[@class="btn round primary"]
${SHIPPING_PAGE_NEXT_BUTTON}  id=checkout-set-payment-next

${CREDIT_CARD_PAYMENT_METHOD}  //span[text()="بطاقة إئتمانية [tap]"]//ancestor::label//div[1]/span

${RECIEVE_FROM_BRANCH_BUTTON}  //div[@class="row"]/div[2]//span[@class="checkmark-radio"]
${BRANCH}  //*[@id="tab-pickup-options"]/div[1]/label/div[1]/span


*** Keywords ***

SelectAddress
   [Arguments]  ${ct_checkout_address}
   #wait until page contains    اختر عنوانك:
   wait until keyword succeeds    21s    3s    click element  xpath=.//p[contains(text(),'${ct_checkout_address}')]//ancestor::div[@class="address-card"]//preceding-sibling::div//span
   #sleep    2s

COP_Toggle
    wait until keyword succeeds    10s    3s    click element    //span[contains(text(),'استلام من الفرع')]

SelectShipping
    [Arguments]    ${ct_checkout_shipping}
    #wait until page contains element    xpath=.//span[text() = ${ct_checkout_shipping}]//parent::div//parent::div//parent::div//span
    wait until keyword succeeds    10s    3s    click element    xpath=.//span[contains(text(),'${ct_checkout_shipping}')]//parent::div//parent::div//parent::div//span
    #sleep    5s


ConfirmShipping
    wait until element is visible    ${CT_CHECKOUT_SHIPPING_CONFIRM_BTN}
    click link    ${CT_CHECKOUT_SHIPPING_CONFIRM_BTN}
    sleep    3s

#delete address
#new address
Select Recieve from a Branch Option
    wait until keyword succeeds    21s    3s    click element  ${RECIEVE_FROM_BRANCH_BUTTON}
    wait until keyword succeeds    21s    3s    click element  ${BRANCH}


Verify that Recieve from a branch option was choosen
    wait until keyword succeeds  100s  1s   wait until page contains element  ${CREDIT_CARD_PAYMENT_METHOD}
    click element  ${CREDIT_CARD_PAYMENT_METHOD}
    sleep  1s


New Address
    wait until page contains element     ${ADD_NEW_ADDRESS_BUTTON}    21s
    wait until keyword succeeds  21s  1s   click element  ${ADD_NEW_ADDRESS_BUTTON}
    wait until keyword succeeds  21s  1s   wait until page contains element  ${COUNTRY_DROPDOWN}
    click element  ${COUNTRY_DROPDOWN}
    click element  ${CHOOSEN_COUNTRY}
    click element  ${CITY_DROPDOWN}
    click element  ${CHOOSEN_CITY}
    input text    ${STREET_FIELD}  ${STREET_NAME}
    input text    ${REGION_FIELD}  ${REGION_NAME}
    click button  ${ADD_NEW_ADDRESS_SAVE_BUTTON}
    wait until page contains element     ${ADD_NEW_ADDRESS_BUTTON}    21s

Update Address
    wait until page contains element     ${ADDRESS_OPTIONS_DROPDOWN_LIST}    21s
    wait until keyword succeeds  21s  1s    click element  ${ADDRESS_OPTIONS_DROPDOWN_LIST}
    click element  ${EDIT_ADDRESS_BUTTON}
    wait until page contains element  ${COUNTRY_DROPDOWN}    21s
    click element  ${COUNTRY_DROPDOWN}
    click element  ${CHOOSEN_COUNTRY}
    wait until keyword succeeds  21s  1s   wait until page contains element  ${CITY_DROPDOWN}
    click element  ${CITY_DROPDOWN}
    click element  ${CHOOSEN_CITY}
    click button  ${UPDATE_ADDRESS_CONTINUE_BUTTON}
    wait until element is visible    ${ADD_NEW_ADDRESS_BUTTON}    21s

Delete Address
    wait until page contains element    ${ADDRESS_OPTIONS_DROPDOWN_LIST}    21s
    wait until keyword succeeds    21s    1s   click element    ${ADDRESS_OPTIONS_DROPDOWN_LIST}
    click element  ${DELETE_BUTTON}
    wait until element is visible    ${ADD_NEW_ADDRESS_BUTTON}    21s

SomeoneElseWillRecieveTheOrder
    wait until page contains element    ${ADDRESS_OPTIONS_DROPDOWN_LIST}    21s
    wait until keyword succeeds    21s    1s    click element    ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_BUTTON}
    wait until page contains element  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_NAME_FIELD}    21s
    input text  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_NAME_FIELD}  Mohamed Magdy
    input text  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_MOBILE_FIELD}  500000003
    wait until keyword succeeds    10s    1s    click element  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_COUNTRY_FIELD}
    wait until element is enabled    ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_COUNTRY}
    click element  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_COUNTRY}
    click element  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_CITY_FIELD}
    click element  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_CITY}
    input text    ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_STREET}  maadi
    input text    ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_REGION}  zahraa almaadi
    click button  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_CONTINUE_BUTTON}
    #element should be enabled  ${SOMEONE_ELSE_WILL_RECIEVE_ORDER_BUTTON}
    wait until element is visible    ${ADD_NEW_ADDRESS_BUTTON}    21s
    click element  ${SHIPPING_PAGE_NEXT_BUTTON}
    wait until element is visible    ${ADD_NEW_ADDRESS_BUTTON}    21s

Shipping Option name Check in Payment Page
    [Arguments]  ${ct_Shipping_Option_Verrification}
     wait until keyword succeeds  10s  1s   wait until page contains element  //*[@class="d-flex align-items-center"]//*[contains(text(),'${ct_Shipping_Option_Verrification}')]