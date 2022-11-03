*** Settings ***
Documentation    This is Managing Cart Test Suite

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_CartPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_MainKeywords.robot

Test Setup       Start WebTest  None
Test Teardown    End WebTest

*** Variables ***
${CT_Testing_URL} =     https://1s5ehu.zidtest.com/

${CT_CHECKOUT_SIGNIN_BTN}    //button[@class="d-block primary round submit btn block text-left"]
${Countries_ddb}    //a[@id='header-shipping-country-flag-dropdown-toggle']
${SaudiArabia}     //input[@value='SA']
${SaveCountry}    //button[@id="header-save-shipping-country"]
${CT_SimpleProd02}      TA Simple Pro02
${CT_ValidCoupon}       tnhhfbyr0
${CT_InValidCoupon}       tnhhfbyr2
${CT_SimpleProd}     TASimple Product 01
${CT_DiscountValue}      حزمة تسويقية بقيمة 20%
${CT_ProdBundleO}     TASimpleProd01 Bunddle
${CT_ProdBundle1}     TASimpleProd02 Bunddle

*** Test Cases ***
########################################################CartPage####################################################################
UpdateTheProductQuantity
    [Documentation]    Edit The Quantity Of Product
    [Tags]    Cart    Edit_Quantity
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd02}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.increasequantity    ${CT_SimpleProd02}
    IncreaseButtonLoadingFinish
    P_CT_CartPage.decreasequantity    ${CT_SimpleProd02}
    DecreaseButtonLoadingFinish

DeleteAProductFromCartPage
    [Documentation]   Delete Product From Cart Page
    [Tags]    Cart    Delete_Product
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd02}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart      ${CT_SimpleProd02}
    P_CT_CartPage.DeleteProduct      ${CT_SimpleProd02}

AddValidCoupon
    [Documentation]    Add Valid Coupon
    [Tags]    Cart    Valid_Coupon
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd02}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.addcoupon     ${CT_ValidCoupon}
    P_CT_CartPage.setcoupon
    P_CT_CartPage.Verify_ValidCoupon

AddInvalidCoupon
    [Documentation]    Add Invalid Coupon
    [Tags]    Cart    Invalid_Coupon
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd02}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.addcoupon    ${CT_InValidCoupon}
    P_CT_CartPage.setcoupon
    P_CT_CartPage.Verify_InvalidCoupon

GetBundleOffer
    [Documentation]    Add Simple Product With Bundle Offer
    [Tags]    Cart    GetBundleOffer
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_ProdBundle1}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    page should contain    عند شرائك لهذا المنتج ستحصل على


ContinueShoppingAfterAddProductsToCart
    [Documentation]    Continue Shopping
    [Tags]    Cart    Continue_Shopping
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd02}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart      ${CT_SimpleProd02}
    P_CT_CartPage.ContinueShopping
    P_CT_HomePage.CheckProductExistInPage       ${CT_SimpleProd02}

CompletePurchase
    [Documentation]    Complete the purchase
    [Tags]    Cart    Complete_Purchase
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_MainKeywords.DefaultPurchaseProductWithPhone       ${CT_SimpleProd02}

UserCan'tCompleteTheCheckoutWithoutSigningIn
    [Documentation]    User can't complete the checkout without signing in
    [Tags]    Cart    CheckOutWithSignIn
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2      ${CT_SimpleProd02}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.CompletePurchase
    wait until element is visible     ${CT_CHECKOUT_SIGNIN_BTN}


#Increase the quantity more than the available quantity
