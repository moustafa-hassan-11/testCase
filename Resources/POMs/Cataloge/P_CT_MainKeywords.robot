*** Settings ***
Library    SeleniumLibrary
Resource  P_CT_LoginPage.robot
Resource  P_CT_HomePage.robot
Resource  P_CT_CartPage.robot
Resource  P_CT_ShippingPage.robot
Resource  P_CT_PaymentPage.robot
Resource  P_CT_ProductPage.robot

*** Variables ***
#ZidpayCheckoutVisaVarabiles(MyFatoorah)
${IMG_LOGO_MADA}    xpath=(.//img[@src='/imgs/mpgs/md.png'])[1]
${IMG_LOGO_VISA}    (.//img[@src='/imgs/mpgs/visa.png'])[1]
${SubmitButton}    xpath=.//input[@id='btn-submit']
${NameOnCard}    xpath=.//label[@for='nameOnCard']/following-sibling::input[@id='nameOnCard']
${NameOnCardValue}    Hussein Mohamed
${Expiry_Month}     xpath=.//label[@for='expiryMonth']/following-sibling::input[@id='expiryMonth']
${ExpiryMonthValue}    12
${Expiry_Year}     xpath=.//label[@for='expiryYear']/following-sibling::input[@id='expiryYear']
${ExpiryYearValue}    25
${CardNumber}    xpath=.//label[@for='number']/following-sibling::input[@id='number']
${CardNumberValue}    4111111111111111
${SecurityCode}    xpath=.//label[@for='securityCode']/following-sibling::input[@id='securityCode']
${SecurityCodeValue}    111
${ACSEmulatorSubmit_btn}    xpath=.//input[@type='submit']
${OrderNumber}
${CT_AddressandShipping}        //div[.="العنوان و التوصيل"]
${CT_CheckCartPageText}    //div[@class="div-router-view page-container products-container cart-view z-cart-view"]//h1

*** Keywords ***

DefaultPurchaseProductWithEmail
    [Arguments]     ${CT_ProductName}    ${MainKeyword_Email}    ${MainKeyword_URL}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_ProductName}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.CompletePurchase
    wait until page contains    تسجيل الدخول
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    ${MainKeyword_Email}
    P_CT_LoginPage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin
    ${url}=   Get Location
    ${str1} =   Catenate    ${MainKeyword_URL}cart/view
    run keyword if    '${url}' != '${str1}'    GoToCartPage
    #https://1s5ehu.zidtest.com
    wait until page contains    سلة المشتريات
    P_CT_CartPage.completepurchase
    #sleep    2s
    Wait Until Page Contains Element    ${CT_AddressandShipping}

DefaultPurchaseProductWithPhone
    [Arguments]     ${CT_ProductName}
    P_CT_HomePage.AddToCartByProductName_2    ${CT_ProductName}
    P_CT_HomePage.VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.CompletePurchase
    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    500000005
    P_CT_LoginPage.VerifyMobileRecaptcha
    P_CT_LoginPage.ClickContinueButtonPhone
    P_CT_loginpage.SetVerificationCodePhone
    P_CT_HomePage.VerifySuccessfulLogin
    wait until page contains    سلة المشتريات    10s
    P_CT_CartPage.completepurchase
    #sleep    2s
    Wait Until Page Contains Element        ${CT_AddressandShipping}


DefaultSelectShipping
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    'فرونت بوينت'
    P_CT_ShippingPage.confirmshipping


Complete Checkout
    [Arguments]    ${Coupon_Name}
#    P_CT_HomePage.SaudiArabiaCurrency
    P_CT_HomePage.GoToProductPage    منتج
    P_CT_ProductPage.ProductQuantity    3
    P_CT_ProductPage.AddProductToCart
    VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.AddCoupon    ${Coupon_Name}
    P_CT_CartPage.SetCoupon
    P_CT_CartPage.Verify_ValidCoupon
    P_CT_CartPage.CompletePurchase
#    wait until page contains    تسجيل الدخول
#    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    500000005
    P_CT_LoginPage.ClickContinueButtonPhone
    P_CT_loginpage.SetVerificationCodePhone
    #P_CT_CartPage.completepurchase
    P_CT_ShippingPage.selectaddress    الرياض
    sleep    2s
    P_CT_ShippingPage.selectshipping    'سمسا'
    P_CT_ShippingPage.confirmshipping
    P_CT_PaymentPage.selectpayment    تحويل بنكي
    P_CT_PaymentPage.confirmpayment
    P_CT_PaymentPage.Verify_Successfully_CheckOut
    ${OrderNumber} =    P_CT_PaymentPage.GetOrderNumber
    P_CT_PaymentPage.BacKToHome
    return from keyword    ${OrderNumber}

PayThroughZidpay[Mada]
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_HomePage.AddToCartByProductName_2    Alpha Romio Guilia
    VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.CompletePurchase
    wait until page contains    تسجيل الدخول
    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    500000005
    P_CT_LoginPage.ClickContinueButtonPhone
    P_CT_loginpage.SetVerificationCodePhone
    #P_CT_CartPage.completepurchase
    sleep    5s
    P_CT_ShippingPage.selectaddress    الرياض
    sleep    2s
    P_CT_ShippingPage.selectshipping    'سمسا'
    P_CT_ShippingPage.confirmshipping
    P_CT_PaymentPage.selectpayment    بطاقة مدى البنكية [zidpay]
    P_CT_PaymentPage.confirmpayment
    wait until page contains element    ${img_logo_mada}
    wait until page contains element    ${submitbutton}
    page should contain image   ${img_logo_mada}
    select frame    tag:iframe
    wait until page contains element    ${NameOnCard}
    INPUT TEXT    ${NameOnCard}    ${NameOnCardValue}
    unselect frame
    wait until page contains element    //*[@id="formfildes"]/div[2]/div/iframe
    select frame    //*[@id="formfildes"]/div[2]/div/iframe
    INPUT TEXT    ${CardNumber}    ${cardnumbervalue}
    unselect frame
    wait until page contains element    xpath=//*[@id="formfildes"]/div[3]/div[1]/div/iframe
    select frame    xpath=.//*[@id="formfildes"]/div[3]/div[1]/div/iframe
    INPUT TEXT    ${expiry_month}    ${expirymonthvalue}
    unselect frame
    wait until page contains element    //*[@id="formfildes"]/div[3]/div[2]/div/iframe
    select frame    //*[@id="formfildes"]/div[3]/div[2]/div/iframe
    INPUT TEXT    ${expiry_year}    ${expiryyearvalue}
    unselect frame
    wait until page contains element    //*[@id="formfildes"]/div[4]/div/iframe
    select frame    //*[@id="formfildes"]/div[4]/div/iframe
    input text    ${securitycode}    ${SecurityCodeValue}
    unselect frame
    click element    ${submitbutton}
    wait until page contains element    ${ACSEmulatorSubmit_btn}    10
    click element    ${ACSEmulatorSubmit_btn}
    P_CT_PaymentPage.Verify_Successfully_CheckOut
    #P_CT_PaymentPage.OrderDetails
    P_CT_PaymentPage.BacKToHome
PayThroughZidpay[Visa]
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_HomePage.AddToCartByProductName_2    Alpha Romio Guilia
    VerifyProductAddedToCart    1
    P_CT_HomePage.ProccedToCartPage
    P_CT_CartPage.CompletePurchase
    wait until page contains    تسجيل الدخول
    P_CT_LoginPage.ClickLoginWithPhone
    P_CT_loginpage.selectphonenumkey    +966
    P_CT_LoginPage.SetPhoneNum    500000005
    P_CT_LoginPage.ClickContinueButtonPhone
    P_CT_loginpage.SetVerificationCodePhone
    #P_CT_CartPage.completepurchase
    sleep    5s
    P_CT_ShippingPage.selectaddress    الرياض
    sleep    2s
    P_CT_ShippingPage.selectshipping    'سمسا'
    P_CT_ShippingPage.confirmshipping
    P_CT_PaymentPage.selectpayment    بطاقة إئتمانية [zidpay]
    P_CT_PaymentPage.confirmpayment
    wait until page contains element    ${submitbutton}
    select frame    tag:iframe
    wait until page contains element    ${NameOnCard}
    INPUT TEXT    ${NameOnCard}    ${NameOnCardValue}
    unselect frame
    wait until page contains element    //*[@id="formfildes"]/div[2]/div/iframe
    select frame    //*[@id="formfildes"]/div[2]/div/iframe
    INPUT TEXT    ${CardNumber}    ${cardnumbervalue}
    unselect frame
    wait until page contains element    xpath=//*[@id="formfildes"]/div[3]/div[1]/div/iframe
    select frame    xpath=.//*[@id="formfildes"]/div[3]/div[1]/div/iframe
    INPUT TEXT    ${expiry_month}    ${expirymonthvalue}
    unselect frame
    wait until page contains element    //*[@id="formfildes"]/div[3]/div[2]/div/iframe
    select frame    //*[@id="formfildes"]/div[3]/div[2]/div/iframe
    INPUT TEXT    ${expiry_year}    ${expiryyearvalue}
    unselect frame
    wait until page contains element    //*[@id="formfildes"]/div[4]/div/iframe
    select frame    //*[@id="formfildes"]/div[4]/div/iframe
    input text    ${securitycode}    ${SecurityCodeValue}
    unselect frame
    click element    ${submitbutton}
    wait until page contains element    ${ACSEmulatorSubmit_btn}    10
    click element    ${ACSEmulatorSubmit_btn}
    P_CT_PaymentPage.Verify_Successfully_CheckOut
    #P_CT_PaymentPage.OrderDetails
    P_CT_PaymentPage.BacKToHome
