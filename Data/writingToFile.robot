*** Settings ***
Library  OperatingSystem
Library  String
Library  ${EXECDIR}/Utility/xpath_geneartor.py

*** Variables ***
${SFDC_Object}  Account

*** Test Cases ***
Writing Xpath To PageElements File
    @{xpath_values}  generateXpath  ${SFDC_Object}
    write_variable_in_file  @{xpath_values}

*** Keywords ***
write_variable_in_file
    [Arguments]  @{xpath_values}
    create file  ${EXECDIR}/Resources/MedvantageApp/PageElements/${SFDC_Object}_PageElements.robot  *** Variables ***
    append to file  ${EXECDIR}/Resources/MedvantageApp/PageElements/${SFDC_Object}_PageElements.robot  ${\n}
    :For  ${testdata_row}  in  @{xpath_values}
    \  append to file  ${EXECDIR}/Resources/MedvantageApp/PageElements/${SFDC_Object}_PageElements.robot  ${testdata_row}${\n}