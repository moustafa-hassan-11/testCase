*** Settings ***
Documentation    This is My Account test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/Cataloge/P_CT_LoginPage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_MyAccountPage.robot

Test Setup       Start WebTest
Test Teardown    End WebTest

*** Variables ***
${ModifyCountry}    السعودية
${ModifyCity}    جدة
${ModifyStreet}    12
${ModifyNeighbourhood}    14

${AddCountry}    السعودية
${AddCity}    تبوك
${AddStreet}    12
${AddNeighbourhood}    14

${RemoveCity}    جدة

${OrderNumber}      5164
*** Test Cases ***
UpdateCustomerName
    [Documentation]    Update customer name
    [Tags]    Profile    MyAccount
    [Setup]   Start WebTest   Cataloge  ${Catalog_Testing_URL}

# Login
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    pajicay867@ploneix.com
    P_CT_loginpage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin
# Update Name
    P_CT_HomePage.ClickMyAccount
    P_CT_MyAccountPage.VerifyReachMyAccountPage
    P_CT_MyAccountPage.UpdateCustomerName    Abdelrahman
    P_CT_MyAccountPage.ClickOnSaveButton
    P_CT_myaccountpage.verifyupdatedcustomername
    P_CT_MyAccountPage.UpdateCustomerName     sayed sayed
    P_CT_MyAccountPage.ClickOnSaveButton
    P_CT_myaccountpage.verifyupdatedcustomername

UpdateCustomerEmail
    [Documentation]    Update customer Email
    [Tags]    Profile    MyAccount
    [Setup]   Start WebTest   Cataloge  ${Catalog_Testing_URL}
# Login
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    beqeloqe@decabg.eu
    P_CT_loginpage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin
# Update Email
    P_CT_HomePage.ClickMyAccount
    P_CT_MyAccountPage.VerifyReachMyAccountPage
    P_CT_myaccountpage.updatecustomeremail    a.mohamed996@gmail.com
    P_CT_MyAccountPage.ClickOnSaveButton
    P_CT_myaccountpage.verifyupdatedcustomerEmail
    P_CT_myaccountpage.updatecustomeremail    beqeloqe@decabg.eu
    P_CT_MyAccountPage.ClickOnSaveButton
    P_CT_myaccountpage.verifyupdatedcustomerEmail

CustomerLogout
    [Documentation]    Customer can Logout
    [Tags]    Logout    MyAccount
    [Setup]   Start WebTest   Cataloge  ${Catalog_Testing_URL}

# Login
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    lyrunahu@cyclelove.cc
    P_CT_loginpage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin
# logout
    P_CT_HomePage.ClickMyAccount
    P_CT_MyAccountPage.VerifyReachMyAccountPage
    P_CT_myaccountpage.ClickOnLogout
    P_CT_myaccountpage.verifysuccessfullogout

Add,ModifyAndRemoveCustomerAddress
    [Documentation]    Customer can add new address
    [Tags]    add-address    MyAccount    tt
    [Setup]   Start WebTest   Cataloge  ${Catalog_Testing_URL}

# LoginWithEmail
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    vacileda@decabg.eu
    P_CT_loginpage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin
# ADD
    P_CT_HomePage.ClickMyAccount
    P_CT_MyAccountPage.VerifyReachMyAccountPage
    P_CT_MyAccountPage.ClickOnAddresses
    P_CT_MyAccountPage.ClickOnAddNewAddress
    P_CT_MyAccountPage.EnterNewCustomerAddress    ${AddCountry}    ${AddCity}    ${AddStreet}    ${AddNeighbourhood}
    P_CT_MyAccountPage.VerifySuccessfulAddition
# Modify
    P_CT_MyAccountPage.ClickOnAddresses
    P_CT_MyAccountPage.PickAnAddressToBeModified    تبوك
    P_CT_MyAccountPage.VerifyReachModifyPage
    P_CT_MyAccountPage.ModifyCustomerAddress    ${ModifyCountry}   ${ModifyCity}   ${ModifyStreet}   ${ModifyNeighbourhood}
    P_CT_MyAccountPage.VerifySuccessfulModification
# Remove
    P_CT_MyAccountPage.ClickOnAddresses
    P_CT_MyAccountPage.PickAnAddressToBeRemoved         ${RemoveCity}

ShowOrderDetails
    [Documentation]    Customer can show the order details
    [Tags]    show-order    MyAccount    tt
    [Setup]   Start WebTest   Cataloge  ${Catalog_Testing_URL}

# Login
    P_CT_HomePage.ClickHeaderLogin
    P_CT_loginpage.ClickLoginWithEmail
    P_CT_loginpage.SetEmail    a.mohamed9966@gmail.com
    P_CT_loginpage.VerifyEmailRecaptcha
    P_CT_LoginPage.ClickContinueButtonEmail
    P_CT_loginpage.SetVerificationCodeEmail   1234
    P_CT_LoginPage.ClickLoginButtonEmail
    P_CT_HomePage.VerifySuccessfulLogin
# Show order
    P_CT_HomePage.ClickMyAccount
    P_CT_MyAccountPage.VerifyReachMyAccountPage
    P_CT_MyAccountPage.ClickOnMyOrders
    P_CT_MyAccountPage.PickAnOrderToShow     ${OrderNumber}
    capture page screenshot
    P_CT_MyAccountPage.VerifyReachOrderPage

