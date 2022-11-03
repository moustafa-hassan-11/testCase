*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${NoOfTransactions_btn}    xpath=(.//div[@class='ecbd034a']//button)[1]
${VolumeOfTransactions_btn}    xpath=(.//div[@class='ecbd034a']//button)[2]
${ListOfBanks_btn}    xpath=.//div[@class='dd2a0131 _4814ca2c']//button
${NoOfTransaction}    xpath=.//div[contains(text(),'50-200 عملية')]
${VolumeOfTransactions}    xpath=.//div[contains(text(),'7,000 - 14,000 ريال')]
${BankAccounts_btn}    xpath=.//button[./span[contains(text(),'اختر الحساب البنكي')]]
${FirstBankAccountOnList}    xpath=.//div[@class='_6ce71ae5 e279cbe1 aab4f354 _51d20fc9']/div[1]
${BankAccountOwnerInArabicMsg}    xpath=.//div[@class='ade08c5f']/div[./*]
${UpdateAccountName_input}    xpath=.//div[@class='ad1c0c62']/input
${NewEnglishName}    English Name
${ConditionsAndTerms_CB}    xpath=.//div[@class='a9d9f8af']//input[@type='checkbox']
${Activation_btn}    xpath=.//div[@class='a9d9f8af']/button
*** Keywords ***
Choose Number Of Transactions
    wait until element is visible    ${NOOFTRANSACTIONS_BTN}
    scroll element into view    ${NOOFTRANSACTIONS_BTN}
    click button    ${NoOfTransactions_btn}
    wait until element is visible    ${NoOfTransaction}
    click element    ${NoOfTransaction}
Choose Volume Of Transactions
    scroll element into view    ${volumeoftransactions_btn}
    click button    ${volumeoftransactions_btn}
    wait until element is visible    ${volumeoftransactions}
    click element    ${volumeoftransactions}
Choose The Bank Account
    scroll element into view    ${BankAccounts_btn}
    click button    ${BankAccounts_btn}
    wait until element is visible    ${FirstBankAccountOnList}
    click element    ${FirstBankAccountOnList}
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   ${BankAccountOwnerInArabicMsg}
    Run Keyword If    ${IsElementVisible}  INPUT TEXT    ${UpdateAccountName_input}    ${NewEnglishName}
AcceptTermsAndContions
   scroll element into view    ${ConditionsAndTerms_CB}
   wait until element is visible    ${conditionsandterms_cb}
   element attribute value should be    ${ConditionsAndTerms_CB}    value    false
   click element    ${ConditionsAndTerms_CB}
Click On Activation Button
    wait until element is visible    ${activation_btn}
    click element    ${activation_btn}


