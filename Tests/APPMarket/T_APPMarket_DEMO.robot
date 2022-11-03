*** Settings ***
Documentation   Registration Script

Resource    ../../Resources/Common.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_AdminAppInfo.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_AppsMangement.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_CreatApp_AppInfo.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_CreatAppPage1.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_Login.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_SidebarMenu.robot
Resource    ../../Resources/POMs/AppMarket/P_PartnerDashboard_ِApps.robot

Test Setup  Start WebTest
Test Teardown   End WebTest

#    robot -d results/AppMarket tests/DemoTests/T_AppMarket_DEMO.robot
*** Variables ***

*** Test Cases ***
PublishAppByAdminE2E
    [Documentation]  This E2E PublishAppByAdminE2E.robot
    [Tags]  DEMO
  #Login to the PD
    p_partnerdashboard_login.goto pd loginpage
    p_partnerdashboard_login.enter email
    P_PartnerDashboard_Login.Enter Password
    p_partnerdashboard_login.click login
  #Create New App
    P_PartnerDashboard_ِApps.ClickCreatNewAPP
    P_PartnerDashboard_CreatAppPage1.EnterAppName
    P_PartnerDashboard_CreatAppPage1.EnterAppUrl
    P_PartnerDashboard_CreatAppPage1.SelectAppType
    P_PartnerDashboard_CreatAppPage1.EnterAppCallBackUrl
    P_PartnerDashboard_CreatAppPage1.ClickCreatAppBtn
    P_PartnerDashboard_CreatApp_AppInfo.EnterRedirectionUrl
    #P_PartnerDashboard_CreatApp_AppInfo.uploadAppIcon
    P_PartnerDashboard_CreatApp_AppInfo.EnterAppLongDescription
    P_PartnerDashboard_CreatApp_AppInfo.EnterAppshortDescription
    P_PartnerDashboard_CreatApp_AppInfo.ClickReadyForProductionCheckBox
    P_PartnerDashboard_CreatApp_AppInfo.ClicksaveAppBtn

  #Go to the Apps Management page
    P_PartnerDashboard_SidebarMenu.ClickAppsManagement
  #Publish the app by admin
    P_PartnerDashboard_AppsMangement.SearchForAppByName
    P_PartnerDashboard_AdminAppInfo.ChangeAppStatusByAdmin
  #Verify the app is Listed
    P_PartnerDashboard_SidebarMenu.ClickAppsManagement
    P_PartnerDashboard_AppsMangement.VerifyAppStatus

