*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CT_CHECKOUT_COUPON_FIELD}    name=couponCode
${CT_CHECKOUT_SETCOUPON_BTN}    id=cart-view-redeem-coupon
${CT_CHECKOUT_SHOPPING_COINUE_BTN}    id=cart-view-back-to-shopping
${CT_CHECKOUT_PURCHASE_COMPLETE_BTN}    id=cart-view-go-to-checkout
${CT_IncreaseButtonLoadingIcon}    //a[@id="cart-view-product-quantity-increase-113078"]/img
${CT_DecreaseButtonLoadingIcon}    //a[@id="cart-view-product-quantity-decrease-113079"]/img

*** Keywords ***
DeleteProduct
    [Arguments]     ${ct_checkout_product}
    click button    //a[contains(text(),'${ct_checkout_product}')]//ancestor::span//preceding-sibling::span/button
    sleep    4s

IncreaseQuantity
    [Arguments]     ${ct_checkout_product}
    click link    //a[contains(text(),'${ct_checkout_product}')]//ancestor::span//following-sibling::span//a[2]
    Wait Until Element Is Not Visible    //a[@id="cart-view-product-quantity-increase-111340"]//img[@data-v-1ad3bd2a=""]
    sleep    2s

DecreaseQuantity
    [Arguments]     ${ct_checkout_product}
    Sleep    1s
    click link    //a[contains(text(),'${ct_checkout_product}')]//ancestor::span//following-sibling::span//a[1]
    Wait Until Element Is Not Visible    //a[@id="cart-view-product-quantity-increase-111340"]//img[@data-v-1ad3bd2a=""]
    sleep    2s

AddCoupon
    [Arguments]     ${ct_checkout_coupon}
    wait until element is visible   ${CT_CHECKOUT_COUPON_FIELD}
    input text    ${CT_CHECKOUT_COUPON_FIELD}    ${ct_checkout_coupon}

SetCoupon
    click button    ${CT_CHECKOUT_SETCOUPON_BTN}

Verify_ValidCoupon
    Wait Until Keyword Succeeds     10s     1s    Wait Until Page Contains Element    //div[@class="alert alert-success"]

Verify_InvalidCoupon
    Wait Until Page Contains Element    //div[@class="alert alert-danger"]

ContinueShopping
    wait until page contains    سلة المشتريات
    click element    ${CT_CHECKOUT_SHOPPING_COINUE_BTN}

CompletePurchase
    wait until page contains    سلة المشتريات
    click element    ${CT_CHECKOUT_PURCHASE_COMPLETE_BTN}

ProductAddedToCart
    [Arguments]     ${ct_checkout_product}
    Wait Until Page Contains Element    //a[contains(text(),'${ct_checkout_product}')]//ancestor::span//preceding-sibling::span/button

ProductWithDiscountInCart
    [Arguments]     ${ct_checkout_product}
    Wait Until Page Contains Element    //a[contains(text(),'${ct_checkout_product}')]//parent::h1//parent::div//parent::span//following-sibling::span[@class="item-price text-color-primary"]//div//span[@class="old d-block"]

IncreaseButtonLoadingFinish
    wait until element is not visible    ${CT_IncreaseButtonLoadingIcon}

DecreaseButtonLoadingFinish
    wait until element is not visible    ${CT_DecreaseButtonLoadingIcon}
    




