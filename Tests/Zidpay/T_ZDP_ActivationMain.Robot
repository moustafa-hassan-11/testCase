*** Settings ***
Library    SeleniumLibrary

Resource    ../../Resources/POMs/Zidpay/P_ZDP_Landing.Robot
Resource    ../../Resources/POMs/Zidpay/P_ZDP_MarketingPage.Robot
Resource    ../../Resources/POMs/Zidpay/P_ZDP_Activation.Robot
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/Common.robot

Test Setup    Start Web Test
Test Teardown    End Web Test

*** Variables ***

*** Test Cases ***
ZidPay Activation
    [Documentation]    Zidpay Activation Positive Scenario

    P_MD_Login.LoginToMD
    P_MD_SideMenu.GoTo ZidPayDashboard
    P_ZDP_MarketingPage.Click On Activate Zidpay Now
    P_ZDP_Activation.Choose Number Of Transactions
    P_ZDP_Activation.Choose Volume Of Transactions
    P_ZDP_Activation.Choose The Bank Account
    P_ZDP_Activation.AcceptTermsAndContions
    P_ZDP_Activation.Click On Activation Button
    P_ZDP_Landing.Verify that Activation is done successfully







