*** Settings ***
############# Libraries ###########
Documentation
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/POMs/MD/P_MD_AllProducts.robot
Resource    ../../Resources/POMs/MD/P_MD_PaymentOptions.robot
Resource    ../../Resources/POMs/MD/P_MD_CreateProduct.robot
Resource    ../../Resources/POMs/MD/P_MD_ShippingAndDeliveryCompanies.robot
Resource    ../../Resources/Common.robot

Test Setup    Start WebTest

Test Teardown    End WebTest

*** Variables ***
############# Global Variables ###########

*** Test Cases ***
DEMO Smoke Test
    [Documentation]    THis is a Demo Test
    [Tags]    DEMO
    P_MD_Login.LoginToMD
    P_MD_SideMenu.GoTo AllProducts
    P_MD_AllProducts.GoTo CreateProduct
    P_MD_CreateProduct.Create New Product
    sleep    5s
    P_MD_SideMenu.GoTo PaymentOptions
    P_MD_PaymentOptions.Add New Bank Account
    sleep    5s
    P_MD_SideMenu.GoTo ShippingOptions
    P_MD_ShippingAndDeliveryCompanies.ActivateSmsa
    sleep    5s
