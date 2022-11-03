*** Settings ***
Documentation
Library    SeleniumLibrary
*** Variables ***

#################### GLOBAL VARIABLES ##########################

######################## LOCATORS ##########################
${NOW_SL_ChkBox}=    xpath= //div[./span='الآن']//ancestor::tr/td[1]//div
${NOW_SL_ExpandBtn}=    xpath= //div[./span='الآن']//ancestor::tr//button
${FAST_SL_ChkBox}=    xpath= //div[./span='سريع']//ancestor::tr/td[1]//div
${FAST_SL_ExpandBtn}=    xpath= //div[./span='سريع']//ancestor::tr//button
${NO_RUSH_SL_ChkBox}=    xpath= //div[./span='عادي']//ancestor::tr/td[1]//div
${NO_RUSH_SL_ExpandBtn}=    xpath= //div[./span='عادي']//ancestor::tr//button
${GCC_SL_ChkBox}=    xpath= //div[./span='الخليج']//ancestor::tr/td[1]//div
${GCC_SL_ExpandBtn}=    xpath= //div[./span='الخليج']//ancestor::tr//button
${COLD1_ChkBox}=    xpath= //div[./span='مبرد 1 - الوزن إلى 10 كيلوجرام']//ancestor::tr/td[1]//div
${COLD1_ExpandBtn}=    xpath= //div[./span='مبرد 1 - الوزن إلى 10 كيلوجرام']//ancestor::tr//button
${Aramex_GCC_Drop_off_SL_ChkBox}=    xpath= //div[./span='بوليصات أرامكس الخليج - تسليم الفرع']//ancestor::tr/td[1]//div
${Aramex_GCC_Drop_off_SL_ExpandBtn}=    xpath= //div[./span='بوليصات أرامكس الخليج - تسليم الفرع']//ancestor::tr//button
${Aramex_Drop_off_SL_ChkBox}=    xpath= //div[./span='بوليصات - أرامكس تسليم للفرع']//ancestor::tr/td[1]//div
${Aramex_Drop_off_SL_ExpandBtn}=    xpath= //div[./span='بوليصات - أرامكس تسليم للفرع']//ancestor::tr//button
${SMSA_Drop_off_SL_ChkBox}=    xpath= //div[./span='بوليصات - سمسا تسليم للفرع']//ancestor::tr/td[1]//div
${SMSA_Drop_off_SL_ExpandBtn}=    xpath= //div[./span='بوليصات - سمسا تسليم للفرع']//ancestor::tr//button
${SAUDI_POST_Drop_off_SL_ChkBox}=    xpath= //div[./span='بوليصات - البريد السعودي تسليم للفرع']//ancestor::tr/td[1]//div
${SAUDI_POST_Drop_off_SL_ExpandBtn}=    xpath= //div[./span='بوليصات - البريد السعودي تسليم للفرع']//ancestor::tr//button

${Next_BTN} =    xpath= //button[./span='التالي']
${Back_BTN} =    xpath= //button[./span='السابق']

*** Keywords ***

########################## ACTIONS ##############################

ZidshipActivation Toggle FAST SL
    wait until page contains element    ${FAST_SL_ChkBox}    10
    click element    ${FAST_SL_ChkBox}


ZidshipActivation Toggle NO RUSH SL
    wait until page contains element    ${NO_RUSH_SL_ChkBox}    10
    click element    ${NO_RUSH_SL_ChkBox}


ZidshipActivation Toggle GCC SL
    wait until page contains element    ${GCC_SL_ChkBox}    10
    click element    ${GCC_SL_ChkBox}


ZidshipActivation Toggle COLD1 SL
    wait until page contains element    ${COLD1_ChkBox}    10
    click element    ${COLD1_ChkBox}


ZidshipActivation Toggle Aramex_GCC_Drop_off SL
    wait until page contains element    ${Aramex_GCC_Drop_off_SL_ChkBox}    10
    click element    ${Aramex_GCC_Drop_off_SL_ChkBox}


ZidshipActivation Toggle Aramex_Drop_off SL
    wait until page contains element    ${Aramex_Drop_off_SL_ChkBox}    10
    click element    ${Aramex_Drop_off_SL_ChkBox}


ZidshipActivation Toggle SMSA_Drop_off SL
    wait until page contains element    ${SMSA_Drop_off_SL_ChkBox}    10
    click element    ${SMSA_Drop_off_SL_ChkBox}


ZidshipActivation Toggle SAUDI_POST_Drop_off SL
    wait until page contains element    ${SAUDI_POST_Drop_off_SL_ChkBox}    10
    click element    ${SAUDI_POST_Drop_off_SL_ChkBox}


ZidshipActivation Expand/Collapse FAST SL
    wait until page contains element    ${FAST_SL_ExpandBtn}    10
    click element    ${FAST_SL_ExpandBtn}


ZidshipActivation Expand/Collapse NO RUSH SL
    wait until page contains element    ${NO_RUSH_SL_ExpandBtn}    10
    click element    ${NO_RUSH_SL_ExpandBtn}


ZidshipActivation Expand/Collapse GCC SL
    wait until page contains element    ${GCC_SL_ExpandBtn}    10
    click element    ${GCC_SL_ExpandBtn}


ZidshipActivation Expand/Collapse COLD1 SL
    wait until page contains element    ${COLD1_ExpandBtn}    10
    click element    ${COLD1_ExpandBtn}


ZidshipActivation Expand/Collapse Aramex_GCC_Drop_off SL
    wait until page contains element    ${Aramex_GCC_Drop_off_SL_ExpandBtn}    10
    click element    ${Aramex_GCC_Drop_off_SL_ExpandBtn}


ZidshipActivation Expand/Collapse Aramex_Drop_off SL
    wait until page contains element    ${Aramex_Drop_off_SL_ExpandBtn}    10
    click element    ${Aramex_Drop_off_SL_ExpandBtn}


ZidshipActivation Expand/Collapse SMSA_Drop_off SL
    wait until page contains element    ${SMSA_Drop_off_SL_ExpandBtn}    10
    click element    ${SMSA_Drop_off_SL_ExpandBtn}


ZidshipActivation Expand/Collapse SAUDI_POST_Drop_off SL
    wait until page contains element    ${SAUDI_POST_Drop_off_SL_ExpandBtn}    10
    click element    ${SAUDI_POST_Drop_off_SL_ExpandBtn}


ZidshipActivation Proceed to 4th Activation Page
    wait until element is enabled    ${Next_BTN}    10
    click button    ${Next_BTN}


######################### SCENARIOS ############################

Enter P3 Activation Details
    ZidshipActivation Toggle FAST SL
    ZidshipActivation Toggle NO RUSH SL
    ZidshipActivation Toggle GCC SL
    ZidshipActivation Toggle COLD1 SL
    ZidshipActivation Toggle Aramex_GCC_Drop_off SL
    ZidshipActivation Toggle Aramex_Drop_off SL
    ZidshipActivation Toggle SMSA_Drop_off SL
    ZidshipActivation Toggle SAUDI_POST_Drop_off SL
    ZidshipActivation Expand/Collapse FAST SL
    ZidshipActivation Expand/Collapse FAST SL
    ZidshipActivation Expand/Collapse NO RUSH SL
    ZidshipActivation Expand/Collapse NO RUSH SL
    ZidshipActivation Expand/Collapse GCC SL
    ZidshipActivation Expand/Collapse GCC SL
    ZidshipActivation Expand/Collapse COLD1 SL
    ZidshipActivation Expand/Collapse COLD1 SL
    ZidshipActivation Expand/Collapse Aramex_GCC_Drop_off SL
    ZidshipActivation Expand/Collapse Aramex_GCC_Drop_off SL
    ZidshipActivation Expand/Collapse Aramex_Drop_off SL
    ZidshipActivation Expand/Collapse Aramex_Drop_off SL
    ZidshipActivation Expand/Collapse SMSA_Drop_off SL
    ZidshipActivation Expand/Collapse SMSA_Drop_off SL
    ZidshipActivation Expand/Collapse SAUDI_POST_Drop_off SL
    ZidshipActivation Expand/Collapse SAUDI_POST_Drop_off SL
    ZidshipActivation Proceed to 4th Activation Page