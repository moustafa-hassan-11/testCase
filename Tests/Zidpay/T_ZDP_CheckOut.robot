*** Settings ***
Documentation    This is Check Out test cases script

Resource  ../../Resources/Common.robot  # for Setup & Teardown
Resource  ../../Resources/POMs/Cataloge/P_CT_MainKeywords.robot

Test Setup       Start WebTest
Test Teardown    End WebTest
*** Keywords ***

*** Test Cases ***



CheckOutMadaByZidpay
    [Documentation]   Pay with Mada Card
    P_CT_HomePage.GoToCatalog
    P_CT_MainKeywords.PayThroughZidpay[Mada]
CheckOutVisa/MasterByZidpay
    [Documentation]   Pay with Visa/Master Card
    P_CT_HomePage.GoToCatalog
    P_CT_MainKeywords.PayThroughZidpay[Visa]