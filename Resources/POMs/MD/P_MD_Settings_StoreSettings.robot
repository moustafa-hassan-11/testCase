*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***

${CommercialNameField}    xpath=.//input[@id='commercial_name']
${CommercialNameValue}    Test Commerial
${CorporateNameField}    xpath=.//input[@id='business_corporate_name']
${CorporateNameValue}    CorporateName
${BusinessType}    xpath=.//label[contains(text(),'مؤسسة')]/div/ins
${StoreHaveNoBranches}    xpath=.//label[contains(text(),'لا')]/div/ins
${CommercialCertificat}    xpath=//div[@id="corporation_fields"]//input[@type='file']
${CommercialCertificatBTN}    xpath=//div[@id="corporation_fields"]//button
${CommercialCertificatPath}    F:/WORK/Makan Gdeed/Zid_Automation_Framework/Resources/TestData/247249991_2690908437883075_3775234678426782221_n.jpg
${CivilIDImage_btn}    xpath=.//div[./following-sibling::input[@name='civil_id_image']]/following-sibling::input
${CiviIDImagePath}    F:/WORK/Makan Gdeed/Zid_Automation_Framework/Resources/TestData/247249991_2690908437883075_3775234678426782221_n.jpg
${CRNumberFiled}    xpath=.//input[@name='commercial_registration_number']
${CRNumberValue}    545454545
${CivilIDField}    xpath=.//input[@id='civil_id']
${CivilIDValue}    123456798
${CountryDropDown}    xpath=//*[@id="countries_select_chosen"]/a
${CountrySearchBar}    //*[@id="countries_select_chosen"]/div/div/input
${CityDropDown}    //*[@id="city_id_chosen"]/a
${CitySearchBar}    //*[@id="city_id_chosen"]/div/div/input
${SaveButton}    //*[@id="edit_store_info"]/div/div/div[5]/input
${DistrictField}=    //*[@id="district"]
${StreetField} =    //*[@id="street"]
${District}=    حي حسين
${Street} =    شارع حسين
*** Keywords ***
Filling Store Settings
    wait until page contains element    ${CommercialNameField}
    input text   ${CommercialNameField}    ${CommercialNameValue}
    click element    ${BusinessType}
    click element    ${StoreHaveNoBranches}
    input text    ${CorporateNameField}    ${corporatenamevalue}
    input text    ${CRNumberFiled}    ${CRNumberValue}
    Choose File    ${commercialcertificat}    ${CommercialCertificatPath}
    input text    ${CivilIDField}    ${CivilIDValue}
    Wait Until Page Contains Element   ${CivilIDImage_btn}   5s
    Choose File    ${CivilIDImage_btn}    ${CiviIDImagePath}
    click element    ${CountryDropDown}
    click element    ${CountryDropDown}
    input text    ${CountrySearchBar}    السعودية
    Press Keys    ${CountrySearchBar}    ENTER
    click element    ${CityDropDown}
    input text    ${CitySearchBar}    الرياض
    Press Keys    ${CitySearchBar}    ENTER
    input text    ${DistrictField}    ${District}
    input text    ${StreetField}    ${Street}
    click element    ${SaveButton}
    wait until element is visible    //*[@id="page-wrapper"]/div[5]/div/div/div
    page should contain     تم تحديث معلومات المتجر بنجاح

