*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***

#################### GLOBAL VARIABLES #####################
${CitySearch_Field}=    //div[@id="city_id_chosen"]//div[@class="chosen-search"]/input

######################## LOCATORS ##########################

${MD_Pageheader} =    xpath=//*[@class="pageheader__title"]
${MD_SideMenu_Settings_Warehouse_BTN} =    xpath=//*[@href="/account/settings/stock-addresses"]
${MD_SideMenu_Settings_Warehouse_Add_BTN} =    xpath=//*[@href="/account/settings/stock-addresses/add"]

${MD_SideMenu_Settings_Warehouse_Name_FLD} =                xpath=//*[@id="name"]
${MD_SideMenu_Settings_Warehouse_Country_DDP} =             xpath=//*[@id="countries_select_chosen"]
#${MD_SideMenu_Settings_Warehouse_Country_BTN} =             xpath=//li[contains(text(),'${WarehouseCountry}')]
${MD_SideMenu_Settings_Warehouse_City_DDP} =                xpath=//*[@id="city_id_chosen"]
#${MD_SideMenu_Settings_Warehouse_City_BTN} =                xpath=//li[contains(text(),'${WarehouseCity}')]
${MD_SideMenu_Settings_Warehouse_PaymentOnReceive_BOX} =    xpath=//label[contains(@for, "cop_enabled")]/div
${MD_SideMenu_Settings_Warehouse_IsPickUpOption_BOX} =      xpath=//label[contains(@for, "is_pickup_option")]/div
${MD_SideMenu_Settings_Warehouse_Save_BTN} =                xpath=//*[@class="btn btn-success btn-sm pull-right ladda-button"]

#${MD_SideMenu_Settings_Warehouse_Modify1_BTN} =             xpath=//a[contains(text(),'${WarehouseName}')]

#${MD_SideMenu_Settings_Warehouse_Settings_BTN} =            xpath=//a[contains(text(),'${WarehouseName}')]//parent::td//parent::tr/td[6]//button
#${MD_SideMenu_Settings_Warehouse_Settings_Delete_BTN} =     xpath = //a[contains(text(),'${WarehouseName}')]//parent::td//parent::tr/td[6]/div[@class="btn-group open"]/ul/li/a[@class="dropdown-item delete_inventory_btn"]

*** Keywords ***
############################# ACTIONS ##############################
GoTo WarehousePage
    wait until element is visible     ${MD_SideMenu_Settings_Warehouse_BTN}
    click link    ${MD_SideMenu_Settings_Warehouse_BTN}

Click Add New Warehouse
    wait until element is visible     ${MD_SideMenu_Settings_Warehouse_Add_BTN}
    click link     ${MD_SideMenu_Settings_Warehouse_Add_BTN}

Choose Warehouse to Modify
    [Arguments]   ${SearchWarehouseName}
    click element              xpath=//a[contains(text(),'${SearchWarehouseName}')]

Enter WareHouse Name
    [Arguments]   ${WarehouseName}
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_Name_FLD}
    input text    ${MD_SideMenu_Settings_Warehouse_Name_FLD}    ${WarehouseName}

Choose WareHouse Country
    [Arguments]   ${WarehouseCountry}
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_Country_DDP}
    click element    ${MD_SideMenu_Settings_Warehouse_Country_DDP}
    click element    xpath=//li[contains(text(),'${WarehouseCountry}')]

Choose WareHouse City by Entering City Name
    [Arguments]   ${CityName}
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_City_DDP}
    click element    ${MD_SideMenu_Settings_Warehouse_City_DDP}
    input text    ${CitySearch_Field}    ${CityName}
    press keys    ${CitySearch_Field}    RETURN

Choose WareHouseCity
    [Arguments]   ${WarehouseCity}
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_City_DDP}
    click element    ${MD_SideMenu_Settings_Warehouse_City_DDP}
    click element    xpath=//li[contains(text(),'${WarehouseCity}')]

Toggle WareHouse CashOnDelivey
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_PaymentOnReceive_BOX}
    click element    ${MD_SideMenu_Settings_Warehouse_PaymentOnReceive_BOX}

Toggle WareHouse IsPickUpOption
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_IsPickUpOption_BOX}
    click element    ${MD_SideMenu_Settings_Warehouse_IsPickUpOption_BOX}

Save WareHouse
    wait until element is visible    ${MD_SideMenu_Settings_Warehouse_Save_BTN}
    click element    ${MD_SideMenu_Settings_Warehouse_Save_BTN}


#Delete WareHouse2
#    [Arguments]   ${WarehouseName}
#    wait until element is visible    xpath=/html/body/div[8]/div[7]/button[2]
#    sleep    5s

Delete WareHouse
    [Arguments]   ${WarehouseName}
    wait until element is visible    xpath=//tr[descendant::a[text() = '${WarehouseName}']]//button
    click element    xpath=//tr[descendant::a[text() = '${WarehouseName}']]//button
    wait until element is visible    xpath=//button[contains(text(),'حذف')]
    click button    xpath=//button[contains(text(),'حذف')]
##################### SCENARIOS ############################


Add New Warehouse
    Click Add New Warehouse
    Enter WareHouse Name    WH1
    Choose WareHouse Country    البحرين
    sleep    2s
    Choose WareHouse City by Entering City Name    Bahrain
    Toggle WareHouse IsPickUpOption
    Toggle WareHouse CashOnDelivey
    Save WareHouse

Edit Warehouse
    Choose Warehouse to Modify    WH1
    Enter WareHouse Name     WH2
    Choose WareHouse Country  السعودية
    sleep    2s
    Choose WareHouse City by Entering City Name    الرياض
    Toggle WareHouse IsPickUpOption
    Toggle WareHouse CashOnDelivey
    Save WareHouse