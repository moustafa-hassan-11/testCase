*** Settings ***
Documentation    This is Subscription test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/MD/P_MD_SubscriptionManagement.robot
Resource  ../../Resources/POMs/MD/P_MD_SubscriptionOrder.robot
Resource  ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource  ../../Resources/POMs/MD/P_MD_SubscriptionPayment.robot
Resource  ../../Resources/POMs/MD/P_MD_SubscriptionOrderConfirmation.robot

Test Setup       Start WebTest
Test Teardown    End WebTest

*** Variables ***
${EssentialPackage}    الأساسية
${MonthlyEssentialBundle}    شهري
${3MonthsEssentialBundle}     ٣ أشهر
${YearlyEssentialBundle}     سنوي

${GrowthPackage}    النمو
${MonthlyGrowthBundle}    شهري
${3MonthsGrowthBundle}    ٣ أشهر
${YearlyGrowthBundle}    سنوي

${ProfessionalPackage}    الإحترافية
${3MonthsProfessionalBundle}     ٣ أشهر
${YearlyProfessionalBundle}    سنوي

${SendersName}    دول الخليج بدون السعودية
${OrdersTextMsgs}       1000
${CampaignsTextMsgs}    5000

${CouponCode}    MajedTest

${SuspenddedEMAIL} =    check1000@hotmail.com
${SuspendedPASSWORD} =    12345678

${EssentialEMAIL} =    i@hotmail.com
${EssentialPASSWORD} =    123456780

${EssentialEMAIL2} =    test10@hotmail.com
${EssentialPASSWORD2} =    12345678

${GrowthEMAIL} =    anda22@hotmail.com
${GrowthPASSWORD} =    12345678

${GrowthEMAIL2} =    ahmed232@hotmail.com
${GrowthPASSWORD2} =    12345678

${ProfessionalEMAIL} =    test20@hotmail.com
${ProfessionalPASSWORD} =    12345678
*** Test Cases ***
SubscribeIn3MonthsEssentialPackageForSuspendedStoreUsingBankTransferMethod
    [Documentation]    subscription 3 months Essential package for suspended aacount Using BankTransfer Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${SuspenddedEMAIL}    ${SuspendedPASSWORD}

    P_MD_SubscriptionManagement.ClickOnRenewSubscription
    P_MD_SubscriptionOrder.SelectPackages    ${EssentialPackage}    ${3MonthsEssentialBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

SubscribeIn3MonthsGrowthPackageForSuspendedStoreUsingBankTransferMethod
    [Documentation]    subscription 3 months Growth package for suspended aacount Using BankTransfer Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${SuspenddedEMAIL}    ${SuspendedPASSWORD}

    P_MD_SubscriptionManagement.ClickOnRenewSubscription
    P_MD_SubscriptionOrder.SelectPackages    ${GrowthPackage}    ${3MonthsGrowthBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

SubscribeIn3MonthsProfessionalPackageForSuspendedStoreUsingBankTransferMethod
    [Documentation]    subscription 3 months Professional package for suspended aacount Using BankTransfer Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${SuspenddedEMAIL}    ${SuspendedPASSWORD}

    P_MD_SubscriptionManagement.ClickOnRenewSubscription
    P_MD_SubscriptionOrder.SelectPackages    ${ProfessionalPackage}    ${3MonthsProfessionalBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

RenewEssentialPackageWithMonthlyUsingCreditCardMethod
    [Documentation]    renew Essential package With Monthly Using Credit Card Method
    [Tags]    Subscription    tt
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL}    ${EssentialPASSWORD}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectPackages    ${EssentialPackage}    ${MonthlyEssentialBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton2
    P_MD_SubscriptionPayment.PayWithCreditCard      5123 4500 0000 0008    09/23    100    ABDO
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.ClickOnAgreeOnTermsCheckbox
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton2
    P_MD_SubscriptionOrderConfirmation.ConfirmPayWithCreditCard
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithCreditCard

RenewGrowthPackageWithMonthlyUsingCreditCardMethod
    [Documentation]    renew Growth package With Monthly Using Credit Card Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${GrowthEMAIL}    ${GrowthPASSWORD}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectPackages    ${GrowthPackage}    ${MonthlyGrowthBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton2
    P_MD_SubscriptionPayment.PayWithCreditCard      5123 4500 0000 0008    09/23    100    ABDO
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.ClickOnAgreeOnTermsCheckbox
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton2
    P_MD_SubscriptionOrderConfirmation.ConfirmPayWithCreditCard
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithCreditCard

RenewProfessionalPackageWithYearlyUsingCreditCardMethod
    [Documentation]    renew Professional package With Yearly Using Credit Card Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${ProfessionalEMAIL}    ${ProfessionalPASSWORD}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectPackages    ${ProfessionalPackage}    ${YearlyProfessionalBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton2
    P_MD_SubscriptionPayment.PayWithCreditCard      5123 4500 0000 0008    09/23    100    ABDO
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.ClickOnAgreeOnTermsCheckbox
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton2
    P_MD_SubscriptionOrderConfirmation.ConfirmPayWithCreditCard
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithCreditCard

UpgradeFromMonthlyEssentialToYearlyGrowthPackageUsingBankTransferMethod
    [Documentation]    upgrade from Monthly Essential to Yearly Growth package Using BankTransfer Method
    [Tags]       Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL2}    ${EssentialPASSWORD2}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnUpgradeToGrowthPackage
    P_MD_SubscriptionOrder.SelectPackages    ${GrowthPackage}    ${YearlyGrowthBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

UpgradeFromMonthlyEssentialToYearlyProfessionalPackageUsingBankTransferMethod
    [Documentation]    upgrade from Monthly Essential to Yearly professional package Using BankTransfer Method
    [Tags]       Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL2}    ${EssentialPASSWORD2}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnUpgradeToProfessionalPackage
    P_MD_SubscriptionOrder.SelectPackages    ${ProfessionalPackage}    ${YearlyProfessionalBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

UpgradeFromMonthlyGrowthToYearlyProfessionalPackageUsingBankTransferMethod
    [Documentation]    upgrade from Monthly Growth to Yearly professional package Using BankTransfer Method
    [Tags]       Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${GrowthEMAIL2}    ${GrowthPASSWORD2}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnUpgradeToProfessionalPackage
    P_MD_SubscriptionOrder.SelectPackages    ${ProfessionalPackage}    ${YearlyProfessionalBundle}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

SubscribeInSenderNameWithRenewThePackageInSubscriptionOrderPageUsingBankTransferMethod
    [Documentation]    Subscribe In Sender Name in With Renew The Package subscription order page Using BankTransfer Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL2}    ${EssentialPASSWORD2}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectSendersName    ${SendersName}
    P_MD_SubscriptionOrder.ClickOnAdditionButton
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

SubscribeInOrdersTextMessagesWithRenewThePackageInSubscriptionOrderPageUsingCreditCardMethod
   [Documentation]    Subscribe In Orders TextMsgs With Renew The Package in subscription order page Using Credit Card Method
   [Tags]    Subscription
   [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL}    ${EssentialPASSWORD}

   P_MD_SideMenu.GoTo SettingsPage
   P_MD_SideMenu.ClickOnSubscriptionManagement
   P_MD_SubscriptionManagement.ClickOnRenewPackage
   P_MD_SubscriptionOrder.SelectOrdersTextMsgs    ${OrdersTextMsgs}
   P_MD_SubscriptionOrder.ClickOnAdditionButton
   P_MD_SubscriptionOrder.ClickOnContinueButton2
   P_MD_SubscriptionPayment.PayWithCreditCard      5123 4500 0000 0008    09/23    100    ABDO
   P_MD_SubscriptionPayment.ClickOnContinueButton
   P_MD_SubscriptionOrderConfirmation.ClickOnAgreeOnTermsCheckbox
   P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton2
   P_MD_SubscriptionOrderConfirmation.ConfirmPayWithCreditCard
   P_MD_SubscriptionOrderConfirmation.VerifyPayWithCreditCard

# Pre condition : Costomize sender name first
SubscribeInCampaignsTextMessagesWithRenewThePackageInSubscriptionOrderPageUsingBankTransferMethod
    [Documentation]    Subscribe In Campaigns TextMsgs With Renew The Package in subscription order page Using BankTransfer Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL}    ${EssentialPASSWORD}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectCampaignsTextMsgs    ${CampaignsTextMsgs}
    P_MD_SubscriptionOrder.ClickOnAdditionButton
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

SubscribeInSenderNameInSubscriptionManagementPageUsingBankTransferMethod
    [Documentation]    Subscribe In Sender Name in subscription management page Using BankTransfer Method
    [Tags]    Subscription    sub
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL2}    ${EssentialPASSWORD2}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.SelectSendersName    ${SendersName}
    P_MD_SubscriptionManagement.ClickOnAdditionButton
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer


SubscribeInOrdersTextMessagesInSubscriptionManagementPageUsingCreditCardMethod
   [Documentation]    Subscribe In Orders TextMsgs in subscription management page Using Credit Card Method
   [Tags]    Subscription
   [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL}    ${EssentialPASSWORD}

   P_MD_SideMenu.GoTo SettingsPage
   P_MD_SideMenu.ClickOnSubscriptionManagement
   P_MD_SubscriptionManagement.SelectOrdersTextMsgs    ${OrdersTextMsgs}
   P_MD_SubscriptionManagement.ClickOnAdditionButton
   P_MD_SubscriptionOrder.ClickOnContinueButton2
   P_MD_SubscriptionPayment.PayWithCreditCard      5123 4500 0000 0008    09/23    100    ABDO
   P_MD_SubscriptionPayment.ClickOnContinueButton
   P_MD_SubscriptionOrderConfirmation.ClickOnAgreeOnTermsCheckbox
   P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton2
   P_MD_SubscriptionOrderConfirmation.ConfirmPayWithCreditCard
   P_MD_SubscriptionOrderConfirmation.VerifyPayWithCreditCard

# Pre condition : Costomize sender name first
SubscribeInCampaignsTextMessagesInSubscriptionManagementPageUsingBankTransferMethod
    [Documentation]    Subscribe In Campaigns TextMsgs in subscription management page Using BankTransfer Method
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL2}    ${EssentialPASSWORD2}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.SelectCampaignsTextMsgs    ${CampaignsTextMsgs}
    P_MD_SubscriptionManagement.ClickOnAdditionButton
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer

# Pre condition: Set a Coupon
RenewPackageWithCouponUsingBankTransferMethod
    [Documentation]    renew package with coupon Using BankTransfer Method, Pre condition: Set a Coupon
    [Tags]    Subscription
    [Setup]    Start WebTest   MD  ${MD_Testing_URL}    ${EssentialEMAIL}    ${EssentialPASSWORD}

    P_MD_SideMenu.GoTo SettingsPage
    P_MD_SideMenu.ClickOnSubscriptionManagement
    P_MD_SubscriptionManagement.ClickOnRenewPackage
    P_MD_SubscriptionOrder.SelectPackages    ${EssentialPackage}    ${MonthlyEssentialBundle}
    P_MD_SubscriptionOrder.AddCouponCode    ${CouponCode}
    P_MD_SubscriptionOrder.ClickOnContinueButton
    P_MD_SubscriptionPayment.PayWithBankTransfer
    P_MD_SubscriptionPayment.ClickOnContinueButton
    P_MD_SubscriptionOrderConfirmation.AddBankTransfer
    P_MD_SubscriptionOrderConfirmation.ClickOnConfirmationButton
    P_MD_SubscriptionOrderConfirmation.VerifyPayWithBankTransfer