*** Settings ***
Documentation  This data manager is to get data from csv file
Library  ../Utility/csvreader.py


*** Variables ***
${testdatarow}  None

*** Keywords ***
Get CSV Data
    [Arguments]  ${filepath}
    ${testdata}=  read csv file  ${filepath}
    [Return]  ${testdata}

Get CSV Data Row
    [Arguments]  ${filepath}
    ${testdata}=  read csv file  ${filepath}
    :FOR  ${data}  IN  @{testdata}
    \  set global variable  ${testdatarow}
    \  ${testdatarow} =  set variable  ${data}
    [Return]  ${testdatarow}
