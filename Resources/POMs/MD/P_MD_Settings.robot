*** Settings ***
Documentation
Library    SeleniumLibrary
*** Variables ***
${StoreSettingsPage}    xpath=.//a[./img[@src='/img/settings/store.svg']]
*** Keywords ***
GoTo Store Settings

    wait until page contains element    ${StoreSettingsPage}
    click element    ${StoreSettingsPage}