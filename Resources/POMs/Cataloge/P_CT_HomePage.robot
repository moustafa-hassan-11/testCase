*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AddToCart_btn}  //div//button[@id="product-view-add-to-cart"]
${CartIcon}    //a[@id="z-header-shopping-cart"]
${GoToCheckout}  //a[@id="header-go-to-checkout"]
${ReturnedInfo}
${CartCount}  xpath=//a[@id="z-header-shopping-cart"]//span[@class="zid-shopping-basket-count"]
${login}    id=header-customer-login
${MyAccount}    id=header-customer-name
${AllProducts}    //li[@class="item-all-products"]
${PaymentAndShippingPage}    //div[@class="col-shipping-and-payment"]
${AllCategories}  //a[@class="item-all-categories"]
${Countries_ddb}    //a[@id='header-shipping-country-flag-dropdown-toggle']
${SaudiArabia}    //input[@value='SA']
${PriceSaudi}    //*[@class="price"][contains(text(),'ر.س')]
${Egypt}    //input[@value='EG']
${PriceEgypt}    //*[@class="price"][contains(text(),'م.ج')]
${Kuwait}   //input[@value='KW']
${PriceKuwait}    //*[@class="price"][contains(text(),'ك.د')]
${UAE}  //input[@value='AE']
${PriceUAE}    //*[@class="price"][contains(text(),'إ.د')]
${SaveCurrency}  //button[@id="header-save-shipping-country"]
${CartPage}  //div[@class='col text-left d-none d-lg-inline-block section-results-count']//div//span
${i}    #Counter
@{Values} =    1    2    3    4    5    6
${Language} =    //a[@id="header-store-language store-language"]
${LanguageArabic} =    //*[@id="header-store-language store-language"][contains(text(),'عربي')]
${LanguageEnglish} =    //a[@id="header-store-language store-language"][contains(text(),'English')]
${HomeSearchbar}=   css=input[id='search']
${HomeSearchIcon}  css=[class="search-icon-float icon-search search-icon"]
${SKU}=    Z.21342.16610820240714948
${Productlink}    //div[@class="zid-item product"]/div/a
${ProductSKU}    //div[@class="product-sku"]/span[contains(text(),'${SKU}')]
${FirstCategoryLink}    (//div//div//div[@class="item-category"]//a)[2]


#${Catalog_URL} =    https://qdqqpv.zidtest.com/
#${CT_STAGING_URL} =     https://staging-catalog.zid.sa/staging-automation/
#${CT_STAGING_URL} =    https://qdqqpv.zidtest.com/
#${Catalog_URL} =    https://staging-catalog.zid.sa/zidship1-staging/

*** Keywords ***
#CLickLoginHome
#    click element    ${login}

GoToCatalog
    [Arguments]    ${Catalog_URL}
    go to    ${Catalog_URL}

AddToCart
    click element    ${AddToCart_btn}

VerifyProductAddedToCart
    [Arguments]    ${ExpectedNumberOfProducts}
    wait until element is not visible    //button[@class="btn btn-primary zid-add-to-cart-btn btn-sm product-card-add-to-cart"]//img
    wait until element contains    ${CartCount}    ${ExpectedNumberOfProducts}
    ${ReturnedInfo}=    get text    ${CartCount}
    log    ${ReturnedInfo}
    click element    ${CartIcon}
    should be equal as integers    ${ReturnedInfo}    ${ExpectedNumberOfProducts}

AddToCartByProductName
    [Arguments]    ${ProductName}
    FOR    ${i}  IN    @{Values}
        #Product name locator.
        ${SearchProductName}=  get text     //div[${i}]//div//div[2]//div[@class='product-content']//a//h2
        #log    ${ProductName}
        #Product "add to cart" button locator.
        run keyword if    '${SearchProductName}' == '${ProductName}'    click element    //div[${i}]//div//div[2]/p/button
        exit for loop if    '${SearchProductName}' == '${ProductName}'
    END

AddToCartByProductName_2
    [Arguments]    ${ProductName}
    wait until page contains     ${ProductName}
    click element    //h2[contains(text(),'${ProductName}')]//ancestor::div[@class="zid-item product"]//button

ClickHeaderLogin
    click link    ${login}
    wait until page contains    البريد الإلكتروني

ClickMyAccount
    click link    ${MyAccount}
    wait until page contains    البريد الإلكتروني

VerifySuccessfulLogin
    wait until page contains    جميع المنتجات

AllProductsPage
    click element    ${allproducts}
    wait until page contains    تم ايجاد

PaymentAndShippingPage
    click link    ${PaymentAndShippingPage}
    wait until page contains    خيارات الشحن

AllCategoriesPage
    click link    ${AllCategories}
    wait until page contains    جميع التصنيفات
    sleep    2s

SelectFirstCategoryFromCategoriesPage
    click link    ${FirstCategoryLink}
    sleep    2s

ProccedToCartPage
    wait until element is visible    ${GoToCheckout}
    click element    ${GoToCheckout}
    wait until keyword succeeds      10s     1s      wait until page contains    سلة المشتريات

CurrencyEgypt
    click element    ${Countries_ddb}
    wait until page contains    الشحن الى
    click element    ${Egypt}
    click button    ${SaveCurrency}
    page should contain    ج.م

CurrencySaudiArabia
    click element    ${Countries_ddb}
    wait until page contains    الشحن الى
    click element    ${SaudiArabia}
    click button    ${SaveCurrency}
    page should contain    ر.س

GoToProductPageForProductsWithVariationInFireFox
    [Arguments]    ${ProductName}
    Click Link    //h2[contains(text(),'${ProductName}')]//ancestor::div[@class="zid-item product"]//p//a

CurrencyKuwait
    click element    ${Countries_ddb}
    wait until page contains    الشحن الى
    click element    ${Kuwait}
    click button    ${SaveCurrency}
    page should contain    د.ك

CurrencyUAE
    click element    ${Countries_ddb}
    wait until page contains    الشحن الى
    click element    ${UAE}
    click button    ${SaveCurrency}
    page should contain    دإ

GoToProductPage
    [Arguments]    ${ProductName}
    Wait Until Page Contains Element    //h2[contains(text(),'${ProductName}')]//ancestor::div[@class="zid-item product"]//div//a
    Click Link    //h2[contains(text(),'${ProductName}')]//ancestor::div[@class="zid-item product"]//div//a
    wait until page contains    رمز المنتج

CheckDiscountOnProduct
    [Arguments]    ${ProductName}
    Wait Until Page Contains Element        //h2//span[@class="sale"]//parent::h2//parent::div//preceding-sibling::a[@title="${ProductName}"]

CheckProductExistInPage
    [Arguments]    ${ProductName}
    Wait Until Page Contains Element    xpath=.//h2[contains(text(),'${ProductName}')]//ancestor::div[@class="zid-item product"]//button

GoHomePage
    Click Element       //a[@id="header-store-logo"]
    
CliclOnCategory
    [Arguments]     ${CT_CategoryName}
    Click Element    //a[contains(text(),"${CT_CategoryName}")]

ClickOnCartIcon
        Click Element    ${CartIcon}


ChangeLanguageToEnglish
    ${IsElementVisible_Arabic}=  Run Keyword And Return Status    Element Should Be Visible   ${LanguageEnglish}
    Run Keyword If    "${IsElementVisible_Arabic}" == "True"    click element  ${Language}
    Run Keyword If    "${IsElementVisible_Arabic}" == "True"    wait until page contains    Home    7s

ChangeLanguageToArabic
    ${IsElementVisible_Arabic}=  Run Keyword And Return Status    Element Should Be Visible   ${LanguageArabic}
    Run Keyword If    "${IsElementVisible_Arabic}" == "True"    click element  ${Language}
    Run Keyword If    "${IsElementVisible_Arabic}" == "True"    wait until page contains    الصفحة الرئيسية    7s



SearchBySKU
    [Arguments]    ${SKU}
    click element    ${HomeSearchbar}
    input text    ${HomeSearchbar}  ${SKU}
    click element    ${HomeSearchIcon}
    sleep    2s
    wait until page contains    تم ايجاد
    click element    ${Productlink}
    sleep    2s
    page should contain Element   ${ProductSKU}

GoToCartPage
    click element    ${CartIcon}
    wait until keyword succeeds  100s  1s   wait until page contains element    ${GoToCheckout}
    click element    ${GoToCheckout}
    wait until keyword succeeds  100s  1s   wait until page contains    سلة المشتريات