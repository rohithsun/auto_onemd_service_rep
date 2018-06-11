*** Settings ***
Documentation    Suite description
Library  AppiumLibrary


*** Keywords ***

Select From DropDown
    [Arguments]  ${vlovtitle}    ${valuetobeselected}

    AppiumLibrary.click element  ${vlovtitle}
    AppiumLibrary.click element  //option[text()=\'${valuetobeselected}\']

Select From LookUp in Appuim
    [Arguments]  ${vlovtitle}    ${valuetobeselected}
#    ${replacelovtitle}=  replace string  ${lovtitle_Id}  lookuptitle  ${vlovtitle}
    AppiumLibrary.click element  //label[contains(text(),\'${vlovtitle}\')]/following::img[1]
    sleep  2
#    Selenium2Library.Select Window  New
    log to console  ${valuetobeselected}
    #Search the text in Searchframe
#    Selenium2Library.Select Frame  //*[@title='Search']
    AppiumLibrary.Input Text  lksrch  ${valuetobeselected}
    AppiumLibrary.click element  go
#    unselect Frame