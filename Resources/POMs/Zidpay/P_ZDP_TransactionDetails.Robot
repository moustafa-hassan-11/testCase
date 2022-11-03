*** Settings ***
Documentation    First Test Suite
Library    SeleniumLibrary
*** Variables ***
${RefundButton}     xpath=.//div[@class='ebe74547']//button[1]
${2ndRefundButton}    xpath=.//div[@class='_7dda079f']//button[@class='_4c527786 _143d192b d991e1f8']
${GetFullRefundValue}    xpath=.//input[@type='number']
${RefundedAmountField}    xpath=.//div[@class='b2f11e67']/input
${ChangeRefundAmount}    xpath=.//div[@class='b2f11e67']/span
${ConfirmationButton}    xpath=.//footer/button[1]
*** Keywords ***
Full Refund
  wait until element is visible    ${RefundButton}
  scroll element into view    ${refundbutton}
  click button    ${refundbutton}
  scroll element into view    ${2ndRefundButton}
  click button    ${2ndRefundButton}
  click button    ${ConfirmationButton}
  wait until element is visible    xpath=.//DIV[@CLASS="ade08c5f"]
  ELEMENT SHOULD CONTAIN    xpath=.//DIV[@CLASS="ade08c5f"]    تمت عملية الاسترداد بنجاح
Partial Refund
  wait until element is visible    ${refundbutton}
  scroll element into view    ${refundbutton}
  click button    ${refundbutton}
  scroll element into view    ${2ndRefundButton}
  ${TotalRefundValue}    get value    ${GetFullRefundValue}
  ${TotalRefundValue} =    evaluate     ${TotalRefundValue}/2
  click element    ${ChangeRefundAmount}
  clear element text    ${refundedamountfield}
  INPUT TEXT    ${RefundedAmountField}    ${TotalRefundValue}
  click button    ${2ndRefundButton}
  click button    ${ConfirmationButton}
  wait until element is visible    xpath=.//DIV[@CLASS="ade08c5f"]
  ELEMENT SHOULD CONTAIN    xpath=.//DIV[@CLASS="ade08c5f"]    تمت عملية الاسترداد بنجاح