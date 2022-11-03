*** Settings ***
Library    SeleniumLibrary

Resource    ../../Resources/POMs/Zidpay/P_ZDP_Landing.Robot
Resource    ../../Resources/POMs/Zidpay/P_ZDP_TransactionPage.Robot
Resource    ../../Resources/POMs/Zidpay/P_ZDP_TransactionDetails.Robot
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/Common.robot

Test Setup    Start WebTest
Test Teardown    End WebTest

*** Variables ***

*** Test Cases ***
ZidPay Partial Refund
    [Documentation]    Partial Refund Positive Scenario
    P_MD_Login.LoginToMD
    P_MD_SideMenu.GoTo ZidPayDashboard
    wait until element is visible    ${zidpaytitle}
    P_ZDP_Landing.Navigating to Page    ${TransactionsPage}
    P_ZDP_TransactionPage.Navigating to Transactions Taps    ${successfultransactionstap}
    P_ZDP_TransactionPage.Click On First Transaction Details Button
    P_ZDP_TransactionDetails.Partial Refund



