*** Settings ***
Documentation    This is Check Out test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/Cataloge/P_CT_ShippingPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_PaymentPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_MainKeywords.robot


Test Setup       Start WebTest    none
Test Teardown    End WebTest

*** Variables ***
${CT_CHECKOUT_SIGNIN_BTN}    //button[@class="d-block primary round submit btn block text-left"]
${CT_STAGING_URL}    https://1s5ehu.zidtest.com/
*** Keywords ***


*** Test Cases ***

#Pay with Mada Card
#    [Documentation]   Pay with Mada Card
#    [Tags]    Payment    Mada
#    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#    sleep  5s
#    P_CT_HomePage.SaudiArabiaCurrency
#    sleep  5s
#     P_CT_MainKeywords.DefaultPurchaseProduct
#     P_CT_ShippingPage.selectaddress    الرياض
#     P_CT_ShippingPage.selectshipping    فاستلو
#     P_CT_ShippingPage.confirmshipping
#     sleep    5s
#    P_CT_PaymentPage.selectpayment    بطاقة مدى البنكية
#    sleep  3s
#    P_CT_PaymentPage.confirmpayment
#    verify sucess payment with mada




#Pay with Mada Zid Pay Card
#    [Documentation]   Pay with Mada Zid Pay Card
#    [Tags]    Payment    Mada
#    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#    sleep  5s
##    P_CT_HomePage.SaudiArabiaCurrency
##    sleep  5s
#     P_CT_MainKeywords.DefaultPurchaseProduct
#     P_CT_ShippingPage.selectaddress    الرياض
#     P_CT_ShippingPage.selectshipping    ارامكس
#     P_CT_ShippingPage.confirmshipping
#     sleep    5s
#    P_CT_PaymentPage.selectpayment   بطاقة مدى البنكية [zidpay]
#    P_CT_PaymentPage.confirmpayment
#    sleep  5s




#Pay with Credit Card
#    [Documentation]   Pay with Credit Card
#    [Tags]    Payment    Credit_Card
#    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#         sleep  5s
#     #    P_CT_HomePage.SaudiArabiaCurrency
#     #    sleep  5s
#          P_CT_MainKeywords.DefaultPurchaseProduct
#          P_CT_ShippingPage.selectaddress    الرياض
#          P_CT_ShippingPage.selectshipping    ارامكس
#          P_CT_ShippingPage.confirmshipping
#          sleep    5s
#         P_CT_PaymentPage.selectpayment   بطاقة إئتمانية
#         P_CT_PaymentPage.confirmpayment
#         sleep  5s





#Pay with Credit Card Zid Pay
#    [Documentation]   Pay with Credit Card
#    [Tags]    Payment    Credit_Card
#    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#         sleep  5s
#     #    P_CT_HomePage.SaudiArabiaCurrency
#     #    sleep  5s
#          P_CT_MainKeywords.DefaultPurchaseProduct
#          P_CT_ShippingPage.selectaddress    الرياض
#          P_CT_ShippingPage.selectshipping    ارامكس
#          P_CT_ShippingPage.confirmshipping
#          sleep    5s
#         P_CT_PaymentPage.selectpayment   بطاقة إئتمانية [zidpay]
#         P_CT_PaymentPage.confirmpayment
#         sleep  5s

#Pay with American Express
#    [Documentation]   Pay with American Express
#    [Tags]    Payment    American_Express
#          P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#         sleep  5s
#     #    P_CT_HomePage.SaudiArabiaCurrency
#     #    sleep  5s
#          P_CT_MainKeywords.DefaultPurchaseProduct
#          P_CT_ShippingPage.selectaddress    الرياض
#          P_CT_ShippingPage.selectshipping    ارامكس
#          P_CT_ShippingPage.confirmshipping
#          sleep    5s
#          P_CT_PaymentPage.selectpayment    أمريكان إكسبريس [zidpay]
#          P_CT_PaymentPage.confirmpayment
#          sleep  5s




#Pay with American Express Zid Pay
#    [Documentation]   Pay with American Express
#    [Tags]    Payment    American_Express
#          P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#         sleep  5s
#     #    P_CT_HomePage.SaudiArabiaCurrency
#     #    sleep  5s
#          P_CT_MainKeywords.DefaultPurchaseProduct
#          P_CT_ShippingPage.selectaddress    الرياض
#          P_CT_ShippingPage.selectshipping    ارامكس
#          P_CT_ShippingPage.confirmshipping
#          sleep    5s
#          P_CT_PaymentPage.selectpayment    أمريكان إكسبريس [tap]
#          P_CT_PaymentPage.confirmpayment
#          sleep  5s


Pay with COD
    [Documentation]   Pay with COD
    [Tags]    Payment    Cash
           P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
           P_CT_HomePage.CurrencySaudiArabia
           P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
           P_CT_ShippingPage.selectaddress    الرياض
           P_CT_ShippingPage.selectshipping    Custom Shipping
           P_CT_ShippingPage.confirmshipping
           P_CT_PaymentPage.selectpayment    دفع عند الاستلام
           P_CT_PaymentPage.confirmpayment
           verify successful payment with selected payment option




Bank Transfer
    [Documentation]  Bank Transfer
    [Tags]    Payment    Bank
           P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
           P_CT_HomePage.CurrencySaudiArabia
           P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
           P_CT_ShippingPage.selectaddress    الرياض
           P_CT_ShippingPage.selectshipping    ارامكس
           P_CT_ShippingPage.confirmshipping
           P_CT_PaymentPage.selectpayment  تحويل بنكي
           P_CT_PaymentPage.confirmpayment
           verify successful payment with selected payment option
#



#Write Order Notes
#    [Documentation]   Write Order Notes
#    [Tags]    Payment    Order_Notes
#           P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#           sleep  5s
##           P_CT_HomePage.SaudiArabiaCurrency
#          #sleep  5s
#           P_CT_MainKeywords.DefaultPurchaseProduct
#           P_CT_ShippingPage.selectaddress    الرياض
#           P_CT_ShippingPage.selectshipping    مندوب 2
#           P_CT_ShippingPage.confirmshipping
#           sleep    5s
#           P_CT_PaymentPage.selectpayment    دفع عند الاستلام
#           sleep  3s
#           P_CT_PaymentPage.ordernotes    ملاحظات
#
#           P_CT_PaymentPage.confirmpayment


