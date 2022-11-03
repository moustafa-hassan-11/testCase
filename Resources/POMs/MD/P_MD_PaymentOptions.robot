*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
#################### GLOBAL VARIABLES #####################
${BANK_ACCOUNT_NAME} =    البنك
${IBAN} =    SA7189047829017480271849072104
${BANK_ACCOUNT_NUMBER} =    83920718497281974829174921
${Beneficiary_Name} =    Abdelrahman Tarek

######################## LOCATORS ##########################
${Add_New_BankAccount_BTN} =    xpath= //button[text()='إضافة حساب جديد']
${Bank_Account_Name_DDB} =    xpath= //div[@id='bank_id_chosen']/a
${Bank_Account_Name_Search_FIELD} =    xpath= //div[@id='bank_id_chosen']//div[@class="chosen-search"]/input
${Bank_Account_Name_Option} =    xpath//div[@id='bank_id_chosen']//li[contains(text(),'${BANK_ACCOUNT_NAME}')]
${Bank_Account_Number_FIELD} =    account_number
${IBAN_FIELD} =    iban
${Beneficiary_Name_FIELD} =    beneficiary_name
${Add_Bank_Account_BTN} =    order-inventory-address-selected

*** Keywords ***
####################### ACTIONS ##########################

Click Add New Bank Account
    scroll element into view    ${Add_New_BankAccount_BTN}
    wait until element is visible    ${Add_New_BankAccount_BTN}
    click button    ${Add_New_BankAccount_BTN}

Expand Bank Names DropDown
    wait until element is visible    ${Bank_Account_Name_DDB}
    click link    ${Bank_Account_Name_DDB}
Choose Bank by Entering Bank Name
    wait until element is visible    ${Bank_Account_Name_Search_FIELD}
    input text    ${Bank_Account_Name_Search_FIELD}    ${BANK_ACCOUNT_NAME}
    press keys    ${Bank_Account_Name_Search_FIELD}    RETURN
Enter Bank Account Number
    wait until element is visible    ${Bank_Account_Number_FIELD}
    input text    ${Bank_Account_Number_FIELD}    ${BANK_ACCOUNT_NUMBER}
Enter IBAN
    wait until element is visible    ${IBAN_FIELD}
    input text    ${IBAN_FIELD}    ${IBAN}
Enter Beneficiary Name
    wait until element is visible    ${Beneficiary_Name_FIELD}
    input text    ${Beneficiary_Name_FIELD}    ${Beneficiary_Name}
Submit Adding Bank
    wait until element is visible    ${Add_Bank_Account_BTN}
    click button    ${Add_Bank_Account_BTN}

Add New Bank Account
    Click Add New Bank Account
    Expand Bank Names DropDown
    Choose Bank by Entering Bank Name
    Enter Bank Account Number
    Enter IBAN
    Enter Beneficiary Name
    Submit Adding Bank