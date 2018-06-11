*** Settings ***
Library  Selenium2Library
Library  OperatingSystem
Library  ../Utility/datepicker.py
Library  ../Utility/splitstring.py

*** Variables ***

# Locators for Lightning SFDC
${App_launcher_Li_loc}  //header[@id='oneHeader']//span[text()='App Launcher']/ancestor::button
${home_page_li_loc}  //a[contains(@class, 'slds-context-bar')]/span[text()='Home']


# Locators for Classic SFDC
${Alltabs_btn_loc}  //img[@title='All Tabs']
${Save_Button_loc}  //td[@class='pbButton']//input[@title='Save']
${click_continue_btn_loc}  //input[@title='Continue']
${Record_Type_select_loc}  //label[contains(text(),'Record Type')]//following::select[1]
${home_loc}  //a[contains(text(), 'Home')]

*** Keywords ***

Select From LookUp
    [Arguments]  ${vlovtitle}    ${valuetobeselected}
#    ${replacelovtitle}=  replace string  ${lovtitle_Id}  lookuptitle  ${vlovtitle}
    click element  ${vlovtitle}
    sleep  2
    Select Window  New

    #Search the text in Searchframe
    Select Frame  //*[@title='Search']
    Input Text  lksrch  ${valuetobeselected}
    Click Button  go
    unselect Frame

    #Click on the link in resultsframe
    select frame  //*[@title='Results']
    click link  ${valuetobeselected}
    Select Window
    sleep  2


Select From LookUp Li
    [Arguments]  ${locator}  ${valuetobeselected}
    wait until element is enabled  ${locator}  10s
    input text  ${locator}  ${valuetobeselected}
    sleep  2s
    press key  ${locator}  \\13
    wait until element is enabled  //table[contains(@class, 'slds-table_bordered')]//td/a[@title='${valuetobeselected}']
    click link  //table[contains(@class, 'slds-table_bordered')]//td/a[@title='${valuetobeselected}']
    sleep  2s
    click element  //div[contains(@class, 'modal-body')]
    wait until element is enabled  //div[contains(@class, 'modal-body')]

Increase Month
    click link  //div[contains(@class, 'dateBar')]//a[@title='Go to next month']

Decrease Month
    click link  //div[contains(@class, 'dateBar')]//a[@title='Go to previous month']

Select Date Li
    [Arguments]  ${locator}  ${date}
    ${mm}  ${dd}  ${yyyy} =  split date string  ${date}
    ${incordec}  ${nooftimes} =  pick date li  ${mm}
    click element  ${locator}
    wait until element is enabled  //div[contains(@class, 'dateBar')]
    run keyword if  '${incordec}' == 'increase'  repeat keyword  ${nooftimes}  Increase Month
    ...  ELSE  repeat keyword  ${nooftimes}  Decrease Month
    select from list by value  //div[contains(@class, 'dateBar')]//select  ${yyyy}
    click element  //div[contains(@class, 'dateBar')]/following::table//td/span[text()='${dd}']

Select From Menu List Li
    [Arguments]  ${locator}  ${valuetobeselected}
    wait until element is enabled  ${locator}
    click link  ${locator}
    wait until element is enabled  //li[contains(@class, 'MenuItem')]/a[@title='${valuetobeselected}']
    click link  //li[contains(@class, 'MenuItem')]/a[@title='${valuetobeselected}']

Select Record Type
    [Arguments]  ${testdata_row}
    select from list by value  ${record_type_select_loc}  ${testdata_row}
    click button  ${click_continue_btn_loc}

Select Record Type Li
    [Arguments]  ${recordtype}
    wait until element is visible  //span[text()='${recordtype}']/ancestor::div[2]//span[@class='slds-radio--faux']
    click element  //span[text()='${recordtype}']/ancestor::div[2]//span[@class='slds-radio--faux']
    click element  //div[@class='forceChangeRecordTypeFooter']//button/span[text()='Next']

# keywords to click new button from Page
Click On ${buttonname} TabPage Button
    wait until element is enabled  //td[@class='pbButton']//input[@title=${buttonname}]
    click button  //td[@class='pbButton']//input[@title=${buttonname}]

Click On ${buttonname} TabPage Button Li
    wait until element is enabled  //ul/li/a[@title=${buttonName}]  20s
    click element  //ul/li/a[@title=${buttonName}]

Click On Edit Window ${buttonname} Button
    Click On ${buttonname} TabPage Button

Click On Edit Window ${buttonname} Button Li
    wait until element is enabled  //div[contains(@class, 'modal-body')]/following::button[@title=${buttonname}]
    click button  //div[contains(@class, 'modal-body')]/following::button[@title=${buttonname}]

Verify SFDC Home Page
    wait until page contains element  ${home_loc}  50s
    sleep  2s
    Selenium2library.capture page screenshot  Homescreen.png
    sleep  2s

Verify SFDC Home Page Li
    wait until element is visible  ${home_page_li_loc}  25s
    sleep  2s
    Selenium2library.capture page screenshot  Homescreen.png
    sleep  2s

Click All App Launcher Li
    wait until element is enabled  ${App_launcher_Li_loc}
    click button  ${App_launcher_Li_loc}

Select ${tabname} From All Items Li
    wait until element is enabled  //h3[text()='All Items']//following::a[@title=${tabname}]  20s
    click link  //h3[text()='All Items']//following::a[@title=${tabname}]

Select Record From Tab Page Li
    [Arguments]  ${recordName}
    wait until element is enabled  //a[@data-refid='recordId' and @title='${recordName}']
    click link  //a[@data-refid='recordId' and @title='${recordName}']

# Keyword to navigate to Tab from AllTabs Page
Click On ${tabname} Tab
    wait until element is enabled  ${Alltabs_btn_loc}
    click image  ${Alltabs_btn_loc}
    wait until page contains element  //img[@title=${tabname}]
    click image  //img[@title=${tabname}]

Click On ${tabname} Tab Li
    Click All App Launcher Li
    Select ${tabname} From All Items Li

# keywords to verify record created successfully
Verify if ${record} is saved successfully
    wait until page contains element  //h2[contains(text(), 'Detail')]
    element should be visible  //h2[contains(text(), 'Detail')]
    Selenium2library.capture page screenshot  ${record}screen.png

Verify if ${record} is saved successfully Li
    wait until page contains element  //div[@role='application tablist']//a[@title='Details']
    element should be visible  //div[@role='application tablist']//a[@title='Details']
    Selenium2library.capture page screenshot  ${record}screen.png

# keywords to click record in a related list section
Click On Given Text In RelatedList Table
    [Arguments]  ${section}  ${text}  ${row}
    Click On Given Text In RelatedList Table  ${section}  ${text}  ${row}

Click On Given Text In RelatedList Table Li
    [Arguments]  ${section}  ${text}  ${row}
    Click On Given Text In RelatedList Table  ${section}  ${text}  ${row}

# keywords to click on related list section button
Click On ${relatedListname} Section ${buttonname} Button
    wait until element is enabled  //h3[text()=${relatedListname}]/following::input[@title=${buttonname}]
    click button  //h3[text()=${relatedListname}]/following::input[@title=${buttonname}]

Click On ${relatedListname} Section ${buttonname} Button Li
    wait until element is enabled  //h2[@id='header']//span[text()=${relatedListname}]/following::a[@title=${buttonname}][1]
    click button  //h2[@id='header']//span[text()=${relatedListname}]/following::a[@title=${buttonname}][1]