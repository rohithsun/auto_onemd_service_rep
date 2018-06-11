*** Settings ***
Documentation  Stores page object properties and key logic
Library  AppiumLibrary
Library  OperatingSystem
Resource   ../../common-variables.robot

*** Variables ***
# Place holder for all locators in login page
${username_loc}  id=username
${password_loc}  id=password
${loginbtn_loc}  id=Login
${home_loc}  //a[contains(text(), 'Home')]


*** Keywords ***
AppiumServer
    [Documentation]  This script is to execute script on Mobile devices
    [Tags]  regression
    ${appium_server}=  set variable  http://127.0.0.1:4723/wd/hub
    log to console  ${appium_server}
    Open Application  ${appium_server}  platformName=Android  platformVersion=7.0  deviceName=84731b76  automationName=UiAutomator2  browserName=Chrome
Load Page
    go to url  ${LOGIN_URL.${ENVIRONMENT}}

#Open SFDC Application
#    open browser  about:blank    ${BROWSER}

Close SFDC Application
    close Application

Enter Username
    [Arguments]  ${testdata_row}
    log to console  ${testdata_row['Username']}
    AppiumLibrary.input text  ${username_loc}  ${testdata_row['Username']}

Enter Password
    [Arguments]  ${testdata_row}
    log to console  ${testdata_row['Password']}
    AppiumLibrary.input password  ${password_loc}  ${testdata_row['Password']}
    sleep  2s

Verify SFDC Home Page
    sleep  45s
    AppiumLibrary.wait until page contains element  ${home_loc}
    AppiumLibrary.capture page screenshot  Homescreen.png
    sleep  2s

Click Login Button
    AppiumLibrary.click element  ${loginbtn_loc}
    sleep  4s