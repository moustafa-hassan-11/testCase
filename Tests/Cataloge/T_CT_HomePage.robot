*** Setting ***
Resource  ../../Resources/POMs/Cataloge/P_CT_HomePage.robot
Resource  ../../Resources/Common.robot

Test Setup       Start WebTest    None
Test Teardown    End WebTest

*** Variables ***
${CT_STAGING_URL} =    https://qdqqpv.zidtest.com/

*** Test Cases ***

ChangeTheCatalogCurrencyToSAR

    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencySaudiArabia

ChangeTheCatalogCurrencyToEGP

    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencyEgypt

ChangeTheCatalogCurrencyToKWD

    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencyKuwait

ChangeTheCatalogCurrencyToAED

    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.CurrencyUAE

ChangeTheCatalogLanguageToEnglish
    [Tags]    2
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.ChangeLanguageToEnglish

ChangeTheCatalogLanguageToArabic
    [Tags]    2
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.ChangeLanguageToArabic

SelectSpecificCategoryFromCategoriesPage
    [Tags]    1
    P_CT_HomePage.GoToCatalog    ${CT_STAGING_URL}
    P_CT_HomePage.AllCategoriesPage
    P_CT_HomePage.SelectFirstCategoryFromCategoriesPage
