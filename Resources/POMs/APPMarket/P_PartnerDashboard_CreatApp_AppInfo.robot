*** Settings ***
Documentation
Library    SeleniumLibrary
#Resource   ../../Resources/TestData/Images

*** Variables ***
#################### GLOBAL VARIABLES #####################


######################## LOCATORS ##########################
${RedirectionUrl} =    https://www.google.com/
${RedirectionUrlField} =    installation_url
${ImgDirectory} =    ../../Resources/TestData/Images
${uploadIconBtn} =    icon
${LongDescriptionField} =    xpath=//*[@id="update-form"]/div/div/div[3]/div[2]/div/div[4]/div/div[2]/div[1]/div/div[2]/div[6]
#${LongDescriptionField} =    //div[@class='EasyMDEContainer']    #can't locate it    //div/pre/span
${LongDescription} =    Long description Long description
${shortDescriptionField} =    //textarea[@id='short_description']
${shortDescription} =    short description
${ReadyForProductionCheckBox} =    //input[@id='subscribe']
${saveAppBtn} =    //div[@class='ml-auto']
${alert-successMsg} =    //div[@class='alert alert-success']



*** Keywords ***
####################### ACTIONS ##########################
EnterRedirectionUrl
    Scroll Element Into View    ${RedirectionUrlField}
    input text    ${RedirectionUrlField}    ${RedirectionUrl}
uploadAppIcon
    choose file    ${uploadIconBtn}    ${ImgDirectory}
EnterAppLongDescription
    Scroll Element Into View    ${LongDescriptionField}
    click element    ${LongDescriptionField}
    press keys    ${LongDescriptionField}    L+O+N+G+ +D+E+S+C+R+I+P+T+I+O+N+ +A+W+I
#    input text    ${LongDescriptionField}    ${LongDescription}    #InvalidElementStateException: Message: invalid element state
EnterAppshortDescription
    input text    ${shortDescriptionField}    ${shortDescription}
    sleep    5s  # to insert the long desc manualy for now
ClickReadyForProductionCheckBox
    Scroll Element Into View    ${ReadyForProductionCheckBox}
    select checkbox    ${ReadyForProductionCheckBox}
ClicksaveAppBtn
    Scroll Element Into View    ${saveAppBtn}
    click element    ${saveAppBtn}
    wait until element is visible    ${alert-successMsg}



