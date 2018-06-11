*** Settings ***
Documentation    Suite description
Resource  ../Data/DataManager.robot
Resource  ../Resources/common-variables.robot


*** Test Cases ***
Test title
    ${testdata_tc1} =  DataManager.Get CSV Data  ${TC1_PATH_CSV}
    :For  ${index}  ${testdata_row}  in enumerate  @{testdata_tc1}
    \  log to console  ${index}
    \  log to console  ${testdata_row}
    \  log to console  ${testdata_row['Profile']}