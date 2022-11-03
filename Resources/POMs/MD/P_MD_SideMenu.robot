*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***

######################## LOCATORS ##########################

${MD_SideMenu_Cataloge_BTN} =    xpath=  //a[contains(text(),'عرض صفحة المتجر')]

${MD_SideMenu_HOME_BTN} =    xpath= //a[./span='الطلبات']

${MD_SideMenu_Analytics_BTN} =    xpath= //a[./span='التحليلات']

${MD_SideMenu_Orders_DDP} =    xpath= //a[./span='الطلبات']
${MD_SideMenu_AllOrders_BTN} =    xpath=//a[./span='جميع الطلبات']
${MD_SideMenu_CreateOrder_BTN} =    xpath=//a[./span='إنشاء طلب لعميل']
${MD_SideMenu_Drafts_BTN} =    xpath=//a[./span='المسودات']
${MD_SideMenu_OrdersStatusMSGs_BTN} =    xpath=//a[./span='رسائل حالات الطلبات']

${MD_SideMenu_Products_DDP} =    xpath= //a[./span='المنتجات']
${MD_SideMenu_AllProducts_BTN} =    xpath=//a[./span='جميع المنتجات']
${MD_SideMenu_ProductsCategories_BTN} =    xpath=//a[./span='تصنيفات المنتجات']

${MD_SideMenu_Marketing_DDP} =    xpath= //a[./span='التسويق']
${MD_SideMenu_AbandonedCart_BTN} =    xpath=//a[./span='السلات المتروكة']
${MD_SideMenu_Coupons_BTN} =    xpath=///a[./span='قسائم التخفيض']
${MD_SideMenu_AutoDiscounts_BTN} =    xpath=//a[./span='الخصومات التلقائية']
${MD_SideMenu_BundleOffers_BTN} =    xpath=//a[./span='الحزم التسويقية']
${MD_SideMenu_SMSCampaigns_BTN} =    xpath=//a[./span='حملات الرسائل النصية']
${MD_SideMenu_SEO_BTN} =    xpath=//a[./span='تحسينات محركات البحث']

${MD_SideMenu_Shipping_DDP} =    xpath= //a[./span='الشحن والتوصيل']
${MD_SideMenu_Zidship_BTN} =    xpath=//a[./span='زد شب']
${MD_SideMenu_ShippingOptions_BTN} =    xpath=//a[@href="/account/settings/delivery-options"]

${MD_SideMenu_Payment_DDP} =    xpath= //a[./span='الدفع']
${MD_SideMenu_ZidPay_BTN} =    xpath= //a[./span='زد باي']
${MD_Setting_PaymentOptions_BTN} =    xpath= //a[@href="/account/settings/payment-options"]

${MD_SideMenu_Customers_BTN} =    xpath= //a[./span='العملاء']

${MD_SideMenu_APPMARKET_DDP} =    xpath= //a[./span='سوق التطبيقات']
${MD_SideMenu_AllApps_BTN} =    xpath= //a[./span='جميع التطبيقات']
${MD_SideMenu_AppsManagement_BTN} =    xpath= //a[./span='إدارة التطبيقات']

${MD_SideMenu_ThemesStore_BTN} =    xpath= //a[./span='سوق الثيمات']

${MD_SideMenu_Staff_BTN} =    xpath= //a[./span='فريق العمل']

${MD_SideMenu_Empowerment_BTN} =    xpath= //a[./span='التمكين']

${MD_SideMenu_Settings_BTN} =    xpath= //a[./span='الإعدادات']

${MD_SideMenu_StoreDesign_DDP} =    xpath= //a[./span='تصميم المتجر']
${MD_SideMenu_ThemesStore_BTN} =    xpath= //a[./span='تصميم المتجر']//parent::/a[./span='سوق الثيمات']
${MD_SideMenu_Customize_BTN} =    xpath= //a[./span='تخصيص']
${MD_SideMenu_AddtionalPages_BTN} =    xpath= //a[./span='صفحات إضافية']

${MD_SideMenu_CouponsPage_BTN}    //a[./span='قسائم التخفيض']
${MD_SideMenu_Marketing_BTN}      //a[./span='التسويق']

*** Keywords ***

GoTo Cataloge
    wait until element is visible    ${MD_SideMenu_Cataloge_BTN}
    click link    ${MD_SideMenu_Cataloge_BTN}
    sleep    3s

GoTo AllOrders
    wait until element is visible    ${MD_SideMenu_Orders_DDP}
    click link    ${MD_SideMenu_Orders_DDP}
    wait until element is visible    ${MD_SideMenu_AllOrders_BTN}
    click link    ${MD_SideMenu_AllOrders_BTN}

GoTo AllProducts
    wait until element is visible    ${MD_SideMenu_Products_DDP}
    click link    ${MD_SideMenu_Products_DDP}
    wait until element is visible    ${MD_SideMenu_AllProducts_BTN}
    click link    ${MD_SideMenu_AllProducts_BTN}

GoTo Marketing
    wait until element is visible    ${MD_SideMenu_Marketing_BTN}
    click link    ${MD_SideMenu_Marketing_BTN}

GoTo CouponsPage
    wait until element is visible    ${MD_SideMenu_CouponsPage_BTN}
    click link    ${MD_SideMenu_CouponsPage_BTN}

GoTo ZidShipDashboard
    wait until element is visible    ${MD_SideMenu_Shipping_DDP}
    click link    ${MD_SideMenu_Shipping_DDP}
    wait until element is visible    ${MD_SideMenu_Zidship_BTN}
    click link    ${MD_SideMenu_Zidship_BTN}

GoTo ShippingOptions
    wait until element is visible    ${MD_SideMenu_ShippingOptions_BTN}
    click link    ${MD_SideMenu_ShippingOptions_BTN}

GoTo ZidPayDashboard
    wait until element is visible    ${MD_SideMenu_Payment_DDP}
    click link    ${MD_SideMenu_Payment_DDP}
    wait until element is visible    ${MD_SideMenu_ZidPay_BTN}
    click link    ${MD_SideMenu_ZidPay_BTN}

GoTo SettingsPage
    wait until element is visible    ${MD_SideMenu_Settings_BTN}
    click link    ${MD_SideMenu_Settings_BTN}


GoTo PaymentOptions
    wait until element is visible    ${MD_SideMenu_Settings_BTN}    10s
    click link    ${MD_SideMenu_Settings_BTN}
    wait until element is visible    ${MD_Setting_PaymentOptions_BTN}
    click link    ${MD_Setting_PaymentOptions_BTN}

GoTo Setting
    wait until element is visible    ${MD_SideMenu_Settings_BTN}
    click link    ${MD_SideMenu_Settings_BTN}

GoTo AllApps Page
    wait until element is visible    ${MD_SideMenu_APPMARKET_DDP}
    click link    ${MD_SideMenu_APPMARKET_DDP}
    wait until element is visible    ${MD_SideMenu_AllApps_BTN}
    click link    ${MD_SideMenu_AllApps_BTN}
ClickOnSubscriptionManagement
    click element    //a[@class="ex-link"]//div[contains(text(),'إدارة الإشتراك')]
