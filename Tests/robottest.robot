*** Settings ***
Documentation  commit to dev branch

Library  Selenium2Library


*** Test Cases ***
Open browser to login page
    Login to salesforce

*** Keywords ***
Login to salesforce
    Open Browser  https://test.salesforce.com  gc
    title should be  Login | Salesforce
    Close Browser