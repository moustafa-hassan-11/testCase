*** Setting ***
Documentation     This is Add To Cart Test Suite
Resource  ../../Resources/Common.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_LoginPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_CartPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_ProductPage.robot

Test Setup       Start WebTest    None
Test Teardown    End WebTest

*** Variables ***
${CT_Testing_URL} =     https://1s5ehu.zidtest.com/

${CT_SimpleProd}     TASimple Product 01
${CT_SimpleProdDisc}      TASimple Product Discount
${CT_ProductWithDisc-Var-Custom}         TA Var&Custom Discount
${CT_ProductWithVariation}      TA Variation
${CT_ProductWithCustom}     TA Custom
${CT_ProdBundleO}     TASimpleProd01 Bunddle
${CT_ProdVarCustom}     TA Product Var&Custom
${CT_DiscountValue}      حزمة تسويقية بقيمة 20%

*** Test Cases ***
AddSimpleProductToCartFromHomePage
    [Documentation]    Add Simple Product From HomePage
    [Tags]    AddToCart    AddSimpleProHome
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart      ${CT_SimpleProd}

AddProductFromCategoriesPage
    [Documentation]     Add Simple Product From Categories Page
    [Tags]    AddToCart    AddSimpleProCategories
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.CliclOnCategory       Test2
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProd}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart      ${CT_SimpleProd}

AddSimpleProductToCartFromProductDetailsPage
    [Documentation]    Add Simple Product From Details Page
    [Tags]    AddToCart    AddSimpleProDetails
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage        ${CT_SimpleProd}
    P_CT_ProductPage.AddProductToCart
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart      ${CT_SimpleProd}

AddSimpleProductWithDiscountFromHomePage
    [Documentation]    Add Simple Product with Discount From HomePage
    [Tags]    AddToCart    AddProDiscHome
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.CheckDiscountOnProduct        ${CT_SimpleProdDisc}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_SimpleProdDisc}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductWithDiscountInCart     ${CT_SimpleProdDisc}

AddaProductWithVariations
    [Documentation]    Add To Cart Product With Variations
    [Tags]    AddToCart    ProductWithVariation
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage    ${CT_ProductWithVariation}
    @{list}=    P_CT_ProductPage.SelectProductVariation    2
    P_CT_ProductPage.AddProductToCart
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart        ${CT_ProductWithVariation}

AddaProductwithCustomOptionsToTheCart
    [Documentation]    Add To Cart Product With Custom Options
    [Tags]    AddToCart    ProductWithCustom
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage       ${CT_ProductWithCustom}
    P_CT_ProductPage.SelectProductOptionsDDLField       Test      TA
    P_CT_ProductPage.SelectProductOptionsTextField      Test      Test Automation Field
    P_CT_ProductPage.AddProductToCart
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart        ${CT_ProductWithCustom}

AddaProductwithVariationandCustomOptions
    [Documentation]    Add To Cart Product with Variations and Custom Options
    [Tags]    Cart    AddProdWithVarandCustom
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage        ${CT_ProdVarCustom}
    @{list}=    P_CT_ProductPage.SelectProductVariation    2
    P_CT_ProductPage.SelectProductOptionsDDLField       Custom      Test
    P_CT_ProductPage.AddProductToCart
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductAddedToCart        ${CT_ProdVarCustom}


AddSimpleProductwithBundleOffer[Discount]
    [Documentation]    Add Simple Product With Bundle Offer [Discount]
    [Tags]    Cart    BundleOfferWithDiscount
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage        ${CT_SimpleProd}
    P_CT_ProductPage.AddProductToCart
    P_CT_ProductPage.ProductWithBundleOffer
    P_CT_ProductPage.VerifyBundleOfferDiscount      ${CT_DiscountValue}

AddProductWithDiscountToCartWithBundleoffer[Free product]
    [Documentation]    Add Product With Discount and Bundle Offer [Free Product]
    [Tags]    Cart    AddFreeProduct_BundleOffer
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage        ${CT_ProdBundleO}
    P_CT_ProductPage.AddProductToCart
    P_CT_ProductPage.ProductWithBundleOffer
    P_CT_ProductPage.VerifyBundleOffer

AddProductToCartWithDiscount,VariationsAndCustomOptions
    [Documentation]    Add Product With Discount, Variation and Custom Options
    [Tags]    Cart    ProdWithDisc_Var_Custom
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.CheckDiscountOnProduct        ${CT_ProductWithDisc-Var-Custom}
    P_CT_HomePage.GoToProductPage    ${CT_ProductWithDisc-Var-Custom}
    @{list}=    P_CT_ProductPage.SelectProductVariation    2
    P_CT_ProductPage.SelectProductOptionsDDLField       Test        Additional
    P_CT_ProductPage.AddProductToCart
    P_CT_HomePage.ClickOnCartIcon
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.ProductWithDiscountInCart        ${CT_ProductWithDisc-Var-Custom}

AddProductWithVariation,CustomOption,DiscountAndBundleOffer[Free Product]
    [Documentation]    Add Product With Discount, Variation and Custom Options Bundle Offer [Free Product]
    [Tags]    Cart    ProdWithDisc_Var_CustomBundleOff
    P_CT_HomePage.GoToCatalog    ${CT_Testing_URL}
    P_CT_HomePage.GoToProductPage        ${CT_ProductWithDisc-Var-Custom}
    @{list}=    P_CT_ProductPage.SelectProductVariation    2
    P_CT_ProductPage.SelectProductOptionsDDLField       Test      Additional
    P_CT_ProductPage.AddProductToCart
    P_CT_ProductPage.ProductWithBundleOffer
    P_CT_ProductPage.VerifyBundleOffer
