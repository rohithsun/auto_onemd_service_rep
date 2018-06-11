*** Settings ***
Documentation    Suite description

Resource  Login_page_Mobile.robot
Resource  Account_page_Mobile.robot
#Resource  C:/Users/akamaley/PycharmProjects/Robot4Salesforce/Resources/MedvantageApp/MobilePO/Contact_page_Mobile.robot

# Todo  Please update what table header function does
*** Keywords ***

Open SFDC Application
    Login_page_Mobile.AppiumServer

Close SFDC Application
    Login_page_Mobile.Close SFDC Application

Login into Salesforce
    [Arguments]  ${testdata_row}
    #${row_length} =  get length  ${testdata_tc1}
    #log to console  ${row_length}
    Go to login url
    Enter Credentials  ${testdata_row}
    Click 'Log in to Sandbox' Button

Go to login url
    Login_page_Mobile.Load Page

Enter Credentials
    [Arguments]  ${testdata_row}
    Login_page_Mobile.Enter Username  ${testdata_row}
    Login_page_Mobile.Enter Password  ${testdata_row}

Click 'Log in to Sandbox' Button
    Login_page_Mobile.Click Login Button

Verify Home Page
    Login_page_Mobile.Verify SFDC Home Page

Login to Medvantage App
    [Arguments]  ${testdata_row}
    Login into Salesforce  ${testdata_row}
    Verify Home Page

CLick on Accounts Tab
    Account_page_Mobile.Click on Accounts TAB

Enter new Account Details in Account Information
    [Arguments]  ${testdata_row}
    Account_page_Mobile.Enter Account Information Section  ${testdata_row}
    Account_page_Mobile.Enter Address Information Section  ${testdata_row}
    Account_page_Mobile.Enter Additional Information Section  ${testdata_row}

Click on Save
    Account_page_Mobile.Click On Save

Verify Account Creation
    Account_page_Mobile.Verify account is saved

CLick on Contacts Tab
    Contact_page_Mobile.Click on Contacts TAB

Enter new Contact Details in Contact Information
    [Arguments]  ${testdata_row}
    Contact_page_Mobile.Enter Contact Information Section  ${testdata_row}
    Contact_page_Mobile.Enter Address Information  ${testdata_row}
    Contact_page_Mobile.Enter Additional Information  ${testdata_row}

Verify contact Creation
    Contact_page_Mobile.Verify Contact is saved

