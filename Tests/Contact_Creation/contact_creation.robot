*** Settings ***
Documentation    Account Creation
Resource  ../../Resources/MedvantageApp/OneMDApp.robot
Resource  ../../Resources/MedvantageApp/PageElements/Asset_PageElements.robot
Resource  ../../Data/DataManager.robot
Resource  ../../Resources/common-variables.robot


Suite Setup  OneMDApp.Open SFDC Application
Suite Teardown  OneMDApp.Close SFDC Application

*** Test Cases ***
Login to SFDC and Create a contact
    [Tags]  Module
    ${testdata_row} =  Get CSV Data Row  ${ACC_CREATION_PATH_CSV}
    OneMDApp.Login to Medvantage App  ${testdata_row}
    OneMDApp.CLick on Contacts Tab
    OneMDApp.Enter new Contact Details in Contact Information  ${testdata_row}
    OneMDApp.Click on Save
    OneMDApp.Verify contact Creation
    Contact_Page.Enter Additional Information
