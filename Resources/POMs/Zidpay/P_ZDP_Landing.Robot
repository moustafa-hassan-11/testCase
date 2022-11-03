*** Settings ***
Documentation    First Test Suite
Library    SeleniumLibrary
*** Variables ***
${ZidpayTitle}    class=_0a514bdf
${TransactionsPage}    //*[@id="app"]/div/div[3]/div[3]/div[2]/div/header/a
${AfterActivationMsg}    xpath=.//div[@class='ade08c5f']
*** Keywords ***
Navigating to Page
    [Arguments]    ${Pagename}
   scroll element into view    ${Pagename}
  wait until element is visible    ${Pagename}
  click element    ${Pagename}
Verify that Activation is done successfully
    wait until element is visible    ${AfterActivationMsg}
    page should contain    يمكنك الآن استقبال عمليات الدفع الإلكترونى عن طريق



