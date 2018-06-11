*** Settings ***
Documentation  Stores page object properties and key logic
Library  Selenium2Library
Library  OperatingSystem
Resource  ../../common-variables.robot

*** Variables ***
# Place holder for all locators in login page
${username_loc}  id=username
${password_loc}  id=password
${loginbtn_loc}  id=Login
#${home_loc}  //a[contains(@class, 'slds-context-bar')]/span[text()='Home']

*** Keywords ***

Load Page
    go to  ${LOGIN_URL.${ENVIRONMENT}}

Open SFDC Application
    open browser  about:blank  ${BROWSER}

Close SFDC Application
    close browser

Enter Username
    [Arguments]  ${testdata_row}
    log to console  ${testdata_row['Username']}
    input text  ${username_loc}  ${testdata_row['Username']}

Enter Password
    [Arguments]  ${testdata_row}
    log to console  ${testdata_row['Password']}
    input password  ${password_loc}  ${testdata_row['Password']}

#Verify SFDC Home Page
#    wait until page contains element  ${home_loc}  50s
#    Selenium2library.capture page screenshot  Homescreen.png
#    sleep  2s

Click Login Button
    click button  ${loginbtn_loc}