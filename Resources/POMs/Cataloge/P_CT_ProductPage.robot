*** Settings ***
Library    SeleniumLibrary
Library           Collections
Library    String

*** Variables ***

${QuantityList}    //select[@id="quantity-select"]
${AddToCart_ProductPage}    //button[@id="product-view-add-to-cart"]
${CartIconP}    //a[@id="z-header-shopping-cart"]
${Spinner}    //button[@id="product-view-add-to-cart"]//img
${ProductPageName}    //div[@class="product-info text-center"]//h1
${CartCount}  xpath=//a[@id="z-header-shopping-cart"]//span[@class="zid-shopping-basket-count"]
${ProductVariation}    //form/div[@class="form-element form-select product-options"]
${ProductVariationList}    //form/div[@class="form-element form-select product-options"]//select
@{NoOfVariations}    1    2    3    4    5  6    7    8
@{Variations}
${BundleOfferType}    //div[@class='bundle-products-header mb-4']//p
${BundleProductsContainer}    //div[@class='bundle-production-list row']
${BundleProducts}    //div[@class='bundle-production-list row']/div
${BundleClass}    //div[@class="bundle-wrapper"]//div//span[@class="bundle-name"]
${BundleMessage}    //div[@class='bundle-wrapper']//div[@class='bundle-msg danger']//span
${space}
${Option_TextField}    //div[@class="text-left col"]/div/input[@type="text"]
${Option_NumberField}    //div[@class="text-left col"]/div/input[@type="number"]
${Option_DDL}    //div[@class="text-left col"]//select[@class='form-control']
${OptionPrice}
${One}    1



*** Keywords ***

AddProductToCart
    click element    ${AddToCart_ProductPage}
    wait until element is not visible    ${Spinner}
###########################################################################################################################################
ProductQuantity
    [Arguments]    ${Quantity}
    select from list by value    ${QuantityList}    ${Quantity}
    ${SelectedQuantity} =    get selected list value    ${QuantityList}
    should be equal as integers    ${SelectedQuantity}    ${Quantity}

VerifyTheNumberOfUnitsAddedToCart
    [Arguments]    ${ExpectedUnits}
    ${ProductName} =    get text    ${ProductPageName}
    wait until page contains element    ${cartcount}
    wait until keyword succeeds    5s    1s    click element    ${CartIconP}
    wait until page contains    إتمام عملية الشراء
    ${Units} =    wait until keyword succeeds    5s    1s    get text    //div[@class="shopping-cart-items"]//h3/a[contains(text(),'${ProductName}')]//ancestor::h3//following-sibling::h4/span[1]
    should be equal as integers    ${ExpectedUnits}    ${Units}
############################################################################################################################################
SelectProductVariation
    [Documentation]    This keyword takes the variation index(for example "size: M,L,XL" the "L" variation index in the default theme will be 2) then apply this index for all other variation, after that it checks the number of variations in the product and apply the select, and return a list contain the variations values to verify it from the cart popup.

    [Arguments]    ${VariationIndex}
    @{Variations}=    Create List
    ${ProductName} =    get text    ${ProductPageName}
    Append To List    ${Variations}    ${ProductName}${space}
    ${ExistingVariations} =    get element count    ${ProductVariation}
    FOR    ${i}  IN RANGE    1    ${ExistingVariations}+1
        #Selecting the variations
        run keyword if    '${ExistingVariations}' >= '${i}'    select from list by index    (${ProductVariationList})[${i}]    ${VariationIndex}
        ${Variation}=    get selected list value    (${ProductVariationList})[${i}]
        Append To List    ${Variations}    ${space}${Variation}${space}
        ${Handler1}=    run keyword if    '${ExistingVariations}' == '${i}'    remove string    ${Variations}[${i}]    ${space}
        exit for loop if    '${ExistingVariations}' == '${i}'
    END
    set list value    ${Variations}    ${i}    ${space}${Handler1}
    return from keyword    @{Variations}

VerifyProductVariations
    [Arguments]    @{List}
    ${ProductName} =    get text    ${ProductPageName}
    wait until page contains element    ${cartcount}
    wait until keyword succeeds    5s    1s    click element    ${CartIconP}
    wait until page contains    إتمام عملية الشراء
    ${SelectedVariations} =    wait until keyword succeeds    5s    1s    get text    //div[@class="shopping-cart-items"]//h3/a[contains(text(),'${ProductName}')]
    log  ${SelectedVariations}
    @{SplittedVariations} =    split string    ${SelectedVariations}    -
    lists should be equal    ${list}    ${SplittedVariations}
############################################################################################################################################
ProductWithBundleOffer
    [Documentation]    This keyword checks the bundle offer title, the number of bundle offer products and then add it to cart.
    [Arguments]
    wait until element is visible    ${BundleOfferType}
    scroll element into view    ${BundleOfferType}
    #element should contain    ${BundleOfferType}    في حال شرائك لهذا المنتج٬ ستحصل على أحد المنتجات التالية
    wait until element is visible    ${BundleProductsContainer}
    scroll element into view    ${BundleProductsContainer}
    ${Count} =    get element count    ${BundleProducts}
    should be true    ${Count}>0
    Click element    ${BundleProducts}/div/div[2]/p

VerifyBundleOffer
    ${ProductName} =    get text    ${ProductPageName}
    wait until page contains element    ${cartcount}
    Sleep    5s
    click element    ${CartIconP}
    wait until page contains element     ${BundleMessage}    20s
    ${Handler2} =    get text    ${BundleMessage}
    should be equal    ${Handler2}    حزمة تسويقية - منتج مجاني
    #Element Should Contain    ${Handler2}    حزمة تسويقية - منتج مجاني

VerifyBundleOfferDiscount
    [Arguments]     ${CT_DiscountValue}
    ${ProductName} =    get text    ${ProductPageName}
    wait until page contains element    ${cartcount}
    Sleep    5s
    click element    ${CartIconP}
    wait until page contains element   ${BundleMessage}    20s
    ${Handler2} =    get text    ${BundleMessage}
    should be equal    ${Handler2}      ${CT_DiscountValue}

#################################################### OPTIONS ###############################################################################

SelectProductOptionsTextField
    [Arguments]    ${Field_title}    ${Value}
    scroll element into view    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//input
    input text    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//input    ${Value}

SelectProductOptionsNumberField
    [Arguments]    ${Field_title}    ${Value}
    scroll element into view    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//input
    input text    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//input    ${Value}

SelectProductOptionsDDLField
    [Arguments]    ${Field_title}    ${Value}
    scroll element into view    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div//select[@class='form-control']    #dropdownlist
    click element    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div//select[@class='form-control']    #dropdownlist
    #selecting from the DDL
    select from list by value    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//select    ${Value}

SelectProductOptionsMutliChoicesField
    [Arguments]    ${Field_title}    ${Value}
    scroll element into view    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div
    wait until keyword succeeds    10s    1s    click element    //span[contains(text(),'${Value}')]//ancestor::label    #MultiChoices

SelectProductOptionsDateField
    [Arguments]    ${Field_title}    ${Day}    ${Month}    ${Year}
    scroll element into view    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div
    click element    //div[@class="vdpComponent vdpWithInput"]//input
    wait until page contains element    //div[@class="vdpInnerWrap"]
    click element    //div[@class="vdpInnerWrap"]//table//tr//td//div[text()='${Day}']
    ${Month} =    evaluate    ${Month}-${One}
    wait until keyword succeeds    7s    1s    select from list by value    (//div[@class='vdpPeriodControls']//select)[1]    ${Month}
    click element    //div[@class="vdpComponent vdpWithInput"]//input
    wait until keyword succeeds    7s    1s    select from list by value    (//div[@class='vdpPeriodControls']//select)[2]    ${Year}

SelectProductOptionsTimeField
    [Arguments]    ${Field_title}    ${Hour}    ${Minute}    ${apms}
    scroll element into view    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div
    click element    //span[@class='vue__time-picker time-picker']//input
    click element    //ul[@class="hours"]//li[@data-key=${Hour}]
    click element    //ul[@class="minutes"]//li[@data-key=${Minute}]
    click element    //ul[@class="apms"]//li[@data-key='${apms}']

SelectProductOptionFileField
    [Arguments]    ${Field_title}    ${TestFile}
    scroll element into view    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div//input[@class="filepond--browser"]
    Choose File	//div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div//input[@class="filepond--browser"]    ${TestFile}
    wait until page contains element    //div[@class="text-left col"]//label[contains(text(),'${Field_title}')]//following-sibling::div//div[@class="filepond--list-scroller"]//fieldset/legend

VerifyOptions
    [Arguments]    ${Field_title}    ${Value}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Field_title}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Value}
    ### For DDL field price.
    ${present} =    Run Keyword And Return Status    Page Should Contain Element    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//option//span[contains(text(),'ر.س')]
    ${Price} =    Run Keyword If    ${present}    get text    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//following-sibling::div//option//span[contains(text(),'ر.س')]
    ${Price} =    Run Keyword If    ${present}    remove string    ${Price}    +    (    )    ${space}
    ${Price} =    Run Keyword If    ${present}    remove string    ${Price}    ر.س
    ${Price} =    Run Keyword If    ${present}    set variable    ${space}${Price}${space}SAR
    Run Keyword If    ${present}    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${price}
    ### For text and number fields price.
    ${TextPriceStatus} =    Run Keyword And Return Status    Page Should Contain Element    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//span[contains(text(),'ر.س')]
    ${Price} =    Run Keyword If    ${TextPriceStatus}    get text    //div[@class="custom-fields-container"]//label[contains(text(),'${Field_title}')]//span
    ${Price} =    Run Keyword If    ${TextPriceStatus}    remove string    ${Price}    +    (    )    ${space}
    ${Price} =    Run Keyword If    ${TextPriceStatus}    remove string    ${Price}    ر.س
    ${Price} =    Run Keyword If    ${TextPriceStatus}    set variable    ${space}${Price}${space}SAR
    Run Keyword If    ${TextPriceStatus}    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${price}
    ### For multi choices field price.
    ${MultiPriceStatus} =    Run Keyword And Return Status    Page Should Contain Element    //span[contains(text(),'W')]//following-sibling::span//span
    ${Price} =    Run Keyword If    ${MultiPriceStatus}    get text    //span[contains(text(),'W')]//following-sibling::span//span
    ${Price} =    Run Keyword If    ${MultiPriceStatus}    remove string    ${Price}    +    (    )    ${space}
    ${Price} =    Run Keyword If    ${MultiPriceStatus}    remove string    ${Price}    ر.س
    ${Price} =    Run Keyword If    ${MultiPriceStatus}    set variable    ${space}${Price}${space}SAR
    Run Keyword If    ${MultiPriceStatus}    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${price}
    ###
VerifyOptionDateField
    [Arguments]    ${Field_title}    ${Day}    ${Month}    ${Year}
    ${Day} =	Set Variable If	9 > ${Day}	0${Day}    ${Day}
    ${Month} =	Set Variable If	9 > ${Month}	0${Month}    ${Month}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Field_title}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Year}-${Month}-${Day}

VerifyOptionTimeField
    [Arguments]    ${Field_title}    ${apms}    ${Hour}    ${Minute}
    ${Hour} =	Set Variable If	9 > ${Hour}    0${Hour}    ${Hour}
    ${Minute} =	Set Variable If	9 > ${Minute}	0${Minute}    ${Minute}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Field_title}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Hour}:${Minute} ${apms}

VerifyOptionFileField
    [Arguments]    ${Field_title}
    element should contain    //div[@class="shopping-cart-items"]//h3//a    ${Field_title}

#############################################################################################################################################
VerifyProductWithVariationsWhileThereAreOptions
    [Arguments]    @{List}
    ${ProductName} =    get text    ${ProductPageName}
    ${SelectedVariations} =    wait until keyword succeeds    5s    1s    get text    //div[@class="shopping-cart-items"]//h3//a[contains(text(),'${ProductName}')]
    ${SelectedVariationsOO} =        get text    //div[@class="shopping-cart-items"]//h3//a[contains(text(),'${ProductName}')]/div
    ${PrePreSplit} =        remove string    ${SelectedVariations}    ${SelectedVariationsOO}
    ${PreSplit} =        remove string    ${PrePreSplit}    \n
    @{SplittedVariations} =    split string   ${PreSplit}    -
    #should be equal as strings    ${list}    ${SplittedVariations}
    lists should be equal    ${list}    ${SplittedVariations}
###########################################################################################################################################
OpenPopupCart
    wait until page contains element    ${cartcount}
    wait until keyword succeeds    5s    1s    click element    ${CartIconP}
    wait until page contains    إتمام عملية الشراء