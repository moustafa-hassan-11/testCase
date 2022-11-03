*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${CommerceEstablished_Yes} =    //input[@id='inlineRadioCommerce']//following-sibling::span
${CommerceEstablished_No} =    //input[@id='inlineRadioNoCommerce']//following-sibling::span
${Products_Yes} =    //input[@id='inlineRadioProducts']//following-sibling::span
${Products_No} =    //input[@name='is_products_ready'][@value='0']//following-sibling::span
${ProductImages_Yes} =    //input[@id='inlineRadioImages']//following-sibling::span
${ProductImages_No} =    //input[@id='inlineRadioNoImages']//following-sibling::span
${Commercial_BTN} =    //input[@value="commercial"]//following-sibling::img
${Maroof_BTN} =    //input[@value="maroof"]//following-sibling::img
${Record_BTN} =    //input[@value="record"]//following-sibling::img
${NoRecordExisted_BTN} =    //input[@value="no_record_existed"]//following-sibling::img
${StartNow} =    //button[contains(text(),'ابدأ الان ')]
${NeedHelpEstablish} =    //input[@name="established_commerce"]//following-sibling::ins
${NeedHelpProducts} =    //input[@name="products"]//following-sibling::ins
${NeedHelpProductsImages} =    //input[@name="product_images"]//following-sibling::ins

*** Keywords ***
####################### ACTIONS ##########################
VerifySaveReadinessLoaded
    wait until page contains    جاهزية المتجر

SelectIsCommerceEstablished
    [Documentation]    This keyword takes 1 or 0 as an argument
    [Arguments]    ${Condition}
    run keyword if    '${Condition}' == '1'    click element    ${CommerceEstablished_Yes}
    run keyword if    '${Condition}' == '0'    click element    ${CommerceEstablished_No}

SelectIsProductsReady
    [Documentation]    This keyword takes 1 or 0 as an argument
    [Arguments]    ${Condition}
    run keyword if    '${Condition}' == '1'    click element    ${Products_Yes}
    run keyword if    '${Condition}' == '0'    click element    ${Products_No}

SelectIsProductImagesReady
    [Documentation]    This keyword takes 1 or 0 as an argument
    [Arguments]    ${Condition}
    run keyword if    '${Condition}' == '1'    click element    ${ProductImages_Yes}
    run keyword if    '${Condition}' == '0'    click element    ${ProductImages_No}

SelectBusinessText
    [Documentation]    This keyword takes 'commercial' or 'maroof' or 'record' or 'no_record_existed' as an argument
    [Arguments]    ${Condition}
    scroll element into view    ${StartNow}
    run keyword if    '${Condition}' == 'commercial'    click element    ${Commercial_BTN}
    run keyword if    '${Condition}' == 'maroof'    click element    ${Maroof_BTN}
    run keyword if    '${Condition}' == 'record'    click element    ${Record_BTN}
    run keyword if    '${Condition}' == 'no_record_existed'    click element    ${NoRecordExisted_BTN}

SelectNeedHelp
    [Documentation]    This keyword takes '1' or '0' for each checkbox as an argument.
    [Arguments]    ${Condition1}    ${Condition2}    ${Condition3}
    run keyword if    '${Condition1}' == '1'    click element    ${NeedHelpEstablish}
    run keyword if    '${Condition2}' == '1'    click element    ${NeedHelpProducts}
    run keyword if    '${Condition3}' == '1'    click element    ${NeedHelpProductsImages}

ClickStartNow
    click element    ${StartNow}
########################## SCENARIOS #########################
