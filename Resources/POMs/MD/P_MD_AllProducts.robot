*** Settings ***
Library    SeleniumLibrary

*** Variables ***

############################################# Products Page  ###########################################################
${Products_BTN}    //span[text()="المنتجات"]
${AllProducts_BTN}    //span[text()="جميع المنتجات"]

${ImportProducts_BTN}    //span[text()="استيراد المنتجات"]
${AddNewProduct_BTN}    //a[text()="إضافة منتج جديد"]
##################################################### Import Products ##################################################
${Download_BTN}     //a[text()="تحميل"]
${Upload_BTN}  //span[text()="رفع"]
${Attach_Field}  //main//div[2]//input
${Replace_Checkbox}    //div[text()="إستبدال المنتجات الحالية بالمنتجات الجديدة"]//label
${Update_Price_Checkbox}    //div[text()="تحديث أسعار المنتجات الحالية فقط"]//label
${Update_Quantity_Checkbox}    //div[text()="تحديث كميّات المنتجات الحالية فقط"]//label
${Update_PriceAndQuantity_Checkbox}    //div[text()="تحديث أسعار وكميّات المنتجات الحالية فقط"]//label
${Import_BTN}    //span[text()="استيراد المنتجات"]
${Video_Link}    //a[text()="شرح فيديو للمساعدة"]
##################################################### Sorting ##########################################################
${ManualSorting_BTN}    //a[text()="ترتيب يدوي"]
${Search_ForArrange_Field}    //input[@placeholder="بحث"]
${Save_BTN}    //button[contains(text(),"حفظ")]
${CancelArrangement_BTN}    //button[contains(text(),"الغاء الترتيب اليدوي")]
############################################## Filteration & Search ####################################################
${Filter_BTN}    //span[text()="تصفية المنتجات"]
${PublishOnStore_DDB}    //label[text()="النشر على المتجر"]//following-sibling::select
${StoreAvailability_DDB}    //label[text()="المخزون"]//following-sibling::select

${Search_Field}    //input[@placeholder="بحث"]
################################################ Delete & Export Products ##############################################
${DeleteProducts_BTN}    //span[text()="حذف المنتجات"]
${Check_AllProducts_Checkbox}    //input[@id="checkbox-0"]//parent::div

${ExportProducts_BTN}    //span[text()="تصدير جميع المنتجات"]
${Confirm_BTN}    //span[text()="تأكيد"]
${CancelExport_BTN}    //span[text()="إلغاء"]
########################################################################################################################
${ArabicName_Field}    //input[@id="input-name-ar"]
${EnglishName_Field}    //input[@id="input-name-en"]
${ArabicName_BTN}    //a[text()="عربي"]
${EnglishName_BTN}    //a[text()="English"]

${ProductPrice_Field}    //input[@id="price"]
${Discount_Checkbox}    //span[contains(text(),"تخفيض")]//preceding-sibling::label/span
${Discount_Field}      //input[@id="sale_price"]

${Weight_Field}      //label[contains(text(),"الوزن")]//following-sibling::span//input

${Quantity_Field}    //input[@id="add-form-stock"]
${Unlimited_Quantity_Checkbox}    //span[contains(text(),"غير محدودة")]//preceding-sibling::label/span

${ProductCost_Field}    //input[@name="cost"]

${PublishOnStore_BTN}    //label[contains(text(),"النشر على المتجر")]/following-sibling::label/span
${ShipPingProduct_Hint_Icon}    //label[contains(text(),"المنتج يتطلب شحن")]//i
${Ship_Product_BTN}    //label[contains(text(),"المنتج يتطلب شحن")]//parent::label//following-sibling::label//span
${SaveProduct_BTN}    //div[@class="pageheader__additionalcontent"]//button[contains(text(),"حفظ")]

*** Keywords ***

################################################ Side Menu : Products ##################################################
Open AllProducts Page
    click element    ${Products_BTN}
    #click element    ${AllProducts_BTN}
    sleep    3s
############################################# Import & Create New Product ##############################################

Import Products
    click element    ${importproducts_btn}

Download The Form
    click element    ${download_btn}
    sleep    2s

Upload The Form
    click element    ${upload_btn}    #not completed
    sleep    2s

Attach Image Folder Link
    click element    ${attach_field}

Replace New Products with Current Products
    click element    ${replace_checkbox}

Update Only Price of Current Products
    click element    ${update_price_checkbox}

Update Only Quantity of Current Products
    click element    ${update_quantity_checkbox}

Update Only Quantity and Price of Current Products
    click link    ${update_priceandquantity_checkbox}

Confirm Import
    click element    ${import_btn}

Run Help Video
    click link    ${video_link}

###################################################### New Product #####################################################

click New Product
    click element    ${addnewproduct_btn}
    wait until page contains    إضافة منتج جديد
###################################################### Sorting #########################################################
##########################Need help
Manual Sorting
    click element    ${manualsorting_btn}
Drag Product for Arrangement
    [Arguments]    ${Product}
    click element    //div[contains(text(),"${Product}")] //following-sibling::div[2] //i
Numbering Product for Arrangement
    [Arguments]    ${Product}    ${Number}
    input text    //div[contains(text(),"${Product}")] //following-sibling::div//input    ${Number}
Search Product for eArrangement
    [Arguments]    ${Product}
    input text    ${search_forarrange_field}    ${Product}
Save Arrangement
    click element    ${Save_BTN}
Cancel Arrangement
    click element    ${CancelArrangement_BTN}

################################################## Filteration & Search ################################################

Filter Products by Publishing on Store
    [Arguments]     ${Status}
    click element    ${filter_btn}
    click element    ${PublishOnStore_DDB}
    click element    //option[text()="${Status}"]
    click element    ${filter_btn}

Filter Products by Store Availability
    [Arguments]     ${Status}
    click element    ${filter_btn}
    click element    ${StoreAvailability_DDB}
    click element    //option[text()="${Status}"]
    click element    ${filter_btn}

Filter Products by the Two Filters
    [Arguments]    ${Filter1}    ${Filter2}
    click element    ${filter_btn}
    click element    ${PublishOnStore_DDB}
    click element    //option[text()="${Filter1}"]
    click element    ${StoreAvailability_DDB}
    click element    //option[text()="${Filter2}"]
    click element    ${filter_btn}

Search For Product
    [Arguments]    ${Product}
    input text    ${search_field}    ${product}
    wait until element is visible    //a[text()="${Product}"]

################################################# Delete & Export ######################################################
Select All Products
    click element    ${check_allproducts_checkbox}

Select Product
    [Arguments]    ${Product}
    click element    //a[text()="${Product}"]//parent::td//preceding-sibling::td//div

Delete Selected Products
    wait until element is enabled    ${deleteproducts_btn}
    click element    ${deleteproducts_btn}

Confirm Delete
    wait until element is visible    ${confirm_btn}
    click element    ${confirm_btn}
    wait until element is visible    //h2[text()="المنتجات"]

ExportProducts
    click element    ${exportproducts_btn}

Confirm Export
    wait until element is visible    ${confirm_btn}
    click element    ${confirm_btn}

##################################################### Sorting ##########################################################
Arrange Ascendingly
    [Arguments]    ${Title}
    click element    //span[text()="${Title}"]//following-sibling::div//span[1]
    sleep    5s

Arrange Descendingly
    [Arguments]    ${Title}
    click element    //span[text()="${Title}"]//following-sibling::div//span[2]
    sleep    5s

################################################ Product Actions #######################################################
Open Product
    [Arguments]    ${Product}
    click link    //a[text()="${Product}"]//parent::td//preceding-sibling::td[1]//a

Update Product
    [Arguments]    ${Product}
    click link    //a[text()="${Product}"]//ancestor::tr//td[8]//a[text()="تعديل"]
    wait until page contains    تعديل المنتج

Delete Product
    [Arguments]    ${Product}
    click element    //a[text()="${Product}"]//ancestor::tr//td[8]//span
    click element    ${confirm_btn}

################################################### Page Number ########################################################
Change the Page
    [Arguments]    ${Page_Number}
    click button    //button[text()="${Page_Number}"]

########################################################################################################################
Enter Arabic_Name
    [Arguments]    ${ArabicName}
    input text     ${ArabicName_Field}    ${ArabicName}

Enter English_Name
    [Arguments]    ${EnglishName}
    click element    ${englishname_btn}
    wait until element is visible    ${EnglishName_Field}
    input text     ${EnglishName_Field}    ${EnglishName}

Enter Product Price
    [Arguments]    ${Price}
    input text    ${ProductPrice_Field}    ${Price}

Product Discount
    [Arguments]    ${Discount}
    click element    ${discount_checkbox}
    wait until element is visible     ${discount_field}
    input text    ${discount_field}    ${Discount}

Enter Product Weight
    [Arguments]    ${Weight}
    input text    ${weight_field}    ${Weight}

Publish Product On Store
    click element    ${PublishOnStore_BTN}

Ship the Product
    click element    ${ship_product_btn}


Enter Product Quantity
    [Arguments]    ${Quantity}
    input text  ${Quantity_Field}    ${Quantity}

Select Unlimited Quantity
    click element    ${Unlimited_Quantity_Checkbox}

Enter Product Cost
    [Arguments]    ${Cost}
    input text    ${productcost_field}    ${Cost}

Save the Product
    click button    ${SaveProduct_BTN}

Verify success adding
    wait until element is visible    xpath=//div[contains(text(),"تم حفظ المنتج بنجاح")]    10s


















