*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################
${PRODUCT_NAME}=    TestProduct_15Kg_30SAR
${PRICE}=    30
${WEIGHT}=    15
${STOCK}=    5
${Edited_PRODUCT_NAME}=    Edited_TestProduct_15Kg_30SAR
${Edited_PRICE}=    20
${Edited_WEIGHT}=    50
${Edited_STOCK}=    10
######################## LOCATORS ##########################
${ProductName_FIELD} =    input-name-ar
${Price_FIELD} =    price
${Weight_FIELD} =    add-form-weight
${Stock_FIELD} =    add-form-stock
${InfiniteStock_ChkBtn} =    xpath=//label[@class="container-checkmark"]
${PublishProduct_TOGGLE} =    xpath=//div[@class="productpublishingoptions"]//label[@class="switch"]
${Discount_TOGGLE} =    xpath=//div[@class="productprice__section col-sm-6"]//label[@class="container-checkmark"]
${SaveProduct_BTN} =    xpath=//div[@class="pageheader__additionalcontent"]//button[contains(text(),'حفظ')]
${DeleteProduct_BTN} =    xpath=//div[@class="pageheader__additionalcontent"]//button[contains(text(),'حذف المنتج')]
${ShowInCatalog_BTN} =    xpath=//div[@class="pageheader__additionalcontent"]//button[contains(text(),'عرض')]
${SaveProduct_ButtomPage_BTN} =    xpath=//button[./span = 'حفظ']
${NavPath_AllProducts_BTN} =    xpath=//div[@class="pageheader__maincontent"]//a[contains(text(),'المنتجات')]
${Saving_SuccessMSG}=  xpath=//div[@id='toast-container']//div[contains(text(),تم حفظ المنتج بنجاح)]
*** Keywords ***

####################### ACTIONS ##########################
Enter ProductName
    [Arguments]    ${PRODUCT_NAME}
    wait until element is visible    ${ProductName_FIELD}
    input text    ${ProductName_FIELD}    ${PRODUCT_NAME}

Enter ProductPrice
    [Arguments]    ${PRICE}
    wait until element is visible    ${Price_FIELD}
    input text    ${Price_FIELD}    ${PRICE}

Enter ProductWeight
    [Arguments]    ${WEIGHT}
    wait until element is visible    ${Weight_FIELD}
    input text    ${Weight_FIELD}    ${WEIGHT}

Enter ProductStock
    [Arguments]    ${STOCK}
    wait until element is visible    ${Stock_FIELD}
    input text    ${Stock_FIELD}    ${STOCK}

Toggle Infinite Stock
    wait until element is visible    ${InfiniteStock_ChkBtn}
    click element    ${InfiniteStock_ChkBtn}

Toggle Publish Product
    wait until element is visible    ${PublishProduct_TOGGLE}
    click element    ${PublishProduct_TOGGLE}

Save Product
    wait until element is visible    ${SaveProduct_BTN}
    click element    ${SaveProduct_BTN}

Navigate To AllProducts
    wait until element is visible    ${NavPath_AllProducts_BTN}
    click element    ${NavPath_AllProducts_BTN}
Validate Successful Save
    wait until element is enabled    ${Saving_SuccessMSG}

########################## SCENARIOS #########################
Enter Product Details
    Enter ProductName    ${PRODUCT_NAME}
    Enter ProductPrice    ${PRICE}
    Enter ProductWeight    ${WEIGHT}
    Toggle Infinite Stock
    Toggle Publish Product

Edit Product
    Enter ProductName    ${Edited_PRODUCT_NAME}
    Enter ProductPrice    ${Edited_PRICE}
    Enter ProductWeight    ${Edited_WEIGHT}
    Toggle Infinite Stock
    Enter ProductStock    ${Edited_STOCK}



