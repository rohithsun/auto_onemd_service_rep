*** Settings ***
Documentation    Suite description : Saleforce login test from Pycharm
Library  Selenium2Library
Resource  ../Data/DataManager.robot
Resource  ../Resources/common-variables.robot
Resource  ../Resources/MedvantageApp/OneMDApp.robot


Suite Setup  OneMDApp.Open SFDC Application
Suite Teardown  OneMDApp.Close SFDC Application


*** Test Cases ***

Multiple Profile Login
    [Tags]  regression
    ${testdata_tc1} =  DataManager.Get CSV Data  ${TC1_PATH_CSV}
    OneMDApp.Login to Medvantage App  ${testdata_tc1}

