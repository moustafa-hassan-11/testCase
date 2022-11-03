*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${ActivateZidpay_Btn}    xpath=.//div[@class="bc430fd7"]/button
${ActivateZidpayAndDisableOtherNetworks}    xpath=.//div[@id='app']//footer/button[1]
*** Keywords ***
Click On Activate Zidpay Now
    wait until element is visible    ${activatezidpay_btn}
    scroll element into view    ${activatezidpay_btn}
    click button    ${activatezidpay_btn}
    sleep  2s
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   ${ActivateZidpayAndDisableOtherNetworks}
    Run Keyword If    ${IsElementVisible}  CLICK ELEMENT    ${ActivateZidpayAndDisableOtherNetworks}

