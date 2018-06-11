*** Settings ***
Documentation    Suite description

Resource  ./PO/Login_Page.robot
Resource  ./PO/Account_Page.robot
Resource  ./PO/Contact_Page.robot

*** Variables ***
${Save_Button_loc}  //td[@class='pbButton']//input[@title='Save']
${click_continue_btn_loc}  //input[@title='Continue']
${Record_Type_select_loc}  //label[contains(text(),'Record Type')]//following::select[1]

# Todo  Please update what table header function does
*** Keywords ***

Open SFDC Application
    Login_Page.Open SFDC Application

Close SFDC Application
    Login_Page.Close SFDC Application

Login into Salesforce
    [Arguments]  ${testdata_row}
    #${row_length} =  get length  ${testdata_tc1}
    #log to console  ${row_length}
    Go to login url
    Enter Credentials  ${testdata_row}
    Click 'Log in to Sandbox' Button

Go to login url
    Login_Page.Load Page

Enter Credentials
    [Arguments]  ${testdata_row}
    Login_Page.Enter Username  ${testdata_row}
    Login_Page.Enter Password  ${testdata_row}

Click 'Log in to Sandbox' Button
    Login_Page.Click Login Button

Verify Home Page
    Login_Page.Verify SFDC Home Page

Login to Medvantage App
    [Arguments]  ${testdata_row}
    Login into Salesforce  ${testdata_row}
    Verify Home Page

CLick on Accounts Tab
    Account_Page.Click on Accounts TAB

Enter new Account Details in Account Information
    [Arguments]  ${testdata_row}
    Account_Page.Enter Account Information Section  ${testdata_row}
    Account_Page.Enter Address Information Section  ${testdata_row}
    Account_Page.Enter Additional Information Section  ${testdata_row}

Click on Save
    click button  ${Save_Button_loc}

Verify Account Creation
    Account_Page.Verify account is saved

CLick on Contacts Tab
    Contact_Page.Click on Contacts TAB

Enter new Contact Details in Contact Information
    [Arguments]  ${testdata_row}
    Contact_Page.Enter Contact Information Section  ${testdata_row}
    Contact_Page.Enter Address Information  ${testdata_row}
    Contact_Page.Enter Additional Information  ${testdata_row}

Verify contact Creation
    Contact_Page.Verify Contact is saved

Select Record Type
    [Arguments]  ${testdata_row}
    select from list by value  ${record_type_select_loc}  ${testdata_row}
    click button  ${click_continue_btn_loc}


