*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${AppListingStatus} =    Listed     #Listed/In review/Unpublished/Rejected
${AppListingStatusField} =    //table//tbody//tr//td[2]    #the listing status of the first search result app
${PD_AppsManagement_SearchBox} =    //input[@type='search']
${AppName} =    1AaggamyTestz
${FirstSearchResult} =    (//table//tbody[@class='list']//tr//td[1])[1]




*** Keywords ***
####################### ACTIONS ##########################
SearchForAppByName

    input text    ${PD_AppsManagement_SearchBox}    ${AppName}     #${AppName}
    click element    ${FirstSearchResult}    #it will always click on the first search result
    wait until page contains    App Meta

VerifyAppStatus
    input text    ${PD_AppsManagement_SearchBox}    ${AppName}
    element text should be    ${AppListingStatusField}    ${AppListingStatus}




