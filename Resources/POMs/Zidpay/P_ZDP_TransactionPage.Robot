*** Settings ***
Documentation    First Test Suite
Library    SeleniumLibrary
*** Variables ***
${AllTransactionsTap}    //*[@id="app"]/div/div[3]/div[3]/div/div[3]/button[1]
${SuccessfulTransactionsTap}    //*[@id="app"]/div/div[3]/div[3]/div/div[3]/button[2]
${FailedTransactionsTap}    //*[@id="app"]/div/div[3]/div[3]/div/div[3]/button[3]
${RefundedTransactionsTap}    //*[@id="app"]/div/div[3]/div[3]/div/div[3]/button[4]
${FirstTransactionOnList}    //*[@id="app"]/div/div[3]/div[3]/div/div[4]/table/tbody[1]/tr/td[9]/a/span
*** Keywords ***
Navigating to Transactions Taps
    [Arguments]    ${TapName}
  wait until element is visible    ${TapName}
  scroll element into view    ${TapName}
  click element    ${TapName}

Click On First Transaction Details Button
    wait until element is visible    ${FirstTransactionOnList}
    click element    ${FirstTransactionOnList}
