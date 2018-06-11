*** Settings ***
Documentation    Lead Creation
Resource  ../Resources/MedvantageApp/OneMDApp.robot
Resource  ../Resources/common-methods.robot
Resource  ../Data/DataManager.robot
Resource  ../Resources/common-variables.robot
Resource  ../Resources/MedvantageApp/PO/Lead_Page_lightning.robot

Suite Setup  OneMDApp.Open SFDC Application
#Suite Teardown  OneMDApp.Close SFDC Application

*** Test Cases ***
Login to salesforce and create Lead
    [Tags]  Lead Module
    ${testdata_row} =  Get CSV Data Row  ${LEAD_CREATION_PATH_CSV}
    OneMDApp.Login to Medvantage App  ${testdata_row}
    Verify SFDC Home Page Li
    LeadPage.Click On 'Leads' Tab Li
    LeadPage.Click On 'New' TabPage Button Li
    LeadPage.Enter Editlayout Lead Information section  ${testdatarow}
    LeadPage.Enter Editlayout Additional Information section  ${testdatarow}
    LeadPage.Enter Editlayout Address Information section  ${testdatarow}
    LeadPage.Enter Editlayout Description Information section  ${testdatarow}
    LeadPage.Click On Edit Window 'Save' Button Li
    LeadPage.Verify if 'Leads' is saved successfully Li
