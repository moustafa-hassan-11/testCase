*** Settings ***
############# Libraries ###########
Documentation
Resource    ../../Resources/POMs/MD/P_MD_Login.robot
Resource    ../../Resources/POMs/MD/P_MD_SideMenu.robot
Resource    ../../Resources/Common.robot
Resource    ../../Resources/POMs/ZidShip/P_ZidShip_Dashboard.robot
Resource    ../../Resources/POMs/ZidShip/P_ZidShip_Activation_P1.robot
Resource    ../../Resources/POMs/ZidShip/P_ZidShip_Activation_P2.robot
Resource    ../../Resources/POMs/ZidShip/P_ZidShip_Activation_P3.robot
Resource    ../../Resources/POMs/ZidShip/P_ZidShip_Activation_P4.robot


Test Setup    Start WebTest
Test Teardown    End WebTest

*** Variables ***

############# Global Variables ###########

*** Test Cases ***
Zidship
    [Documentation]    Smoke Test for Zidship
    [Setup]    Start WebTest    MD    ${MD_Testing_URL}
    [Tags]    Smoke
    P_MD_Login.LoginToMD
    P_MD_SideMenu.GoTo ZidShipDashboard
    P_ZidShip_Dashboard.GoTo ZidShipActivationPage
    P_ZidShip_Activation_P1.Enter P1 Activation Details
    P_ZidShip_Activation_P2.Enter P2 Activation Details
    P_ZidShip_Activation_P3.Enter P3 Activation Details
    P_ZidShip_Activation_P4.Finish Activation
    sleep    5s

