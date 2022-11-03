*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Sortingddb}    css=button[id="products-list-sort"]
${SortByPopularity}    id=products-list-sort-popularity_order-asc
${SortCreationDesc}    id=products-list-sort-created_at-desc
${SortPriceAsc}    id=products-list-sort-price-desc
${SortPriceDesc}    id=products-list-sort-price-asc
${SearchBar}  css=input[id='search']
${SearchIcon}  css=[class="search-icon-float icon-search search-icon"]
${SearchResult}
${FilteringProducts_btn}    (//button[./span='تصفية النتائج'])[2]
${Filter'From'PriceField}    (//form//div//label[contains(text(),'من')]/following-sibling::input)[2]
${Filter'To'PriceField}  (//form//div//label[contains(text(),'إلى')]/following-sibling::input)[2]
${SaveFilter}    (//button[./span='حفظ'])[2]
${ShowDiscountsOnlyCheckBox}    (//span[contains(text(),'عرض التخفيضات فقط')]//ancestor::label)[2]
*** Keywords ***

SearchForProducts
    [Arguments]    ${ProductName}
    click element    ${searchbar}
    input text    ${searchbar}  ${ProductName}
    click element    ${SearchIcon}
    wait until page contains      نتائج البحث

SortByPopularity
    wait until element is visible    ${Sortingddb}
    click button    ${Sortingddb}
    wait until element is visible  ${SortByPopularity}
    Click Element    ${SortPriceAsc}

SortByCreationDesc
    wait until element is visible    ${Sortingddb}
    click button    ${Sortingddb}
    wait until element is visible  ${SortCreationDesc}
    Click Element    ${SortCreationDesc}

SortPriceAsc
    wait until element is visible    ${Sortingddb}
    click button    ${Sortingddb}
    wait until element is visible  ${SortPriceAsc}
    Click Element    ${SortPriceAsc}

SortPriceDesc
    wait until element is visible    ${Sortingddb}
    click button    ${Sortingddb}
    wait until element is visible  ${SortCreationDesc}
    Click Element    ${SortPriceDesc}

FilteringProducts
    [Arguments]  ${From}    ${To}
    wait until page contains    تصفية النتائج
    click button    ${FilteringProducts_btn}
    #wait until page contains    عرض التخفيضات فقط
    wait until element is visible  ${savefilter}
    #sleep    2s
    input text    ${Filter'From'PriceField}    ${From}
    input text    ${Filter'To'PriceField}    ${To}
    #Sleep    2s
    click button    ${savefilter}

FilteringProductsWithDiscounts

    [Arguments]  ${From}    ${To}
    wait until page contains    تصفية النتائج
    click button    ${FilteringProducts_btn}
    #wait until page contains    عرض التخفيضات فقط
    wait until element is visible  ${savefilter}
    #sleep    2s
    input text    ${Filter'From'PriceField}    ${From}
    input text    ${Filter'To'PriceField}    ${To}
    click element    ${ShowDiscountsOnlyCheckBox}
    #Sleep    2s
    click button    ${savefilter}