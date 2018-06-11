*** Settings ***
Documentation    Suite description

*** Test Cases ***
Test title
    [Tags]    smoke
    Provided precondition

*** Keywords ***
Provided precondition
    log  this is my product 3 test case
    log to console  this is my product 3 test case