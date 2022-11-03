*** Settings ***
Documentation
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/POMs/MD/P_MD_Warehouse.robot
Resource    ../../Resources/Common.robot

Test Setup    Start WebTest
Test Teardown    End WebTest

*** Variables ***

#${WarehouseName} =    WHTEST
#${WarehouseCountry} =    عمان
#${WarehouseCity} =    Al Ghazir

*** Test Cases ***
#
#AddNewWarehouseTest
#    P_MD_Login.LoginToMD
#    P_MD_SideMenu.GoTo SettingsPage
#    P_MD_Warehouse.GoTo WarehousePage
#    P_MD_Warehouse.Add NewWarehouse                 WH1    السعودية    الرياض
##    P_MD_Warehouse.Add NewWarehouse                 WH1    البحرين    Bahrain
#    P_MD_Warehouse.Check WareHouseIsPickUpOption
#    P_MD_Warehouse.Check WareHousePaymentOnReceive
#    P_MD_Warehouse.Save WareHouse
#
#ModifyWarehouseTest
#    P_MD_Login.LoginToMD
#    P_MD_SideMenu.GoTo SettingsPage
#    P_MD_Warehouse.GoTo WarehousePage
#    P_MD_Warehouse.Modify WareHouse    WH1
#    P_MD_Warehouse.Modify WareHouseName     WH2
#    P_MD_Warehouse.Modify WareHouseCountry  السعودية
#    P_MD_Warehouse.Modify WareHouseCity    الرياض
#    P_MD_Warehouse.Check WareHouseIsPickUpOption
#    P_MD_Warehouse.Check WareHousePaymentOnReceive
#    P_MD_Warehouse.Save WareHouse

DeleteWareHouse Test
    P_MD_Login.LoginToMD
    P_MD_SideMenu.GoTo SettingsPage
    P_MD_Warehouse.GoTo WarehousePage
    P_MD_Warehouse.Delete WareHouse    WH2
    sleep    5s