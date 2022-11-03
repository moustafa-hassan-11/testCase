*** Settings ***

############# Libraries ###########
Documentation
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/POMs/MD/P_MD_AllProducts.robot
Resource    ../../Resources/POMs/MD/P_MD_Warehouse.robot
Resource    ../../Resources/POMs/MD/P_MD_AllOrders.robot
Resource    ../../Resources/POMs/MD/P_MD_PaymentOptions.robot
Resource    ../../Resources/POMs/MD/P_MD_CreateProduct.robot
Resource    ../../Resources/POMs/MD/P_MD_ShippingAndDeliveryCompanies.robot
Resource    ../../Resources/POMs/Cataloge/P_CT_MainKeywords.robot
Resource    ../../Resources/Common.robot

Test Setup    Start WebTest

Test Teardown    End WebTest

*** Variables ***
${PRODUCT_NAME}=    Totally new name
${PRICE}=    30
${WEIGHT}=    15
${STOCK}=    5

*** Test Cases ***
DEMO MD & Catalog Smoke Test
    [Documentation]    This is a smoke test for MD and Catalog Together
    [Tags]    DEMO
       #Login to MD
    P_MD_Login.LoginToMD
       # Create Product
    P_MD_SideMenu.GoTo AllProducts
    P_MD_AllProducts.Click CreateProduct
    P_MD_CreateProduct.Enter Product Details
    P_MD_CreateProduct.Save Product
    P_MD_CreateProduct.Navigate To AllProducts
        #Edit Product
    P_MD_AllProducts.Edit Product by Name
    P_MD_CreateProduct.Edit Product
    P_MD_CreateProduct.Save Product
    P_MD_CreateProduct.Navigate To AllProducts
        #add bank
    P_MD_SideMenu.GoTo PaymentOptions
    P_MD_PaymentOptions.Add New Bank Account
        #add warehouse
    P_MD_SideMenu.GoTo Setting
    P_MD_Warehouse.GoTo WarehousePage
    P_MD_Warehouse.Add New Warehouse
        #modify warehouse
    P_MD_Warehouse.Edit Warehouse
        #activate shipping company
    P_MD_SideMenu.GoTo ShippingOptions
    P_MD_ShippingAndDeliveryCompanies.ActivateSmsa
        #navigate to catalog
    P_MD_SideMenu.GoTo Cataloge
    Common.Switch to Windows Handle    1
        #Complete Checkout
    P_CT_MainKeywords.Complete Checkout
        #navigate back to MD
    Common.Switch to Windows Handle    0
        # Show Order in MD
    P_MD_SideMenu.GoTo AllOrders
        #Expand Order
    P_MD_AllOrders.Expand Order
    sleep    3s
        # Show Order Details
    P_MD_AllOrders.Open Order Details
    sleep    5s