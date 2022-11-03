*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/POMs/MD/P_MD_Settings.robot
Resource    ../../Resources/POMs/MD/P_MD_Settings_StoreSettings.robot
Resource    ../../Resources/Common.robot
Test Setup    Start WebTest
Test Teardown    End WebTest
*** Variables ***

*** Test Cases ***
VerifyThatStoreSettingIsCompeleted
    [Documentation]    VerifyThatStoreSettingIsCompeleted
    P_MD_Login.LoginToMD
    P_MD_SideMenu.GoTo SettingsPage
    P_MD_Settings.GoTo Store Settings
    P_MD_Settings_StoreSettings.Filling Store Settings
