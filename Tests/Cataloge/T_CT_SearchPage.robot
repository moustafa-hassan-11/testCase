*** Settings ***
Resource  ../../Resources/Common.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/POMs/Cataloge/P_CT_SearchPage.robot

Test Setup       Start WebTest    none
Test Teardown    End WebTest
*** Variables ***
${CT_STAGING_URL}    https://qdqqpv.zidtest.com/

*** Test Cases ***

SearchForProductWithTheProductName
    [Tags]  search
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_SearchPage.SearchForProducts    Product A
    Sleep    3s

SearchForProductWithTheSKU
    [Tags]  search1
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.SearchBySKU    ${SKU}

SortTheProductsDescendinglyByCreationDate
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllProductsPage
    P_CT_SearchPage.SortByCreationDesc
    Sleep    3s

SortTheProductsByPopularity
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllProductsPage
    P_CT_SearchPage.SortByPopularity
    Sleep    3s

SortTheProductsAscendinglyByPrice
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllProductsPage
    P_CT_SearchPage.SortPriceAsc
    Sleep    3s

SortTheProductsDescendinglyByPrice
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllProductsPage
    P_CT_SearchPage.SortPriceDesc
    Sleep    3s

FilterTheProductByPriceRange

    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllProductsPage
    P_CT_SearchPage.FilteringProducts  20  60
    sleep    5s
FilterTheProductsWithDiscountsByPriceRange
    [Tags]    Filtering
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllProductsPage
    P_CT_SearchPage.FilteringProductsWithDiscounts    20  60
    sleep    5s

