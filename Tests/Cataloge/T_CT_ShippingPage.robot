*** Settings ***
Documentation    This is Check Out test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_MainKeywords.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_ShippingPage.robot





Test Setup       Start WebTest    none
Test Teardown    End WebTest
*** Variables ***
${CT_CHECKOUT_SIGNIN_BTN}    //button[@class="d-block primary round submit btn block text-left"]
${CT_STAGING_URL}    https://1s5ehu.zidtest.com/
*** Keywords ***

*** Test Cases ***
SelectExistingAddress
    [Documentation]    add adress    shipping
    [Tags]    Shipping    Select_Address
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    sleep    2s

#SelectShippingCompany
#    [Documentation]    select shipping company
#    [Tags]    shipping_c    shipping
#    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#    P_CT_HomePage.SaudiArabiaCurrency
#    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
#    P_CT_ShippingPage.selectaddress    الرياض
#    P_CT_ShippingPage.selectshipping    ارامكس
#    P_CT_ShippingPage.confirmshipping


AddNewAddress
    [Documentation]    add new address
    [Tags]    shipping_c    shippingQ
     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
     P_CT_HomePage.CurrencySaudiArabia
     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    lyrunahu@cyclelove.cc    ${CT_STAGING_URL}
     P_CT_ShippingPage.New Address


UpdateAddress
    [Documentation]    update address
     [Tags]    shipping_c    shipping
     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
     P_CT_HomePage.CurrencySaudiArabia
     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    beqeloqe@decabg.eu    ${CT_STAGING_URL}
     P_CT_ShippingPage.Update Address

DeleteAddress
     [Documentation]    delete address
     [Tags]    shipping_c    shipping
     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    lyrunahu@cyclelove.cc    ${CT_STAGING_URL}
     P_CT_ShippingPage.Delete Address


SomeoneElseRecieveTheOrder
     [Documentation]    someone else recieve the order
     [Tags]    shipping_c    shipping
      P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
      P_CT_HomePage.CurrencySaudiArabia
      P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    zohagemy@decabg.eu    ${CT_STAGING_URL}
      P_CT_ShippingPage.SomeoneElseWillRecieveTheOrder


SelectAramexShippingCompany
     [Documentation]    Select Aramix Shipping Company
    [Tags]    shipping_c    shippingD
     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
     P_CT_HomePage.CurrencySaudiArabia
     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    zohagemy@decabg.eu    ${CT_STAGING_URL}
     P_CT_ShippingPage.selectaddress    الرياض
     P_CT_ShippingPage.selectshipping    ارامكس
     P_CT_ShippingPage.confirmshipping
     SelectPayment    تحويل بنكي
     P_CT_ShippingPage.Shipping Option name Check in Payment Page  ارامكس


#SelectFastloShippingCompany
#    [Documentation]    Select Fastlo Shipping Company
#    [Tags]    shipping_c    shipping
#     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#     P_CT_HomePage.SaudiArabiaCurrency
#     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    zohagemy@decabg.eu    ${CT_STAGING_URL}
#     P_CT_ShippingPage.selectaddress    الرياض
#     P_CT_ShippingPage.selectshipping    فاستلو
#     P_CT_ShippingPage.confirmshipping
#     SelectPayment    تحويل بنكي
#     P_CT_ShippingPage.Shipping Option name Check in Payment Page  فاستلو


SelectSmsaShippingCompany
    [Documentation]   Select Smsa Shipping Company
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    tolipexy@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    سمسا
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page  سمسا



SelectIsnadShippingCompany
    [Documentation]   Select Isnad Shipping Company
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    tolipexy@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    إسناد
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page  إسناد

SelectSalasaShippingCompany
    [Documentation]   Select Isnad Shipping Company
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    سلاسة
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page  سلاسة

SelectCustomShipping
    [Documentation]   Select Custom Shipping
    [Tags]    shipping_c    shipping
     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
     P_CT_HomePage.CurrencySaudiArabia
     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
     P_CT_ShippingPage.selectaddress    الرياض
     P_CT_ShippingPage.selectshipping    Custom Shipping
     P_CT_ShippingPage.confirmshipping
     SelectPayment    تحويل بنكي
     P_CT_ShippingPage.Shipping Option name Check in Payment Page  Custom Shipping

SelectZidShipFastLevelOption
    [Documentation]   Select Zid Ship Fast Level Option
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    lyrunahu@cyclelove.cc    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    سريع
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page  سريع


SelectZidShipNowDaysLevelOption
    [Documentation]   Select Zid Now Days Level Option
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    vacileda@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    الآن
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page  الآن


SelectZidShip2DaysLevelOption
    [Documentation]   Select Zid Ship 2 Days Level Option
    [Tags]    shipping_c    shipping
     P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
     P_CT_HomePage.CurrencySaudiArabia
     P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    vacileda@decabg.eu    ${CT_STAGING_URL}
     P_CT_ShippingPage.selectaddress    الرياض
     P_CT_ShippingPage.selectshipping    يومين
     P_CT_ShippingPage.confirmshipping
     SelectPayment    تحويل بنكي
     P_CT_ShippingPage.Shipping Option name Check in Payment Page  يومين




SelectZidShipNoRushLevelOption
    [Documentation]   Select Zid Ship Normal Level Option
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    beqeloqe@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    عادي
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page  عادي



SelectZid hipAramexGCC-Drop-offLevelOption
    [Documentation]   elect Aramex GCC-Drop-off level option
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    beqeloqe@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping    أرامكس الخليج
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page   أرامكس الخليج


SelectZidShipAramexDrop-offLevelOption
    [Documentation]   Select Zid Ship Aramex Drop-off level option
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    vacileda@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping     زد شب - أرامكس
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page   زد شب - أرامكس


#SelectZidShipSmsaDrop-offLevelOption
#    [Documentation]   Select Zid Ship Smsa Drop-off level option
#    [Tags]    shipping_c    shipping
#    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
#    P_CT_HomePage.CurrencySaudiArabia
#    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    lyrunahu@cyclelove.cc    ${CT_STAGING_URL}
#    P_CT_ShippingPage.selectaddress    الرياض
#    P_CT_ShippingPage.selectshipping     زد شب - سمسا
#    P_CT_ShippingPage.confirmshipping
#    SelectPayment    تحويل بنكي
#    P_CT_ShippingPage.Shipping Option name Check in Payment Page   زد شب - سمسا


SelectZidShipSaudiPost-Drop-OffLevelOption
    [Documentation]   Select Saudi Post-Drop-Off level option
    [Tags]    shipping_c    shipping
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    pajicay867@ploneix.com    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.selectshipping     البريد السعودي
    P_CT_ShippingPage.confirmshipping
    SelectPayment    تحويل بنكي
    P_CT_ShippingPage.Shipping Option name Check in Payment Page   البريد السعودي


SelectAnInventory
     [Documentation]   Select an inventory
    [Tags]    shipping_c    shippingS
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia
    P_CT_MainKeywords.DefaultPurchaseProductWithEmail    lkl    vacileda@decabg.eu    ${CT_STAGING_URL}
    P_CT_ShippingPage.selectaddress    الرياض
    P_CT_ShippingPage.Select Recieve from a Branch Option
    P_CT_ShippingPage.confirmshipping
    P_CT_ShippingPage.Verify that Recieve from a branch option was choosen