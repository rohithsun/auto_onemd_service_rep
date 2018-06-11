*** Settings ***
Documentation    Lead Creation
Resource  ../../Resources/MedvantageApp/OneMDApp.robot
#Resource  ../../Resources/MedvantageApp/PO/Account_Page.robot
Resource  ../../Data/DataManager.robot
Resource  ../../Resources/common-variables.robot

Suite Setup  OneMDApp.Open SFDC Application
#Suite Teardown  OneMDApp.Close SFDC Application

*** Test Cases ***
Login to salesforce and create Lead
    [Tags]  Lead Module
    ${testdata_row} =  Get CSV Data Row  ${ACC_CREATION_PATH_CSV}
    OneMDApp.Login to Medvantage App  ${testdata_row}
    click element  //button[@data-aura-class='uiButton forceHeaderButton salesforceIdentityAppLauncherHeader']
    click link  //h3[text()='All Items']//following::a[@title='Accounts']
