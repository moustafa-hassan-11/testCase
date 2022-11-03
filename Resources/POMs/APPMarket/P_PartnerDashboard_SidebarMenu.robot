*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${PD_SideMenu_AppsMangement} =    //span[normalize-space()='Apps Management']
#${PD_AppsManagement_SearchBox} =    //input[@type='search']    #Assertion



*** Keywords ***
####################### ACTIONS ##########################
ClickAppsManagement
    click element    ${PD_SideMenu_AppsMangement}  #OR (//li[@class="sidebar-menu-item"])[6]
    wait until page contains    Apps Management




