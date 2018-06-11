*** Settings ***
Documentation    Account Page Reusable Keywords
Library  Selenium2Library
Library  OperatingSystem
Library  ../../../Utility/keyword_generator_classic.py
Resource  ../../common-methods.robot

*** Variables ***

# Locators for All Tabs
${Alltabs_btn_loc}  //img[@title='All Tabs']
${Account_tab_link_loc}  //img[@title='Accounts']

#  DetailLayout: Account Information section locators
${Account_detaillayout_Account_Information_Account_Owner_loc}  //label[text()='Account Owner']/following::div[1]
${Account_detaillayout_Account_Information_Rating_loc}  //label[text()='Rating']/following::div[1]
${Account_detaillayout_Account_Information_Account_Name_loc}  //label[text()='Account Name']/following::div[1]
${Account_detaillayout_Account_Information_Phone_loc}  //label[text()='Phone']/following::div[1]
${Account_detaillayout_Account_Information_Parent_Account_loc}  //label[text()='Parent Account']/following::div[1]
${Account_detaillayout_Account_Information_Fax_loc}  //label[text()='Fax']/following::div[1]
${Account_detaillayout_Account_Information_Account_Number_loc}  //label[text()='Account Number']/following::div[1]
${Account_detaillayout_Account_Information_Website_loc}  //label[text()='Website']/following::div[1]
${Account_detaillayout_Account_Information_Account_Site_loc}  //label[text()='Account Site']/following::div[1]
${Account_detaillayout_Account_Information_Ticker_Symbol_loc}  //label[text()='Ticker Symbol']/following::div[1]
${Account_detaillayout_Account_Information_Type_loc}  //label[text()='Type']/following::div[1]
${Account_detaillayout_Account_Information_Ownership_loc}  //label[text()='Ownership']/following::div[1]
${Account_detaillayout_Account_Information_Industry_loc}  //label[text()='Industry']/following::div[1]
${Account_detaillayout_Account_Information_Employees_loc}  //label[text()='Employees']/following::div[1]
${Account_detaillayout_Account_Information_Annual_Revenue_loc}  //label[text()='Annual Revenue']/following::div[1]
${Account_detaillayout_Account_Information_SIC_Code_loc}  //label[text()='SIC Code']/following::div[1]

#  DetailLayout: Address Information section locators
${Account_detaillayout_Address_Information_Billing_Street_loc}  //label[text()='Billing Street']/following::div[1]
${Account_detaillayout_Address_Information_Billing_City_loc}  //label[text()='Billing City']/following::div[1]
${Account_detaillayout_Address_Information_Billing_State/Province_loc}  //label[text()='Billing State/Province']/following::div[1]
${Account_detaillayout_Address_Information_Billing_Zip/Postal_Code_loc}  //label[text()='Billing Zip/Postal Code']/following::div[1]
${Account_detaillayout_Address_Information_Billing_Country_loc}  //label[text()='Billing Country']/following::div[1]
${Account_detaillayout_Address_Information_Billing_Address_loc}  //label[text()='Billing Address']/following::div[1]
${Account_detaillayout_Address_Information_Shipping_Street_loc}  //label[text()='Shipping Street']/following::div[1]
${Account_detaillayout_Address_Information_Shipping_City_loc}  //label[text()='Shipping City']/following::div[1]
${Account_detaillayout_Address_Information_Shipping_State/Province_loc}  //label[text()='Shipping State/Province']/following::div[1]
${Account_detaillayout_Address_Information_Shipping_Zip/Postal_Code_loc}  //label[text()='Shipping Zip/Postal Code']/following::div[1]
${Account_detaillayout_Address_Information_Shipping_Country_loc}  //label[text()='Shipping Country']/following::div[1]
${Account_detaillayout_Address_Information_Shipping_Address_loc}  //label[text()='Shipping Address']/following::div[1]

#  DetailLayout: Additional Information section locators
${Account_detaillayout_Additional_Information_Customer_Priority_loc}  //label[text()='Customer Priority']/following::div[1]
${Account_detaillayout_Additional_Information_SLA_loc}  //label[text()='SLA']/following::div[1]
${Account_detaillayout_Additional_Information_SLA_Expiration_Date_loc}  //label[text()='SLA Expiration Date']/following::div[1]
${Account_detaillayout_Additional_Information_SLA_Serial_Number_loc}  //label[text()='SLA Serial Number']/following::div[1]
${Account_detaillayout_Additional_Information_Number_of_Locations_loc}  //label[text()='Number of Locations']/following::div[1]
${Account_detaillayout_Additional_Information_Upsell_Opportunity_loc}  //label[text()='Upsell Opportunity']/following::div[1]
${Account_detaillayout_Additional_Information_Active_loc}  //label[text()='Active']/following::div[1]

#  DetailLayout: System Information section locators
${Account_detaillayout_System_Information_Created_By_loc}  //label[text()='Created By']/following::div[1]
${Account_detaillayout_System_Information_Created_By_loc}  //label[text()='Created By']/following::div[1]
${Account_detaillayout_System_Information_Last_Modified_By_loc}  //label[text()='Last Modified By']/following::div[1]
${Account_detaillayout_System_Information_Last_Modified_By_loc}  //label[text()='Last Modified By']/following::div[1]

#  DetailLayout: Description Information section locators
${Account_detaillayout_Description_Information_Description_loc}  //label[text()='Description']/following::div[1]

#  DetailLayout: Custom Links section locators

#  EditLayout: Account Information section locators
${Account_editlayout_Account_Information_Account_Owner_loc}  //label[text()='Account Owner']/following::img[1]
${Account_editlayout_Account_Information_Rating_loc}  //label[text()='Rating']/following::select[1]
${Account_editlayout_Account_Information_Account_Name_loc}  //label[text()='Account Name']/following::input[1]
${Account_editlayout_Account_Information_Phone_loc}  //label[text()='Phone']/following::input[1]
${Account_editlayout_Account_Information_Parent_Account_loc}  //label[text()='Parent Account']/following::img[1]
${Account_editlayout_Account_Information_Fax_loc}  //label[text()='Fax']/following::input[1]
${Account_editlayout_Account_Information_Account_Number_loc}  //label[text()='Account Number']/following::input[1]
${Account_editlayout_Account_Information_Website_loc}  //label[text()='Website']/following::input[1]
${Account_editlayout_Account_Information_Account_Site_loc}  //label[text()='Account Site']/following::input[1]
${Account_editlayout_Account_Information_Ticker_Symbol_loc}  //label[text()='Ticker Symbol']/following::input[1]
${Account_editlayout_Account_Information_Type_loc}  //label[text()='Type']/following::select[1]
${Account_editlayout_Account_Information_Ownership_loc}  //label[text()='Ownership']/following::select[1]
${Account_editlayout_Account_Information_Industry_loc}  //label[text()='Industry']/following::select[1]
${Account_editlayout_Account_Information_Employees_loc}  //label[text()='Employees']/following::input[1]
${Account_editlayout_Account_Information_Annual_Revenue_loc}  //label[text()='Annual Revenue']/following::input[1]
${Account_editlayout_Account_Information_SIC_Code_loc}  //label[text()='SIC Code']/following::input[1]

#  EditLayout: Address Information section locators
${Account_editlayout_Address_Information_Billing_Street_loc}  //label[text()='Billing Street']/following::textarea[1]
${Account_editlayout_Address_Information_Billing_City_loc}  //label[text()='Billing City']/following::input[1]
${Account_editlayout_Address_Information_Billing_State/Province_loc}  //label[text()='Billing State/Province']/following::input[1]
${Account_editlayout_Address_Information_Billing_Zip/Postal_Code_loc}  //label[text()='Billing Zip/Postal Code']/following::input[1]
${Account_editlayout_Address_Information_Billing_Country_loc}  //label[text()='Billing Country']/following::input[1]
${Account_editlayout_Address_Information_Billing_Address_loc}  //label[text()='Billing Address']/following::input[1]
${Account_editlayout_Address_Information_Shipping_Street_loc}  //label[text()='Shipping Street']/following::textarea[1]
${Account_editlayout_Address_Information_Shipping_City_loc}  //label[text()='Shipping City']/following::input[1]
${Account_editlayout_Address_Information_Shipping_State/Province_loc}  //label[text()='Shipping State/Province']/following::input[1]
${Account_editlayout_Address_Information_Shipping_Zip/Postal_Code_loc}  //label[text()='Shipping Zip/Postal Code']/following::input[1]
${Account_editlayout_Address_Information_Shipping_Country_loc}  //label[text()='Shipping Country']/following::input[1]
${Account_editlayout_Address_Information_Shipping_Address_loc}  //label[text()='Shipping Address']/following::input[1]

#  EditLayout: Additional Information section locators
${Account_editlayout_Additional_Information_Customer_Priority_loc}  //label[text()='Customer Priority']/following::select[1]
${Account_editlayout_Additional_Information_SLA_loc}  //label[text()='SLA']/following::select[1]
${Account_editlayout_Additional_Information_SLA_Expiration_Date_loc}  //label[text()='SLA Expiration Date']/following::input[1]
${Account_editlayout_Additional_Information_SLA_Serial_Number_loc}  //label[text()='SLA Serial Number']/following::input[1]
${Account_editlayout_Additional_Information_Number_of_Locations_loc}  //label[text()='Number of Locations']/following::input[1]
${Account_editlayout_Additional_Information_Upsell_Opportunity_loc}  //label[text()='Upsell Opportunity']/following::select[1]
${Account_editlayout_Additional_Information_Active_loc}  //label[text()='Active']/following::select[1]

#  EditLayout: Description Information section locators
${Account_editlayout_Description_Information_Description_loc}  //label[text()='Description']/following::textarea[1]

#  Contacts Related List Button locators
${Account_relSection_btn_Contacts_New_loc}  //h3[text()='Contacts']/following::input[@title='New']
${Account_relSection_btn_Contacts_Get_More_Contacts_loc}  //h3[text()='Contacts']/following::input[@title='Get More Contacts']
${Account_relSection_btn_Contacts_Merge_Contacts_loc}  //h3[text()='Contacts']/following::input[@title='Merge Contacts']
${Account_relSection_btn_Contacts_Add_to_Campaign_loc}  //h3[text()='Contacts']/following::input[@title='Add to Campaign']

#  Opportunities Related List Button locators
${Account_relSection_btn_Opportunities_New_loc}  //h3[text()='Opportunities']/following::input[@title='New']

#  Cases Related List Button locators
${Account_relSection_btn_Cases_New_loc}  //h3[text()='Cases']/following::input[@title='New']

#  Open Activities Related List Button locators
${Account_relSection_btn_Open_Activities_New_Task_loc}  //h3[text()='Open Activities']/following::input[@title='New Task']
${Account_relSection_btn_Open_Activities_New_Event_loc}  //h3[text()='Open Activities']/following::input[@title='New Event']
${Account_relSection_btn_Open_Activities_New_Meeting_Request_loc}  //h3[text()='Open Activities']/following::input[@title='New Meeting Request']

#  Activity History Related List Button locators
${Account_relSection_btn_Activity_History_Log_a_Call_loc}  //h3[text()='Activity History']/following::input[@title='Log a Call']
${Account_relSection_btn_Activity_History_Mail_Merge_loc}  //h3[text()='Activity History']/following::input[@title='Mail Merge']
${Account_relSection_btn_Activity_History_Send_an_Email_loc}  //h3[text()='Activity History']/following::input[@title='Send an Email']
${Account_relSection_btn_Activity_History_Compose_Gmail_loc}  //h3[text()='Activity History']/following::input[@title='Compose Gmail']
${Account_relSection_btn_Activity_History_Request_Update_loc}  //h3[text()='Activity History']/following::input[@title='Request Update']
${Account_relSection_btn_Activity_History_View_All_loc}  //h3[text()='Activity History']/following::input[@title='View All']

#  Notes & Attachments Related List Button locators
${Account_relSection_btn_Notes_&_Attachments_Upload_Files_loc}  //h3[text()='Notes & Attachments']/following::input[@title='Upload Files']

#  Partners Related List HAS NO Buttons

#  Account Page Button locators
${Account_pagebtn_Edit_loc}  //td[@class='pbButton']//input[@title='Edit']
${Account_pagebtn_Change_Owner_loc}  //td[@class='pbButton']//input[@title='Change Owner']
${Account_pagebtn_Change_Record_Type_loc}  //td[@class='pbButton']//input[@title='Change Record Type']
${Account_pagebtn_Delete_loc}  //td[@class='pbButton']//input[@title='Delete']
${Account_pagebtn_View_Account_Hierarchy_loc}  //td[@class='pbButton']//input[@title='View Account Hierarchy']
${Account_pagebtn_Sharing_loc}  //td[@class='pbButton']//input[@title='Sharing']
${Account_pagebtn_Include_Offline_loc}  //td[@class='pbButton']//input[@title='Include Offline']
${Account_pagebtn_Check_Integration_Status_loc}  //td[@class='pbButton']//input[@title='Check Integration Status']
${Account_pagebtn_View_Partner_Scorecard_loc}  //td[@class='pbButton']//input[@title='View Partner Scorecard']

*** Keywords ***

#  EditLayout: Account Information section keyword
AccountPage.Enter Editlayout Account Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Account Owner Edit']}' is not 'nan'  Select From LookUp  ${Account_editlayout_Account_Information_Account_Owner_loc}  ${testdata_row['Account Owner Edit']}
    run keyword if  '${testdata_row['Rating Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Account_Information_Rating_loc}  ${testdata_row['Rating Edit']}
    run keyword if  '${testdata_row['Account Name Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Account_Name_loc}  ${testdata_row['Account Name Edit']}
    run keyword if  '${testdata_row['Phone Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Phone_loc}  ${testdata_row['Phone Edit']}
    run keyword if  '${testdata_row['Parent Account Edit']}' is not 'nan'  Select From LookUp  ${Account_editlayout_Account_Information_Parent_Account_loc}  ${testdata_row['Parent Account Edit']}
    run keyword if  '${testdata_row['Fax Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Fax_loc}  ${testdata_row['Fax Edit']}
    run keyword if  '${testdata_row['Account Number Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Account_Number_loc}  ${testdata_row['Account Number Edit']}
    run keyword if  '${testdata_row['Website Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Website_loc}  ${testdata_row['Website Edit']}
    run keyword if  '${testdata_row['Account Site Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Account_Site_loc}  ${testdata_row['Account Site Edit']}
    run keyword if  '${testdata_row['Ticker Symbol Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Ticker_Symbol_loc}  ${testdata_row['Ticker Symbol Edit']}
    run keyword if  '${testdata_row['Type Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Account_Information_Type_loc}  ${testdata_row['Type Edit']}
    run keyword if  '${testdata_row['Ownership Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Account_Information_Ownership_loc}  ${testdata_row['Ownership Edit']}
    run keyword if  '${testdata_row['Industry Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Account_Information_Industry_loc}  ${testdata_row['Industry Edit']}
    run keyword if  '${testdata_row['Employees Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Employees_loc}  ${testdata_row['Employees Edit']}
    run keyword if  '${testdata_row['Annual Revenue Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_Annual_Revenue_loc}  ${testdata_row['Annual Revenue Edit']}
    run keyword if  '${testdata_row['SIC Code Edit']}' is not 'nan'  input text  ${Account_editlayout_Account_Information_SIC_Code_loc}  ${testdata_row['SIC Code Edit']}

#  EditLayout: Address Information section keyword
AccountPage.Enter Editlayout Address Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Billing Street Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Billing_Street_loc}  ${testdata_row['Billing Street Edit']}
    run keyword if  '${testdata_row['Billing City Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Billing_City_loc}  ${testdata_row['Billing City Edit']}
    run keyword if  '${testdata_row['Billing State/Province Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Billing_State/Province_loc}  ${testdata_row['Billing State/Province Edit']}
    run keyword if  '${testdata_row['Billing Zip/Postal Code Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Billing_Zip/Postal_Code_loc}  ${testdata_row['Billing Zip/Postal Code Edit']}
    run keyword if  '${testdata_row['Billing Country Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Billing_Country_loc}  ${testdata_row['Billing Country Edit']}
    run keyword if  '${testdata_row['Billing Address Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Billing_Address_loc}  ${testdata_row['Billing Address Edit']}
    run keyword if  '${testdata_row['Shipping Street Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Shipping_Street_loc}  ${testdata_row['Shipping Street Edit']}
    run keyword if  '${testdata_row['Shipping City Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Shipping_City_loc}  ${testdata_row['Shipping City Edit']}
    run keyword if  '${testdata_row['Shipping State/Province Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Shipping_State/Province_loc}  ${testdata_row['Shipping State/Province Edit']}
    run keyword if  '${testdata_row['Shipping Zip/Postal Code Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Shipping_Zip/Postal_Code_loc}  ${testdata_row['Shipping Zip/Postal Code Edit']}
    run keyword if  '${testdata_row['Shipping Country Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Shipping_Country_loc}  ${testdata_row['Shipping Country Edit']}
    run keyword if  '${testdata_row['Shipping Address Edit']}' is not 'nan'  input text  ${Account_editlayout_Address_Information_Shipping_Address_loc}  ${testdata_row['Shipping Address Edit']}

#  EditLayout: Additional Information section keyword
AccountPage.Enter Editlayout Additional Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Customer Priority Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Additional_Information_Customer_Priority_loc}  ${testdata_row['Customer Priority Edit']}
    run keyword if  '${testdata_row['SLA Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Additional_Information_SLA_loc}  ${testdata_row['SLA Edit']}
    run keyword if  '${testdata_row['SLA Expiration Date Edit']}' is not 'nan'  input text  ${Account_editlayout_Additional_Information_SLA_Expiration_Date_loc}  ${testdata_row['SLA Expiration Date Edit']}
    run keyword if  '${testdata_row['SLA Serial Number Edit']}' is not 'nan'  input text  ${Account_editlayout_Additional_Information_SLA_Serial_Number_loc}  ${testdata_row['SLA Serial Number Edit']}
    run keyword if  '${testdata_row['Number of Locations Edit']}' is not 'nan'  input text  ${Account_editlayout_Additional_Information_Number_of_Locations_loc}  ${testdata_row['Number of Locations Edit']}
    run keyword if  '${testdata_row['Upsell Opportunity Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Additional_Information_Upsell_Opportunity_loc}  ${testdata_row['Upsell Opportunity Edit']}
    run keyword if  '${testdata_row['Active Edit']}' is not 'nan'  Select From List By Value  ${Account_editlayout_Additional_Information_Active_loc}  ${testdata_row['Active Edit']}

#  EditLayout: Description Information section keyword
AccountPage.Enter Editlayout Description Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Description Edit']}' is not 'nan'  input text  ${Account_editlayout_Description_Information_Description_loc}  ${testdata_row['Description Edit']}


#  DetailLayout: Account Information section keyword
AccountPage.Click On Element in Account Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Account Owner' == ${element}  click element  ${Account_detaillayout_Account_Information_Account_Owner_loc}
    run keyword if  'Rating' == ${element}  click element  ${Account_detaillayout_Account_Information_Rating_loc}
    run keyword if  'Account Name' == ${element}  click element  ${Account_detaillayout_Account_Information_Account_Name_loc}
    run keyword if  'Phone' == ${element}  click element  ${Account_detaillayout_Account_Information_Phone_loc}
    run keyword if  'Parent Account' == ${element}  click element  ${Account_detaillayout_Account_Information_Parent_Account_loc}
    run keyword if  'Fax' == ${element}  click element  ${Account_detaillayout_Account_Information_Fax_loc}
    run keyword if  'Account Number' == ${element}  click element  ${Account_detaillayout_Account_Information_Account_Number_loc}
    run keyword if  'Website' == ${element}  click element  ${Account_detaillayout_Account_Information_Website_loc}
    run keyword if  'Account Site' == ${element}  click element  ${Account_detaillayout_Account_Information_Account_Site_loc}
    run keyword if  'Ticker Symbol' == ${element}  click element  ${Account_detaillayout_Account_Information_Ticker_Symbol_loc}
    run keyword if  'Type' == ${element}  click element  ${Account_detaillayout_Account_Information_Type_loc}
    run keyword if  'Ownership' == ${element}  click element  ${Account_detaillayout_Account_Information_Ownership_loc}
    run keyword if  'Industry' == ${element}  click element  ${Account_detaillayout_Account_Information_Industry_loc}
    run keyword if  'Employees' == ${element}  click element  ${Account_detaillayout_Account_Information_Employees_loc}
    run keyword if  'Annual Revenue' == ${element}  click element  ${Account_detaillayout_Account_Information_Annual_Revenue_loc}
    run keyword if  'SIC Code' == ${element}  click element  ${Account_detaillayout_Account_Information_SIC_Code_loc}

#  DetailLayout: Address Information section keyword
AccountPage.Click On Element in Address Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Billing Street' == ${element}  click element  ${Account_detaillayout_Address_Information_Billing_Street_loc}
    run keyword if  'Billing City' == ${element}  click element  ${Account_detaillayout_Address_Information_Billing_City_loc}
    run keyword if  'Billing State/Province' == ${element}  click element  ${Account_detaillayout_Address_Information_Billing_State/Province_loc}
    run keyword if  'Billing Zip/Postal Code' == ${element}  click element  ${Account_detaillayout_Address_Information_Billing_Zip/Postal_Code_loc}
    run keyword if  'Billing Country' == ${element}  click element  ${Account_detaillayout_Address_Information_Billing_Country_loc}
    run keyword if  'Billing Address' == ${element}  click element  ${Account_detaillayout_Address_Information_Billing_Address_loc}
    run keyword if  'Shipping Street' == ${element}  click element  ${Account_detaillayout_Address_Information_Shipping_Street_loc}
    run keyword if  'Shipping City' == ${element}  click element  ${Account_detaillayout_Address_Information_Shipping_City_loc}
    run keyword if  'Shipping State/Province' == ${element}  click element  ${Account_detaillayout_Address_Information_Shipping_State/Province_loc}
    run keyword if  'Shipping Zip/Postal Code' == ${element}  click element  ${Account_detaillayout_Address_Information_Shipping_Zip/Postal_Code_loc}
    run keyword if  'Shipping Country' == ${element}  click element  ${Account_detaillayout_Address_Information_Shipping_Country_loc}
    run keyword if  'Shipping Address' == ${element}  click element  ${Account_detaillayout_Address_Information_Shipping_Address_loc}

#  DetailLayout: Additional Information section keyword
AccountPage.Click On Element in Additional Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Customer Priority' == ${element}  click element  ${Account_detaillayout_Additional_Information_Customer_Priority_loc}
    run keyword if  'SLA' == ${element}  click element  ${Account_detaillayout_Additional_Information_SLA_loc}
    run keyword if  'SLA Expiration Date' == ${element}  click element  ${Account_detaillayout_Additional_Information_SLA_Expiration_Date_loc}
    run keyword if  'SLA Serial Number' == ${element}  click element  ${Account_detaillayout_Additional_Information_SLA_Serial_Number_loc}
    run keyword if  'Number of Locations' == ${element}  click element  ${Account_detaillayout_Additional_Information_Number_of_Locations_loc}
    run keyword if  'Upsell Opportunity' == ${element}  click element  ${Account_detaillayout_Additional_Information_Upsell_Opportunity_loc}
    run keyword if  'Active' == ${element}  click element  ${Account_detaillayout_Additional_Information_Active_loc}

#  DetailLayout: System Information section keyword
AccountPage.Click On Element in System Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Created By' == ${element}  click element  ${Account_detaillayout_System_Information_Created_By_loc}
    run keyword if  'Created By' == ${element}  click element  ${Account_detaillayout_System_Information_Created_By_loc}
    run keyword if  'Last Modified By' == ${element}  click element  ${Account_detaillayout_System_Information_Last_Modified_By_loc}
    run keyword if  'Last Modified By' == ${element}  click element  ${Account_detaillayout_System_Information_Last_Modified_By_loc}

#  DetailLayout: Description Information section keyword
AccountPage.Click On Element in Description Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Description' == ${element}  click element  ${Account_detaillayout_Description_Information_Description_loc}

#  DetailLayout: Custom Links section keyword
AccountPage.Click On Element in Custom Links Detaillayout
    [Arguments]  ${element}

# Keyword to click "Edit" top level page button
AccountPage.Click Edit Button
    click button  ${Account_pagebtn_Edit_loc}

# Keyword to click "Change Owner" top level page button
AccountPage.Click Change Owner Button
    click button  ${Account_pagebtn_Change_Owner_loc}

# Keyword to click "Change Record Type" top level page button
AccountPage.Click Change Record Type Button
    click button  ${Account_pagebtn_Change_Record_Type_loc}

# Keyword to click "Delete" top level page button
AccountPage.Click Delete Button
    click button  ${Account_pagebtn_Delete_loc}

# Keyword to click "View Account Hierarchy" top level page button
AccountPage.Click View Account Hierarchy Button
    click button  ${Account_pagebtn_View_Account_Hierarchy_loc}

# Keyword to click "Sharing" top level page button
AccountPage.Click Sharing Button
    click button  ${Account_pagebtn_Sharing_loc}

# Keyword to click "Include Offline" top level page button
AccountPage.Click Include Offline Button
    click button  ${Account_pagebtn_Include_Offline_loc}

# Keyword to click "Check Integration Status" top level page button
AccountPage.Click Check Integration Status Button
    click button  ${Account_pagebtn_Check_Integration_Status_loc}

# Keyword to click "View Partner Scorecard" top level page button
AccountPage.Click View Partner Scorecard Button
    click button  ${Account_pagebtn_View_Partner_Scorecard_loc}

# Keyword to navigate to Account Tab from AllTabs Page
AccountPage.Click On Account Tab
    click image  ${Alltabs_btn_loc}
    wait until page contains element  ${Account_tab_link_loc}
    click image  ${Account_tab_link_loc}

# keywords to click new button from Account Page
AccountPage.Click On New Button
    click button  //td[@class='pbButton']//input[@title='New']

# keywords to verify Account record created
AccountPage.Verify if Account is saved successfully
    wait until page contains element  //h2[contains(text(), 'Detail')]
    element should be visible  //h2[contains(text(), 'Detail')]
    Selenium2library.capture page screenshot  Accountscreen.png

# keywords to click record in a related list section
AccountPage.Click On Given Text In RelatedList Table
    [Arguments]  ${section}  ${text}  ${row}
    Click On Given Text In RelatedList Table  ${section}  ${text}  ${row}