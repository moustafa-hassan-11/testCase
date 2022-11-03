*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${APPStatus} =    3    # reject=2 / publish=3 / unpublish=4
${AdminNotes} =    well done
${AppStatusDropdown} =    //select[@name='listing_status']
${AdminNotesField} =    //textarea[@name='admin_notes']
${UpdateVisibilityBtn} =    //button[normalize-space()='Update Visibility']




*** Keywords ***
####################### ACTIONS ##########################
ChangeAppStatusByAdmin

    scroll element into view    ${AppStatusDropdown}
    select from list by value    ${AppStatusDropdown}    ${APPStatus}    #publish the app
    input text    ${AdminNotesField}    ${AdminNotes}
    click element    ${UpdateVisibilityBtn}




