*** Settings ***
Documentation    This is AllProducts_Page test cases Script

Resource    ../../Resources/POMs/MD/P_MD_AllProducts.robot
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/Common.robot

Test Setup       Start WebTest
Test Teardown    End WebTest

*** Variables ***
${Email}      zid.test.automation@gmail.com
${Password}      12345678

*** Test Cases ***
#Remain: Manual Sorting + upload file for importing
Import All Products    #not completed
    [Documentation]   Import All Products
    [Tags]    Import
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.import products
    #P_MD_AllProducts.Download The Form
    #P_MD_AllProducts.Upload The Form
    choose file    //*[@id="app"]/div/div[3]/div[3]/header/div[2]/div[1]/div/div/div/main/div[2]/input    D:\file.xlsx
    sleep    2s

Add New Product
    [Documentation]   Add New Product
    [Tags]    AddNewProduct
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.click New Product

################################################## Search & Filteration ################################################
Search for a Product
    [Documentation]    Search for a Product
    [Tags]    Search
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Search For Product    Dry    #fail if the product not exist

Filter Products by Publishing on Store
    [Documentation]   Filter Products by Publishing on Store
    [Tags]     StorePublish
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    p_md_AllProducts.filter products by publishing on store    منشور

Filter Products by Availability on Store
    [Documentation]   Filter Products by Availability on Store
    [Tags]     StoreAvailability
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    p_md_AllProducts.filter products by store availability    متوفر

Filter Products by Both Filters
    [Documentation]   Filter Products by Both Filters
    [Tags]     BothFilters
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    p_md_AllProducts.filter products by the two filters    منشور    متوفر

################################################## Manual Arrange ######################################################
#Arrange Products by Numbering
#Arrange Products by Dragging

################################################## Export & Delete #####################################################
Export All Products
    [Documentation]   Export All Products
    [Tags]    Export
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    p_md_AllProducts.exportproducts

Delete All Products
    [Documentation]    Delete All Products
    [Tags]    Delete_All
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Select All Products
    P_MD_AllProducts.Delete selected Products

Delete selected Products
    [Documentation]    Delete Selected Products
    [Tags]    Delete_Selected
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Search For Product    Rose
    P_MD_AllProducts.Select Product    Rose
    P_MD_AllProducts.Delete Selected Products

################################################### Title bar ##########################################################
Arrange Product_Name
   [Tags]    Arrange_Name
   [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
   #P_MD_login.MD_Login
   P_MD_AllProducts.Open AllProducts Page
   P_MD_AllProducts.Arrange Ascendingly    الاسم

Arrange Product_Quantity
   [Tags]    Arrange_Quantity
   [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
   #P_MD_login.MD_Login
   P_MD_AllProducts.Open AllProducts Page
   P_MD_AllProducts.Arrange Ascendingly    الكمية

Arrange Product_Price
   [Tags]    Arrange_Price
   [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
   #P_MD_login.MD_Login
   P_MD_AllProducts.Open AllProducts Page
   P_MD_AllProducts.Arrange Ascendingly    السعر

################################################## Product Row #########################################################
Open ProductDetailsPage
    [Tags]    Open_Product
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Open Product    Dry

Update Product
    [Tags]    Update_Product
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Update Product   Dry

Delete Product
    [Tags]    Delete_Product
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Delete Product   Rose    #change name of product

#################################################### Footer ############################################################
Change the Page Number
    [Documentation]    Change the Page Number
    [Tags]    PageNumber
    [Setup]    Start WebTest    MD    ${MD_STAGING_URL}    ${Email}    ${Password}
    #P_MD_login.MD_Login
    P_MD_AllProducts.Open AllProducts Page
    P_MD_AllProducts.Change the Page    2