*** Settings ***
Documentation    Lead Page Reusable Keywords
Library  Selenium2Library
Library  OperatingSystem
Library  ../../../Utility/keyword_generator_lightning.py
Resource  ../../common-methods.robot
Library  ../../../Utility/datepicker.py

*** Variables ***

#  DetailLayout: Lead Information section locators
${Lead_detaillayout_Lead_Information_Lead_Owner_loc}  //label[text()='Lead Owner']/following::div[1]
${Lead_detaillayout_Lead_Information_Phone_loc}  //label[text()='Phone']/following::div[1]
${Lead_detaillayout_Lead_Information_Salutation_loc}  //label[text()='Salutation']/following::div[1]
${Lead_detaillayout_Lead_Information_First_Name_loc}  //label[text()='First Name']/following::div[1]
${Lead_detaillayout_Lead_Information_Last_Name_loc}  //label[text()='Last Name']/following::div[1]
${Lead_detaillayout_Lead_Information_Name_loc}  //label[text()='Name']/following::div[1]
${Lead_detaillayout_Lead_Information_Mobile_loc}  //label[text()='Mobile']/following::div[1]
${Lead_detaillayout_Lead_Information_Company_loc}  //label[text()='Company']/following::div[1]
${Lead_detaillayout_Lead_Information_Fax_loc}  //label[text()='Fax']/following::div[1]
${Lead_detaillayout_Lead_Information_Title_loc}  //label[text()='Title']/following::div[1]
${Lead_detaillayout_Lead_Information_Email_loc}  //label[text()='Email']/following::div[1]
${Lead_detaillayout_Lead_Information_Lead_Source_loc}  //label[text()='Lead Source']/following::div[1]
${Lead_detaillayout_Lead_Information_Website_loc}  //label[text()='Website']/following::div[1]
${Lead_detaillayout_Lead_Information_Industry_loc}  //label[text()='Industry']/following::div[1]
${Lead_detaillayout_Lead_Information_Lead_Status_loc}  //label[text()='Lead Status']/following::div[1]
${Lead_detaillayout_Lead_Information_Annual_Revenue_loc}  //label[text()='Annual Revenue']/following::div[1]
${Lead_detaillayout_Lead_Information_Rating_loc}  //label[text()='Rating']/following::div[1]
${Lead_detaillayout_Lead_Information_No._of_Employees_loc}  //label[text()='No. of Employees']/following::div[1]

#  DetailLayout: Address Information section locators
${Lead_detaillayout_Address_Information_Street_loc}  //label[text()='Street']/following::div[1]
${Lead_detaillayout_Address_Information_City_loc}  //label[text()='City']/following::div[1]
${Lead_detaillayout_Address_Information_State/Province_loc}  //label[text()='State/Province']/following::div[1]
${Lead_detaillayout_Address_Information_Zip/Postal_Code_loc}  //label[text()='Zip/Postal Code']/following::div[1]
${Lead_detaillayout_Address_Information_Country_loc}  //label[text()='Country']/following::div[1]
${Lead_detaillayout_Address_Information_Address_loc}  //label[text()='Address']/following::div[1]

#  DetailLayout: Additional Information section locators
${Lead_detaillayout_Additional_Information_Product_Interest_loc}  //label[text()='Product Interest']/following::div[1]
${Lead_detaillayout_Additional_Information_Current_Generator(s)_loc}  //label[text()='Current Generator(s)']/following::div[1]
${Lead_detaillayout_Additional_Information_SIC_Code_loc}  //label[text()='SIC Code']/following::div[1]
${Lead_detaillayout_Additional_Information_Primary_loc}  //label[text()='Primary']/following::div[1]
${Lead_detaillayout_Additional_Information_Number_of_Locations_loc}  //label[text()='Number of Locations']/following::div[1]

#  DetailLayout: System Information section locators
${Lead_detaillayout_System_Information_Created_By_loc}  //label[text()='Created By']/following::div[1]
${Lead_detaillayout_System_Information_Created_By_loc}  //label[text()='Created By']/following::div[1]
${Lead_detaillayout_System_Information_Last_Modified_By_loc}  //label[text()='Last Modified By']/following::div[1]
${Lead_detaillayout_System_Information_Last_Modified_By_loc}  //label[text()='Last Modified By']/following::div[1]

#  DetailLayout: Description Information section locators
${Lead_detaillayout_Description_Information_Description_loc}  //label[text()='Description']/following::div[1]

#  EditLayout: Lead Information section locators
${Lead_editlayout_Lead_Information_Lead_Owner_loc}  //label[text()='Lead Owner']/following::img[1]
${Lead_editlayout_Lead_Information_Phone_loc}  //label[text()='Phone']/following::input[1]
${Lead_editlayout_Lead_Information_Salutation_loc}  //label[text()='Salutation']/following::select[1]
${Lead_editlayout_Lead_Information_First_Name_loc}  //label[text()='First Name']/following::input[1]
${Lead_editlayout_Lead_Information_Last_Name_loc}  //label[text()='Last Name']/following::input[1]
${Lead_editlayout_Lead_Information_Name_loc}  //label[text()='Name']/following::input[1]
${Lead_editlayout_Lead_Information_Mobile_loc}  //label[text()='Mobile']/following::input[1]
${Lead_editlayout_Lead_Information_Company_loc}  //label[text()='Company']/following::input[1]
${Lead_editlayout_Lead_Information_Fax_loc}  //label[text()='Fax']/following::input[1]
${Lead_editlayout_Lead_Information_Title_loc}  //label[text()='Title']/following::input[1]
${Lead_editlayout_Lead_Information_Email_loc}  //label[text()='Email']/following::input[1]
${Lead_editlayout_Lead_Information_Lead_Source_loc}  //label[text()='Lead Source']/following::select[1]
${Lead_editlayout_Lead_Information_Website_loc}  //label[text()='Website']/following::input[1]
${Lead_editlayout_Lead_Information_Industry_loc}  //label[text()='Industry']/following::select[1]
${Lead_editlayout_Lead_Information_Lead_Status_loc}  //label[text()='Lead Status']/following::select[1]
${Lead_editlayout_Lead_Information_Annual_Revenue_loc}  //label[text()='Annual Revenue']/following::input[1]
${Lead_editlayout_Lead_Information_Rating_loc}  //label[text()='Rating']/following::select[1]
${Lead_editlayout_Lead_Information_No._of_Employees_loc}  //label[text()='No. of Employees']/following::input[1]

#  EditLayout: Address Information section locators
${Lead_editlayout_Address_Information_Street_loc}  //label[text()='Street']/following::textarea[1]
${Lead_editlayout_Address_Information_City_loc}  //label[text()='City']/following::input[1]
${Lead_editlayout_Address_Information_State/Province_loc}  //label[text()='State/Province']/following::input[1]
${Lead_editlayout_Address_Information_Zip/Postal_Code_loc}  //label[text()='Zip/Postal Code']/following::input[1]
${Lead_editlayout_Address_Information_Country_loc}  //label[text()='Country']/following::input[1]
${Lead_editlayout_Address_Information_Address_loc}  //label[text()='Address']/following::input[1]

#  EditLayout: Additional Information section locators
${Lead_editlayout_Additional_Information_Product_Interest_loc}  //label[text()='Product Interest']/following::select[1]
${Lead_editlayout_Additional_Information_Current_Generator(s)_loc}  //label[text()='Current Generator(s)']/following::input[1]
${Lead_editlayout_Additional_Information_SIC_Code_loc}  //label[text()='SIC Code']/following::input[1]
${Lead_editlayout_Additional_Information_Primary_loc}  //label[text()='Primary']/following::select[1]
${Lead_editlayout_Additional_Information_Number_of_Locations_loc}  //label[text()='Number of Locations']/following::input[1]

#  EditLayout: Description Information section locators
${Lead_editlayout_Description_Information_Description_loc}  //label[text()='Description']/following::textarea[1]

#  Open Activities Related List Button locators
${Lead_relSection_btn_Open_Activities_New_Task_loc}  //h3[text()='Open Activities']/following::input[@title='New Task']
${Lead_relSection_btn_Open_Activities_New_Event_loc}  //h3[text()='Open Activities']/following::input[@title='New Event']
${Lead_relSection_btn_Open_Activities_New_Meeting_Request_loc}  //h3[text()='Open Activities']/following::input[@title='New Meeting Request']

#  Activity History Related List Button locators
${Lead_relSection_btn_Activity_History_Log_a_Call_loc}  //h3[text()='Activity History']/following::input[@title='Log a Call']
${Lead_relSection_btn_Activity_History_Mail_Merge_loc}  //h3[text()='Activity History']/following::input[@title='Mail Merge']
${Lead_relSection_btn_Activity_History_Send_an_Email_loc}  //h3[text()='Activity History']/following::input[@title='Send an Email']
${Lead_relSection_btn_Activity_History_Compose_Gmail_loc}  //h3[text()='Activity History']/following::input[@title='Compose Gmail']
${Lead_relSection_btn_Activity_History_Request_Update_loc}  //h3[text()='Activity History']/following::input[@title='Request Update']
${Lead_relSection_btn_Activity_History_View_All_loc}  //h3[text()='Activity History']/following::input[@title='View All']

#  Campaign History Related List Button locators
${Lead_relSection_btn_Campaign_History_Add_to_Campaign_loc}  //h3[text()='Campaign History']/following::input[@title='Add to Campaign']

#  HTML Email Status Related List HAS NO Buttons

#  Lead Page Button locators

*** Keywords ***

#  EditLayout: Lead Information section keyword
LeadPage.Enter Editlayout Lead Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Lead Owner Edit']}' is not 'nan'  Select From LookUp  ${Lead_editlayout_Lead_Information_Lead_Owner_loc}  ${testdata_row['Lead Owner Edit']}
    run keyword if  '${testdata_row['Phone Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Phone_loc}  ${testdata_row['Phone Edit']}
    run keyword if  '${testdata_row['Salutation Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Lead_Information_Salutation_loc}  ${testdata_row['Salutation Edit']}
    run keyword if  '${testdata_row['First Name Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_First_Name_loc}  ${testdata_row['First Name Edit']}
    run keyword if  '${testdata_row['Last Name Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Last_Name_loc}  ${testdata_row['Last Name Edit']}
    run keyword if  '${testdata_row['Name Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Name_loc}  ${testdata_row['Name Edit']}
    run keyword if  '${testdata_row['Mobile Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Mobile_loc}  ${testdata_row['Mobile Edit']}
    run keyword if  '${testdata_row['Company Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Company_loc}  ${testdata_row['Company Edit']}
    run keyword if  '${testdata_row['Fax Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Fax_loc}  ${testdata_row['Fax Edit']}
    run keyword if  '${testdata_row['Title Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Title_loc}  ${testdata_row['Title Edit']}
    run keyword if  '${testdata_row['Email Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Email_loc}  ${testdata_row['Email Edit']}
    run keyword if  '${testdata_row['Lead Source Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Lead_Information_Lead_Source_loc}  ${testdata_row['Lead Source Edit']}
    run keyword if  '${testdata_row['Website Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Website_loc}  ${testdata_row['Website Edit']}
    run keyword if  '${testdata_row['Industry Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Lead_Information_Industry_loc}  ${testdata_row['Industry Edit']}
    run keyword if  '${testdata_row['Lead Status Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Lead_Information_Lead_Status_loc}  ${testdata_row['Lead Status Edit']}
    run keyword if  '${testdata_row['Annual Revenue Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Annual_Revenue_loc}  ${testdata_row['Annual Revenue Edit']}
    run keyword if  '${testdata_row['Rating Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Lead_Information_Rating_loc}  ${testdata_row['Rating Edit']}
    run keyword if  '${testdata_row['No. of Employees Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_No._of_Employees_loc}  ${testdata_row['No. of Employees Edit']}

#  EditLayout: Address Information section keyword
LeadPage.Enter Editlayout Address Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Street Edit']}' is not 'nan'  input text  ${Lead_editlayout_Address_Information_Street_loc}  ${testdata_row['Street Edit']}
    run keyword if  '${testdata_row['City Edit']}' is not 'nan'  input text  ${Lead_editlayout_Address_Information_City_loc}  ${testdata_row['City Edit']}
    run keyword if  '${testdata_row['State/Province Edit']}' is not 'nan'  input text  ${Lead_editlayout_Address_Information_State/Province_loc}  ${testdata_row['State/Province Edit']}
    run keyword if  '${testdata_row['Zip/Postal Code Edit']}' is not 'nan'  input text  ${Lead_editlayout_Address_Information_Zip/Postal_Code_loc}  ${testdata_row['Zip/Postal Code Edit']}
    run keyword if  '${testdata_row['Country Edit']}' is not 'nan'  input text  ${Lead_editlayout_Address_Information_Country_loc}  ${testdata_row['Country Edit']}
    run keyword if  '${testdata_row['Address Edit']}' is not 'nan'  input text  ${Lead_editlayout_Address_Information_Address_loc}  ${testdata_row['Address Edit']}

#  EditLayout: Additional Information section keyword
LeadPage.Enter Editlayout Additional Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Product Interest Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Additional_Information_Product_Interest_loc}  ${testdata_row['Product Interest Edit']}
    run keyword if  '${testdata_row['Current Generator(s) Edit']}' is not 'nan'  input text  ${Lead_editlayout_Additional_Information_Current_Generator(s)_loc}  ${testdata_row['Current Generator(s) Edit']}
    run keyword if  '${testdata_row['SIC Code Edit']}' is not 'nan'  input text  ${Lead_editlayout_Additional_Information_SIC_Code_loc}  ${testdata_row['SIC Code Edit']}
    run keyword if  '${testdata_row['Primary Edit']}' is not 'nan'  Select From List By Value  ${Lead_editlayout_Additional_Information_Primary_loc}  ${testdata_row['Primary Edit']}
    run keyword if  '${testdata_row['Number of Locations Edit']}' is not 'nan'  input text  ${Lead_editlayout_Additional_Information_Number_of_Locations_loc}  ${testdata_row['Number of Locations Edit']}

#  EditLayout: Description Information section keyword
LeadPage.Enter Editlayout Description Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Description Edit']}' is not 'nan'  input text  ${Lead_editlayout_Description_Information_Description_loc}  ${testdata_row['Description Edit']}


#  DetailLayout: Lead Information section keyword
LeadPage.Click On Element in Lead Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Lead Owner' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Lead_Owner_loc}
    run keyword if  'Phone' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Phone_loc}
    run keyword if  'Salutation' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Salutation_loc}
    run keyword if  'First Name' == ${element}  click element  ${Lead_detaillayout_Lead_Information_First_Name_loc}
    run keyword if  'Last Name' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Last_Name_loc}
    run keyword if  'Name' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Name_loc}
    run keyword if  'Mobile' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Mobile_loc}
    run keyword if  'Company' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Company_loc}
    run keyword if  'Fax' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Fax_loc}
    run keyword if  'Title' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Title_loc}
    run keyword if  'Email' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Email_loc}
    run keyword if  'Lead Source' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Lead_Source_loc}
    run keyword if  'Website' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Website_loc}
    run keyword if  'Industry' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Industry_loc}
    run keyword if  'Lead Status' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Lead_Status_loc}
    run keyword if  'Annual Revenue' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Annual_Revenue_loc}
    run keyword if  'Rating' == ${element}  click element  ${Lead_detaillayout_Lead_Information_Rating_loc}
    run keyword if  'No. of Employees' == ${element}  click element  ${Lead_detaillayout_Lead_Information_No._of_Employees_loc}

#  DetailLayout: Address Information section keyword
LeadPage.Click On Element in Address Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Street' == ${element}  click element  ${Lead_detaillayout_Address_Information_Street_loc}
    run keyword if  'City' == ${element}  click element  ${Lead_detaillayout_Address_Information_City_loc}
    run keyword if  'State/Province' == ${element}  click element  ${Lead_detaillayout_Address_Information_State/Province_loc}
    run keyword if  'Zip/Postal Code' == ${element}  click element  ${Lead_detaillayout_Address_Information_Zip/Postal_Code_loc}
    run keyword if  'Country' == ${element}  click element  ${Lead_detaillayout_Address_Information_Country_loc}
    run keyword if  'Address' == ${element}  click element  ${Lead_detaillayout_Address_Information_Address_loc}

#  DetailLayout: Additional Information section keyword
LeadPage.Click On Element in Additional Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Product Interest' == ${element}  click element  ${Lead_detaillayout_Additional_Information_Product_Interest_loc}
    run keyword if  'Current Generator(s)' == ${element}  click element  ${Lead_detaillayout_Additional_Information_Current_Generator(s)_loc}
    run keyword if  'SIC Code' == ${element}  click element  ${Lead_detaillayout_Additional_Information_SIC_Code_loc}
    run keyword if  'Primary' == ${element}  click element  ${Lead_detaillayout_Additional_Information_Primary_loc}
    run keyword if  'Number of Locations' == ${element}  click element  ${Lead_detaillayout_Additional_Information_Number_of_Locations_loc}

#  DetailLayout: System Information section keyword
LeadPage.Click On Element in System Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Created By' == ${element}  click element  ${Lead_detaillayout_System_Information_Created_By_loc}
    run keyword if  'Created By' == ${element}  click element  ${Lead_detaillayout_System_Information_Created_By_loc}
    run keyword if  'Last Modified By' == ${element}  click element  ${Lead_detaillayout_System_Information_Last_Modified_By_loc}
    run keyword if  'Last Modified By' == ${element}  click element  ${Lead_detaillayout_System_Information_Last_Modified_By_loc}

#  DetailLayout: Description Information section keyword
LeadPage.Click On Element in Description Information Detaillayout
    [Arguments]  ${element}
    run keyword if  'Description' == ${element}  click element  ${Lead_detaillayout_Description_Information_Description_loc}

# Keyword to click "Edit" top level page button
LeadPage.Click On 'Edit' TabPage Button
    Click On 'Edit' TabPage Button

# Keyword to click "Delete" top level page button
LeadPage.Click On 'Delete' TabPage Button
    Click On 'Delete' TabPage Button

# Keyword to click "Change Owner" top level page button
LeadPage.Click On 'Change Owner' TabPage Button
    Click On 'Change Owner' TabPage Button

# Keyword to click "Change Record Type" top level page button
LeadPage.Click On 'Change Record Type' TabPage Button
    Click On 'Change Record Type' TabPage Button

# Keyword to click "Convert" top level page button
LeadPage.Click On 'Convert' TabPage Button
    Click On 'Convert' TabPage Button

# Keyword to click "Clone" top level page button
LeadPage.Click On 'Clone' TabPage Button
    Click On 'Clone' TabPage Button

# Keyword to click "Sharing" top level page button
LeadPage.Click On 'Sharing' TabPage Button
    Click On 'Sharing' TabPage Button

# Keyword to click "Find Duplicates" top level page button
LeadPage.Click On 'Find Duplicates' TabPage Button
    Click On 'Find Duplicates' TabPage Button

# Keyword to click "Check Integration Status" top level page button
LeadPage.Click On 'Check Integration Status' TabPage Button
    Click On 'Check Integration Status' TabPage Button

# Keyword to navigate to Lead Tab from AllTabs Page
LeadPage.Click On 'Leads' Tab
    Click On 'Leads' Tab

# keywords to click New button from Lead Page
LeadPage.Click On 'New' TabPage Button
    Click On 'New' TabPage Button

# keywords to verify Lead record created
LeadPage.Verify if 'Leads' is saved successfully
    Verify if 'Leads' is saved successfully

# keywords to click record in a related list section
LeadPage.Click On Given Text In RelatedList Table
    Click On Given Text In RelatedList Table

# keywords to click on Save, Cancel button in the New/Edit Window
LeadPage.Click On Edit Window 'Save' Button
    Click On Edit Window 'Save' Button

LeadPage.Click On Edit Window 'Cancel' Button
    Click On Edit Window 'Cancel' Button