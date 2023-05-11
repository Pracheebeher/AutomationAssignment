*** Settings ***
Documentation    Testing Excel File download on https://contextures.com/xlsampledata01.html#data
Resource         ../Resources/Keywords/Generic/Keyword.robot
Resource         ../Resources/Keywords/Excel_Download/Keyword.robot

*** Test Cases ***
Excel File Download
  [Documentation]  Verify if the excel download works
  [Tags]    Regression
  [Setup]    Test Setup
  Given the user lands on the home page
  When the user clicks on the 'Office Supply Sales sample data workbook' link
  Then the file should be downloaded successfully in the local machine
  [Teardown]    Test TearDown