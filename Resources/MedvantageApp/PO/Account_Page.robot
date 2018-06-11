*** Settings ***
Documentation    Account Page Functionalities
Library  Selenium2Library
Library  OperatingSystem
Resource   ${EXECDIR}/Resources/common-variables.robot
Resource  ${EXECDIR}/Resources/commonn-methods.robot
Library  ${EXECDIR}/Utility/NameDatetime.py

*** Variables ***
# Place holder for all locators in Account Page
${Alltabs_btn_loc}  //img[@title='All Tabs']
${Accounts_Tab_loc}  //img[@title='Accounts']
${New_Button_loc}  //input[@name='new']
${Record_Type_select_loc}  //label[contains(text(),'Record Type of new record')]/following::select
${Save_Button_loc}  //input[@title='Save']
${Save&New_Button_loc}  //input[@title='Save & New']
${Cancel_Button_loc}  //input[@title='Cancel']
${Continue_btn_loc}  //input[@value='Continue']
${WindowName}    Search ~ Salesforce - Unlimited Edition


#Account Information Section


${Account_Number_Txtbox_loc}  //label[contains(text(),'Account Number')]/following::input
${Account_Name_Txtbox_loc}  //label[contains(text(),'Account Name')]/following::input
${Parent_Account_lookup_loc}  Parent Account
${FAX_Txtbox_Loc}  //label[contains(text(),'Fax')]/following::input
${Rating_select_loc}  //label[contains(text(),'Rating')]/following::select
${Phone_Txtbox_loc}  //label[contains(text(),'Phone')]/following::input
${website_Txtbox_loc}  //label[contains(text(),'Website')]/following::input
${Annual_revenue_Txtbox_loc}  //label[contains(text(),'Email Address')]/following::input
${Email_Address_Txtbox_loc}  //label[contains(text(),'Email Address')]/following::input
${Type_select_loc}  //label[contains(text(),'Type')]/following::select
${Preferred_Shipping_Method_Select_loc}  //label[contains(text(),'Preferred Shipping Method')]/following::select
${IDN_lookup_loc}  //label[contains(text(),'IDN')]/following::img[1]
${Depot_Queue_Txtbox_loc}  //label[contains(text(),'Depot Queue Id')]/following::input[1]
${Description_Txtbox_loc}  //label[contains(text(),'Description')]/following::textarea[1]

#Address Information Section
${Billing_Street_Txtbox_loc}  //label[contains(text(),'Billing Street')]/following::input
${Billing_City_Txtbox_loc}  //label[contains(text(),'Billing City')]/following::input
${Billing_State_Txtbox_loc}    statxpath=//label[contains(text(),'Billing State/Province')]/following::input
${Billing_Zip_Txtbox_loc}  //label[contains(text(),'Billing Zip/Postal Code')]/following::input
${Billing_Country_Txtbox_loc}  //label[contains(text(),'Billing Country')]/following::input
${Account_site_Txtbox_loc}  //label[contains(text(),'Account Site')]/following::input
${Shipping_street_Txtbox_loc}  //label[contains(text(),'Shipping Street')]/following::input
${Shipping_city_Txtbox_loc}  //label[contains(text(),'Shipping City')]/following::input
${Shipping_state_Txtbox_loc}  //label[contains(text(),'Shipping State/Province')]/following::input
${Shipping_Zip_Txtbox_loc}  //label[contains(text(),'Shipping Zip/Postal Code')]/following::input
${Shipping_Country_Txtbox_loc}  //label[contains(text(),'Shipping Country')]/following::input

#Additional Information Section

${Customer_Priority_Select_loc}  //label[contains(text(),'Customer Priority')]/following::select
${Active_Select_loc}  //label[contains(text(),'Active')]/following::select
${Ownership_Select_loc}  //label[contains(text(),'Ownership')]/following::select
${Number_of_Locations_Txtbox_loc}  //label[contains(text(),'Number of Locations')]/following::input

#lookup window
${Search_Select_Loc}    id=lkrsch

${Go_Btn_Loc}  //input[@title='Go!']


#Account Detail page

${Account_Detail_header_Loc}  //h2[contains(text(),'Account Detail')]
*** Keywords ***

Click on Accounts TAB
    click image  ${Alltabs_btn_loc}
    wait until page contains element  ${Accounts_Tab_loc}
    click image  ${Accounts_Tab_loc}


Enter Account Information Section
    [Arguments]  ${testdata_row}

    wait until page contains element  ${New_Button_loc}
    click button  ${New_Button_loc}
    log to console  ${testdata_row['Record_Type']}
    select from list by label  ${Record_Type_select_loc}  ${testdata_row['Record_Type']}
    click button  ${Continue_btn_loc}
    wait until page contains element  ${Account_Number_Txtbox_loc}
    log to console  ${testdata_row['Account_Number']}
    run keyword if  '${testdata_row['Account_Number']}' is not 'nan'  input text  ${Account_Number_Txtbox_loc}  ${testdata_row['Account_Number']}
    log to console  ${testdata_row['Account_Name']}
    ${account_name}=  mytime  ${testdata_row['Account_Name']}
    input text  ${Account_Name_Txtbox_loc}  ${account_name}
    log to console  ${testdata_row['Parent_Account']}
    run keyword if  '${testdata_row['Parent_Account']}' is not 'nan'  Select From LookUp  ${Parent_Account_lookup_loc}  ${testdata_row['Parent_Account']}
      #wait until page contains element  ${vaal_from_Accounts_Loc}
      #click button    ${val_from_Accounts_Loc}

    log to console  ${testdata_row['FAX']}
    run keyword if  '${testdata_row['FAX']}' is not 'nan'  input text  ${FAX_Txtbox_Loc}  ${testdata_row['FAX']}
    log to console  ${testdata_row['Rating']}
    run keyword if  '${testdata_row['Rating']}' is not 'nan'  Select From List By Value  ${Rating_select_loc}  ${testdata_row['Rating']}
    log to console  ${testdata_row['Phone']}
    input text  ${Phone_Txtbox_loc}  ${testdata_row['Phone']}
    log to console  ${testdata_row['website']}
    run keyword if  '${testdata_row['website']}' is not 'nan'  input text  ${website_Txtbox_loc}  ${testdata_row['website']}
    log to console  ${testdata_row['Annual_revenue']}
    run keyword if  '${testdata_row['Annual_revenue']}' is not 'nan'  input text  ${Annual_revenue_Txtbox_loc}  ${testdata_row['Annual_revenue']}
    log to console  ${testdata_row['Email']}
    run keyword if  '${testdata_row['Email']}' is not 'nan'  input text  ${Email_Address_Txtbox_loc}  ${testdata_row['Email']}
    log to console  ${testdata_row['Type']}
    run keyword if  '${testdata_row['Type']}' is not 'nan'  Select From List By Value  ${Type_select_loc}  ${testdata_row['Type']}
    log to console  ${testdata_row['Preferred_Shipping_Method']}
    run keyword if  '${testdata_row['Preferred_Shipping_Method']}' is not 'nan'  Select From List By Value  ${Preferred_Shipping_Method_Select_loc}  ${testdata_row['Preferred_Shipping_Method']}
#    :IF  '${testdata_row['IDN']}' is not 'nan'
#    \  click button  ${IDN_lookup_loc}
#    \  input text  ${Search_Select_Loc}  ${testdata_row['IDN']}
#    \  Select Window  title=${WindowName}
#    \  click button  ${Go_Btn_Loc}
#    \  wait until page contains element  ${val_from_IDN_Loc}
#    \  click button    ${val_from_IDN_Loc}


    log to console  ${testdata_row['Depot_Queue']}
    run keyword if  '${testdata_row['Depot_Queue']}' is not 'nan'  input text  ${Depot_Queue_Txtbox_loc}  ${testdata_row['Depot_Queue']}
    log to console  ${testdata_row['Description']}
    run keyword if  '${testdata_row['Description']}' is not 'nan'  Select From List By Value  ${Description_Txtbox_loc}  ${testdata_row['Description']}


Enter Address Information Section

    [Arguments]  ${testdata_row}
    log to console  ${testdata_row['Billing_Street']}
    run keyword if  '${testdata_row['Billing_Street']}' is not 'nan'  input text  ${Billing_Street_Txtbox_loc}  ${testdata_row['Billing_Street']}
    log to console  ${testdata_row['Billing_City']}
    run keyword if  '${testdata_row['Billing_City']}' is not 'nan'  input text  ${Billing_City_Txtbox_loc}  ${testdata_row['Billing_City']}
    log to console  ${testdata_row['Billing_State']}
    run keyword if  '${testdata_row['Billing_State']}' is not 'nan'  input text  ${Billing_State_Txtbox_loc}  ${testdata_row['Billing_State']}
    log to console  ${testdata_row['Billing_Zip']}
    run keyword if  '${testdata_row['Billing_Zip']}' is not 'nan'  input text  ${Billing_Zip_Txtbox_loc}  ${testdata_row['Billing_Zip']}
    log to console  ${testdata_row['Account_site']}
    run keyword if  '${testdata_row['Account_site']}' is not 'nan'  input text  ${Account_site_Txtbox_loc}  ${testdata_row['Account_site']}
    log to console  ${testdata_row['Shipping_street']}
    run keyword if  '${testdata_row['Shipping_street']}' is not 'nan'  input text  ${Shipping_street_Txtbox_loc}  ${testdata_row['Shipping_street']}
    log to console  ${testdata_row['Shipping_city']}
    run keyword if  '${testdata_row['Shipping_city']}' is not 'nan'  input text  ${Shipping_city_Txtbox_loc}  ${testdata_row['Shipping_city']}
    log to console  ${testdata_row['Shipping_state']}
    run keyword if  '${testdata_row['Shipping_state']}' is not 'nan'  input text  ${Shipping_state_Txtbox_loc}  ${testdata_row['Shipping_state']}
    log to console  ${testdata_row['Shipping_Zip']}
    run keyword if  '${testdata_row['Shipping_Zip']}' is not 'nan'  input text  ${Shipping_Zip_Txtbox_loc}  ${testdata_row['Shipping_Zip']}
    log to console  ${testdata_row['Shipping_Country']}
    run keyword if  '${testdata_row['Shipping_Country']}' is not 'nan'  input text  ${Shipping_Country_Txtbox_loc}  ${testdata_row['Shipping_Country']}


Enter Additional Information Section
    [Arguments]  ${testdata_row}
    log to console  ${testdata_row['Customer_Priority']}
    run keyword if  '${testdata_row['Customer_Priority']}' is not 'nan'  Select From List By Value  ${Customer_Priority_Select_loc}  ${testdata_row['Customer_Priority']}
    log to console  ${testdata_row['Active_Value']}
    run keyword if  '${testdata_row['Active_Value']}' is not 'nan'  Select From List By Value  ${Active_Select_loc}  ${testdata_row['Active_Value']}
    log to console  ${testdata_row['Ownership_Value']}
    run keyword if  '${testdata_row['Ownership_Value']}' is not 'nan'  Select From List By Value  ${Ownership_Select_loc}  ${testdata_row['Ownership_Value']}
    log to console  ${testdata_row['Number_of_Locations']}
    run keyword if  '${testdata_row['Number_of_Locations']}' is not 'nan'  input text  ${Number_of_Locations_Txtbox_loc}  ${testdata_row['Number_of_Locations']}

Click On Save
   click button    ${Save_Button_loc}

Verify account is saved
  wait until page contains element  ${Account_Detail_header_Loc}
  variable should exist  ${Account_Detail_header_Loc}
  Selenium2library.capture page screenshot  Accountscreen.png

Lookup Values selection
    [Arguments]  ${testdata_row}  ${LOC of Lookup}
    click button  ${LOC of Lookup}
    Select Window  title=${WindowName}
    input text  ${Search_Select_Loc}  ${testdata_row['Parent_Account']}
    click button  ${Go_Btn_Loc}