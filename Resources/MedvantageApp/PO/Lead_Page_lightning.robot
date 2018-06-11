*** Settings ***
Documentation    Lead Page Reusable Keywords
Library  Selenium2Library
Library  OperatingSystem
Library  ../../../Utility/keyword_generator_lightning.py
Resource  ../../common-methods.robot
Library  ../../../Utility/datepicker.py

*** Variables ***

#  DetailLayout: Lead Information section locators
${Lead_detaillayout_Lead_Information_Lead_Owner_loc}  //div[contains(@class, 'modal-body')]//*[text()='Lead Owner']/following::div[1]
${Lead_detaillayout_Lead_Information_Phone_loc}  //div[contains(@class, 'modal-body')]//*[text()='Phone']/following::div[1]
${Lead_detaillayout_Lead_Information_Salutation_loc}  //div[contains(@class, 'modal-body')]//*[text()='Salutation']/following::div[1]
${Lead_detaillayout_Lead_Information_First_Name_loc}  //div[contains(@class, 'modal-body')]//*[text()='First Name']/following::div[1]
${Lead_detaillayout_Lead_Information_Last_Name_loc}  //div[contains(@class, 'modal-body')]//*[text()='Last Name']/following::div[1]
${Lead_detaillayout_Lead_Information_Name_loc}  //div[contains(@class, 'modal-body')]//*[text()='Name']/following::div[1]
${Lead_detaillayout_Lead_Information_Mobile_loc}  //div[contains(@class, 'modal-body')]//*[text()='Mobile']/following::div[1]
${Lead_detaillayout_Lead_Information_Company_loc}  //div[contains(@class, 'modal-body')]//*[text()='Company']/following::div[1]
${Lead_detaillayout_Lead_Information_Fax_loc}  //div[contains(@class, 'modal-body')]//*[text()='Fax']/following::div[1]
${Lead_detaillayout_Lead_Information_Title_loc}  //div[contains(@class, 'modal-body')]//*[text()='Title']/following::div[1]
${Lead_detaillayout_Lead_Information_Email_loc}  //div[contains(@class, 'modal-body')]//*[text()='Email']/following::div[1]
${Lead_detaillayout_Lead_Information_Lead_Source_loc}  //div[contains(@class, 'modal-body')]//*[text()='Lead Source']/following::div[1]
${Lead_detaillayout_Lead_Information_Website_loc}  //div[contains(@class, 'modal-body')]//*[text()='Website']/following::div[1]
${Lead_detaillayout_Lead_Information_Industry_loc}  //div[contains(@class, 'modal-body')]//*[text()='Industry']/following::div[1]
${Lead_detaillayout_Lead_Information_Lead_Status_loc}  //div[contains(@class, 'modal-body')]//*[text()='Lead Status']/following::div[1]
${Lead_detaillayout_Lead_Information_Annual_Revenue_loc}  //div[contains(@class, 'modal-body')]//*[text()='Annual Revenue']/following::div[1]
${Lead_detaillayout_Lead_Information_Rating_loc}  //div[contains(@class, 'modal-body')]//*[text()='Rating']/following::div[1]
${Lead_detaillayout_Lead_Information_No._of_Employees_loc}  //div[contains(@class, 'modal-body')]//*[text()='No. of Employees']/following::div[1]

#  DetailLayout: Address Information section locators
${Lead_detaillayout_Address_Information_Street_loc}  //div[contains(@class, 'modal-body')]//*[text()='Street']/following::div[1]
${Lead_detaillayout_Address_Information_City_loc}  //div[contains(@class, 'modal-body')]//*[text()='City']/following::div[1]
${Lead_detaillayout_Address_Information_State/Province_loc}  //div[contains(@class, 'modal-body')]//*[text()='State/Province']/following::div[1]
${Lead_detaillayout_Address_Information_Zip/Postal_Code_loc}  //div[contains(@class, 'modal-body')]//*[text()='Zip/Postal Code']/following::div[1]
${Lead_detaillayout_Address_Information_Country_loc}  //div[contains(@class, 'modal-body')]//*[text()='Country']/following::div[1]
${Lead_detaillayout_Address_Information_Address_loc}  //div[contains(@class, 'modal-body')]//*[text()='Address']/following::div[1]

#  DetailLayout: Additional Information section locators
${Lead_detaillayout_Additional_Information_Product_Interest_loc}  //div[contains(@class, 'modal-body')]//*[text()='Product Interest']/following::div[1]
${Lead_detaillayout_Additional_Information_Current_Generator(s)_loc}  //div[contains(@class, 'modal-body')]//*[text()='Current Generator(s)']/following::div[1]
${Lead_detaillayout_Additional_Information_SIC_Code_loc}  //div[contains(@class, 'modal-body')]//*[text()='SIC Code']/following::div[1]
${Lead_detaillayout_Additional_Information_Primary_loc}  //div[contains(@class, 'modal-body')]//*[text()='Primary']/following::div[1]
${Lead_detaillayout_Additional_Information_Number_of_Locations_loc}  //div[contains(@class, 'modal-body')]//*[text()='Number of Locations']/following::div[1]

#  DetailLayout: System Information section locators
${Lead_detaillayout_System_Information_Created_By_loc}  //div[contains(@class, 'modal-body')]//*[text()='Created By']/following::div[1]
${Lead_detaillayout_System_Information_Created_By_loc}  //div[contains(@class, 'modal-body')]//*[text()='Created By']/following::div[1]
${Lead_detaillayout_System_Information_Last_Modified_By_loc}  //div[contains(@class, 'modal-body')]//*[text()='Last Modified By']/following::div[1]
${Lead_detaillayout_System_Information_Last_Modified_By_loc}  //div[contains(@class, 'modal-body')]//*[text()='Last Modified By']/following::div[1]

#  DetailLayout: Description Information section locators
${Lead_detaillayout_Description_Information_Description_loc}  //div[contains(@class, 'modal-body')]//*[text()='Description']/following::div[1]

#  EditLayout: Lead Information section locators
${Lead_editlayout_Lead_Information_Lead_Owner_loc}  //div[contains(@class, 'modal-body')]//*[text()='Lead Owner']/following::input[1]
${Lead_editlayout_Lead_Information_Phone_loc}  //div[contains(@class, 'modal-body')]//*[text()='Phone']/following::input[1]
${Lead_editlayout_Lead_Information_Salutation_loc}  //div[contains(@class, 'modal-body')]//*[text()='Salutation']/following::a[1]
${Lead_editlayout_Lead_Information_First_Name_loc}  //div[contains(@class, 'modal-body')]//*[text()='First Name']/following::input[1]
${Lead_editlayout_Lead_Information_Last_Name_loc}  //div[contains(@class, 'modal-body')]//*[text()='Last Name']/following::input[1]
${Lead_editlayout_Lead_Information_Name_loc}  //div[contains(@class, 'modal-body')]//*[text()='Name']/following::input[1]
${Lead_editlayout_Lead_Information_Mobile_loc}  //div[contains(@class, 'modal-body')]//*[text()='Mobile']/following::input[1]
${Lead_editlayout_Lead_Information_Company_loc}  //div[contains(@class, 'modal-body')]//*[text()='Company']/following::input[1]
${Lead_editlayout_Lead_Information_Fax_loc}  //div[contains(@class, 'modal-body')]//*[text()='Fax']/following::input[1]
${Lead_editlayout_Lead_Information_Title_loc}  //div[contains(@class, 'modal-body')]//*[text()='Title']/following::input[1]
${Lead_editlayout_Lead_Information_Email_loc}  //div[contains(@class, 'modal-body')]//*[text()='Email']/following::input[1]
${Lead_editlayout_Lead_Information_Lead_Source_loc}  //div[contains(@class, 'modal-body')]//*[text()='Lead Source']/following::a[1]
${Lead_editlayout_Lead_Information_Website_loc}  //div[contains(@class, 'modal-body')]//*[text()='Website']/following::input[1]
${Lead_editlayout_Lead_Information_Industry_loc}  //div[contains(@class, 'modal-body')]//*[text()='Industry']/following::a[1]
${Lead_editlayout_Lead_Information_Lead_Status_loc}  //div[contains(@class, 'modal-body')]//*[text()='Lead Status']/following::a[1]
${Lead_editlayout_Lead_Information_Annual_Revenue_loc}  //div[contains(@class, 'modal-body')]//*[text()='Annual Revenue']/following::input[1]
${Lead_editlayout_Lead_Information_Rating_loc}  //div[contains(@class, 'modal-body')]//*[text()='Rating']/following::a[1]
${Lead_editlayout_Lead_Information_No._of_Employees_loc}  //div[contains(@class, 'modal-body')]//*[text()='No. of Employees']/following::input[1]

#  EditLayout: Address Information section locators
${Lead_editlayout_Address_Information_Street_loc}  //div[contains(@class, 'modal-body')]//*[text()='Street']/following::textarea[1]
${Lead_editlayout_Address_Information_City_loc}  //div[contains(@class, 'modal-body')]//*[text()='City']/following::input[1]
${Lead_editlayout_Address_Information_State/Province_loc}  //div[contains(@class, 'modal-body')]//*[text()='State/Province']/following::input[1]
${Lead_editlayout_Address_Information_Zip/Postal_Code_loc}  //div[contains(@class, 'modal-body')]//*[text()='Zip/Postal Code']/following::input[1]
${Lead_editlayout_Address_Information_Country_loc}  //div[contains(@class, 'modal-body')]//*[text()='Country']/following::input[1]
${Lead_editlayout_Address_Information_Address_loc}  //div[contains(@class, 'modal-body')]//*[text()='Address']/following::input[1]

#  EditLayout: Additional Information section locators
${Lead_editlayout_Additional_Information_Product_Interest_loc}  //div[contains(@class, 'modal-body')]//*[text()='Product Interest']/following::a[1]
${Lead_editlayout_Additional_Information_Current_Generator(s)_loc}  //div[contains(@class, 'modal-body')]//*[text()='Current Generator(s)']/following::input[1]
${Lead_editlayout_Additional_Information_SIC_Code_loc}  //div[contains(@class, 'modal-body')]//*[text()='SIC Code']/following::input[1]
${Lead_editlayout_Additional_Information_Primary_loc}  //div[contains(@class, 'modal-body')]//*[text()='Primary']/following::a[1]
${Lead_editlayout_Additional_Information_Number_of_Locations_loc}  //div[contains(@class, 'modal-body')]//*[text()='Number of Locations']/following::input[1]

#  EditLayout: Description Information section locators
${Lead_editlayout_Description_Information_Description_loc}  //div[contains(@class, 'modal-body')]//*[text()='Description']/following::textarea[1]

#  Open Activities Related List Button locators
${Lead_relSection_btn_Open_Activities_New_Task_loc}  //h2[@id='header']//span[text()='Open Activities']/following::a[@title='New Task'][1]
${Lead_relSection_btn_Open_Activities_New_Event_loc}  //h2[@id='header']//span[text()='Open Activities']/following::a[@title='New Event'][1]
${Lead_relSection_btn_Open_Activities_New_Meeting_Request_loc}  //h2[@id='header']//span[text()='Open Activities']/following::a[@title='New Meeting Request'][1]

#  Activity History Related List Button locators
${Lead_relSection_btn_Activity_History_Log_a_Call_loc}  //h2[@id='header']//span[text()='Activity History']/following::a[@title='Log a Call'][1]
${Lead_relSection_btn_Activity_History_Mail_Merge_loc}  //h2[@id='header']//span[text()='Activity History']/following::a[@title='Mail Merge'][1]
${Lead_relSection_btn_Activity_History_Send_an_Email_loc}  //h2[@id='header']//span[text()='Activity History']/following::a[@title='Send an Email'][1]
${Lead_relSection_btn_Activity_History_Compose_Gmail_loc}  //h2[@id='header']//span[text()='Activity History']/following::a[@title='Compose Gmail'][1]
${Lead_relSection_btn_Activity_History_Request_Update_loc}  //h2[@id='header']//span[text()='Activity History']/following::a[@title='Request Update'][1]
${Lead_relSection_btn_Activity_History_View_All_loc}  //h2[@id='header']//span[text()='Activity History']/following::a[@title='View All'][1]

#  Campaign History Related List Button locators
${Lead_relSection_btn_Campaign_History_Add_to_Campaign_loc}  //h2[@id='header']//span[text()='Campaign History']/following::a[@title='Add to Campaign'][1]

#  HTML Email Status Related List HAS NO Buttons

#  Lead Page Button locators

*** Keywords ***

#  EditLayout: Lead Information section keyword
LeadPage.Enter Editlayout Lead Information section
    [Arguments]  ${testdata_row}
    run keyword if  '${testdata_row['Lead Owner Edit']}' is not 'nan'  Select From LookUp Li  ${Lead_editlayout_Lead_Information_Lead_Owner_loc}  ${testdata_row['Lead Owner Edit']}
    run keyword if  '${testdata_row['Phone Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Phone_loc}  ${testdata_row['Phone Edit']}
    run keyword if  '${testdata_row['Salutation Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Lead_Information_Salutation_loc}  ${testdata_row['Salutation Edit']}
    run keyword if  '${testdata_row['First Name Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_First_Name_loc}  ${testdata_row['First Name Edit']}
    run keyword if  '${testdata_row['Last Name Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Last_Name_loc}  ${testdata_row['Last Name Edit']}
    run keyword if  '${testdata_row['Name Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Name_loc}  ${testdata_row['Name Edit']}
    run keyword if  '${testdata_row['Mobile Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Mobile_loc}  ${testdata_row['Mobile Edit']}
    run keyword if  '${testdata_row['Company Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Company_loc}  ${testdata_row['Company Edit']}
    run keyword if  '${testdata_row['Fax Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Fax_loc}  ${testdata_row['Fax Edit']}
    run keyword if  '${testdata_row['Title Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Title_loc}  ${testdata_row['Title Edit']}
    run keyword if  '${testdata_row['Email Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Email_loc}  ${testdata_row['Email Edit']}
    run keyword if  '${testdata_row['Lead Source Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Lead_Information_Lead_Source_loc}  ${testdata_row['Lead Source Edit']}
    run keyword if  '${testdata_row['Website Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Website_loc}  ${testdata_row['Website Edit']}
    run keyword if  '${testdata_row['Industry Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Lead_Information_Industry_loc}  ${testdata_row['Industry Edit']}
    run keyword if  '${testdata_row['Lead Status Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Lead_Information_Lead_Status_loc}  ${testdata_row['Lead Status Edit']}
    run keyword if  '${testdata_row['Annual Revenue Edit']}' is not 'nan'  input text  ${Lead_editlayout_Lead_Information_Annual_Revenue_loc}  ${testdata_row['Annual Revenue Edit']}
    run keyword if  '${testdata_row['Rating Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Lead_Information_Rating_loc}  ${testdata_row['Rating Edit']}
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
    run keyword if  '${testdata_row['Product Interest Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Additional_Information_Product_Interest_loc}  ${testdata_row['Product Interest Edit']}
    run keyword if  '${testdata_row['Current Generator(s) Edit']}' is not 'nan'  input text  ${Lead_editlayout_Additional_Information_Current_Generator(s)_loc}  ${testdata_row['Current Generator(s) Edit']}
    run keyword if  '${testdata_row['SIC Code Edit']}' is not 'nan'  input text  ${Lead_editlayout_Additional_Information_SIC_Code_loc}  ${testdata_row['SIC Code Edit']}
    run keyword if  '${testdata_row['Primary Edit']}' is not 'nan'  Select From Menu List Li  ${Lead_editlayout_Additional_Information_Primary_loc}  ${testdata_row['Primary Edit']}
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
LeadPage.Click On 'Edit' TabPage Button Li
    Click On 'Edit' TabPage Button Li

# Keyword to click "Delete" top level page button
LeadPage.Click On 'Delete' TabPage Button Li
    Click On 'Delete' TabPage Button Li

# Keyword to click "Change Owner" top level page button
LeadPage.Click On 'Change Owner' TabPage Button Li
    Click On 'Change Owner' TabPage Button Li

# Keyword to click "Change Record Type" top level page button
LeadPage.Click On 'Change Record Type' TabPage Button Li
    Click On 'Change Record Type' TabPage Button Li

# Keyword to click "Convert" top level page button
LeadPage.Click On 'Convert' TabPage Button Li
    Click On 'Convert' TabPage Button Li

# Keyword to click "Clone" top level page button
LeadPage.Click On 'Clone' TabPage Button Li
    Click On 'Clone' TabPage Button Li

# Keyword to click "Sharing" top level page button
LeadPage.Click On 'Sharing' TabPage Button Li
    Click On 'Sharing' TabPage Button Li

# Keyword to click "Find Duplicates" top level page button
LeadPage.Click On 'Find Duplicates' TabPage Button Li
    Click On 'Find Duplicates' TabPage Button Li

# Keyword to click "Check Integration Status" top level page button
LeadPage.Click On 'Check Integration Status' TabPage Button Li
    Click On 'Check Integration Status' TabPage Button Li

# Keyword to navigate to Lead Tab from All Items Page
LeadPage.Click On 'Leads' Tab Li
    Click On 'Leads' Tab Li

# keywords to click New button from Lead Page
LeadPage.Click On 'New' TabPage Button Li
    Click On 'New' TabPage Button Li

# keywords to verify Lead record created
LeadPage.Verify if 'Leads' is saved successfully Li
    Verify if 'Leads' is saved successfully Li

# keywords to click record in a related list section
LeadPage.Click On Given Text In RelatedList Table Li
    Click On Given Text In RelatedList Table Li

# keywords to click on Save, Cancel button in the New/Edit Window
LeadPage.Click On Edit Window 'Save' Button Li
    Click On Edit Window 'Save' Button Li

LeadPage.Click On Edit Window 'Cancel' Button Li
    Click On Edit Window 'Cancel' Button Li