*** Settings ***

Library  AppiumLibrary

Documentation   demo for appium library

Resource  ../Resources/MedvantageApp/MobilePO/OneMDApp_Mobile.robot
Resource  ../Data/DataManager.robot
Resource  ../Resources/common-variables.robot


Suite Setup  OneMDApp_Mobile.Open SFDC Application
Suite Teardown  OneMDApp_Mobile.Close SFDC Application

*** Test Cases ***

test_demo
    [Documentation]  This script is to execute script on Mobile devices
    [Tags]  regression
    ${appium_server}=  set variable  http://127.0.0.1:4723/wd/hub
    log to console  ${appium_server}
    Open Application  ${appium_server}  platformName=Android  platformVersion=6.0.1  deviceName=84731b76  app=com.android.browser  automationName=appium  appPackage=com.android.browser  appActivity=AddBookmarkPage
    go to url  https://test.salesforce.com
    AppiumLibrary.capture page screenshot
    AppiumLibrary.input text  username  rn10@jjfsr.com.sit
    AppiumLibrary.input password  password  Start12345
    AppiumLibrary.click element  Login
    AppiumLibrary.capture page screenshot
    close application

Login to SFDC and Create an account
    [Tags]  Module
    ${testdata_row} =  DataManager.Get CSV Data Row  ${TC1_PATH_CSV}
    OneMDApp_Mobile.Login to Medvantage App  ${testdata_row}
    OneMDApp_Mobile.click on accounts tab
    OneMDApp_Mobile.enter new account details in account information  ${testdata_row}
    OneMDApp_Mobile.Click on Save
    OneMDApp_Mobile.verify account creation