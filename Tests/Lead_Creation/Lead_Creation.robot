*** Settings ***
Documentation    Lead Creation
Resource  ../../Resources/MedvantageApp/OneMDApp.robot
Resource  ../../Resources/MedvantageApp/PO/Lead_Page.robot
Resource  ../../Data/DataManager.robot
Resource  ../../Resources/common-variables.robot

Suite Setup  OneMDApp.Open SFDC Application
Suite Teardown  OneMDApp.Close SFDC Application

*** Test Cases ***
Login to salesforce and create Lead
    [Tags]  Lead Module
    ${testdata_row} =  Get CSV Data Row  ${LEAD_CREATION_PATH_CSV}
    OneMDApp.Login to Medvantage App  ${testdata_row}
    LeadPage.Click On Lead Tab
    LeadPage.Click On New Button
    LeadPage.Enter Editlayout Lead Information section  ${testdata_row}
    LeadPage.Enter Editlayout Address Information section  ${testdata_row}
    LeadPage.Enter Editlayout Additional Information section  ${testdata_row}
    LeadPage.Enter Editlayout Description Information section  ${testdata_row}
    OneMDApp.Click on Save
    LeadPage.Verify if Lead is saved successfully