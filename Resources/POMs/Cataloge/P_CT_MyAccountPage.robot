*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${Profile_save_btn}    //*[@class="btn btn-lg btn-primary"]
${logout_btn}        //form[@id="form_logout"]//button[@class="btn btn-lg logout"]
${CustomerName}
${CustomerEmail}
${CustomerName_Field}     //*[@name="first_name"]
${CustomerEmail_Field}    //*[@name="email"]
${MyAddresses_btn}     //a[@href="#addresses"]
${AddNewAddress_btn}    //*[@id="addresses"]//button
${Street_Field}    //*[@id="street"]
${Neighborhood_Field}    //*[@id="region"]
${EnterData_Save_btn}    //button[@class="btn round primary"]
${MyOrders_btn}    //a[@href="#orders"]

*** Keywords ***
VerifyReachMyAccountPage
    wait until page contains    الملف الشخصي

UpdateCustomerName
    [Arguments]    ${CustomerName}

    input text    ${CustomerName_Field}     ${CustomerName}

VerifyUpdatedCustomerName
    reload page
    wait until page contains element     ${CustomerName_Field}
    element text should be         ${CustomerName_Field}    ${CustomerName}

UpdateCustomerEmail
    [Arguments]    ${CustomerEmail}

    input text   ${CustomerEmail_Field}    ${CustomerEmail}

VerifyUpdatedCustomerEmail
    reload page
    wait until page contains element     ${CustomerEmail_Field}
    element text should be         ${CustomerEmail_Field}    ${CustomerEmail}

ClickOnSaveButton
    click button    ${Profile_save_btn}

ClickOnLogout
    click button       ${logout_btn}

VerifySuccessfulLogout
    wait until page contains    تسجيل دخول

ClickOnAddresses
    click element    ${MyAddresses_btn}
    wait until page contains    عناويني

PickAnAddressToBeModified
    [Arguments]    ${CityAddress}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
           ${index} =    evaluate  ${index} + 1
           ${SearchCityName} =    get text    //*[@id="addresses"]/div/div/div[${index}]/div/span[3]
           Run Keyword If    '${SearchCityName}' == '${CityAddress}'     click link    //*[@id="addresses"]/div/div/div[${index}]/div/a[2]
           Exit For Loop If    '${SearchCityName}' == '${CityAddress}'
    END

VerifyReachModifyPage
     wait until page contains   تعديل العنوان

ModifyCustomerAddress
    [Arguments]    ${Country}   ${City}   ${street}   ${neighbourhood}

    click element    //select[@id="country"]/preceding-sibling::div[@class="selectr-selected"]
    sleep    1s
    click element       //select[@id="country"]/preceding-sibling::div[@class="selectr-options-container"]//ul[@class="selectr-options"]//li[text()='${Country}']
    sleep    1s
    click element    //select[@id="city"]/preceding-sibling::div[@class="selectr-selected"]
    sleep   1s
    #Click on CityList
    click element       //select[@id="city"]/preceding-sibling::div[@class="selectr-options-container"]//ul[@class="selectr-options"]//li[text()='${City}']
    input text    ${Street_Field}    ${street}
    input text    ${Neighborhood_Field}    ${neighbourhood}
    CLICK BUTTON    ${EnterData_Save_btn}    #save button

VerifySuccessfulModification
     wait until page contains    عناويني
     reload page
     wait until page contains element    ${MyAddresses_btn}

PickAnAddressToBeRemoved
    [Arguments]    ${CityAddress}

    ${index} =    Set Variable    0

    FOR    ${i}  IN RANGE    100
           ${index} =    evaluate  ${index} + 1
           ${SearchCityName} =    get text    //*[@id="addresses"]/div/div/div[${index}]/div/span[3]
           Run Keyword If    '${SearchCityName}' == '${CityAddress}'     click link    //*[@id="addresses"]/div/div/div[${index}]/div/a[1]
           Exit For Loop If    '${SearchCityName}' == '${CityAddress}'
    END

ClickOnAddNewAddress
    click button    ${AddNewAddress_btn}
    wait until page contains   إضافة عنوان جديد

EnterNewCustomerAddress
    [Arguments]    ${Country}   ${City}   ${street}   ${neighbourhood}

    click element    //select[@id="country"]/preceding-sibling::div[@class="selectr-selected"]
    sleep    1s
    click element       //select[@id="country"]/preceding-sibling::div[@class="selectr-options-container"]//ul[@class="selectr-options"]//li[text()='${Country}']
    sleep    1s
    click element    //select[@id="city"]/preceding-sibling::div[@class="selectr-selected"]
    sleep   1s
    #Click on CityList
    click element       //select[@id="city"]/preceding-sibling::div[@class="selectr-options-container"]//ul[@class="selectr-options"]//li[text()='${City}']
    input text    ${Street_Field}    ${street}
    input text    ${Neighborhood_Field}    ${neighbourhood}
    CLICK BUTTON    ${EnterData_Save_btn}    #save button

VerifySuccessfulAddition
     wait until page contains    عناويني
     reload page
     wait until page contains element    ${MyAddresses_btn}

ClickOnMyOrders
    click link    ${MyOrders_btn}
    wait until page contains    طلباتي

PickAnOrderToShow
    [Arguments]    ${OrderNum}

    ${SearchOrderNum} =    get text    //div[@class="panel col-md-6 panel-primary order-panel"]//a[contains(text(),'${OrderNum}')]
    Run Keyword If    '${SearchOrderNum}' == '${OrderNum}'     click link    //div[@class="panel col-md-6 panel-primary order-panel"]//a[contains(text(),'${OrderNum}')]/span

VerifyReachOrderPage
    sleep    3s
    wait until page contains    المنتجات