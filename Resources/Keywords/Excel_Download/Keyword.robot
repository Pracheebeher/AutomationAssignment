*** Settings ***
Library          OperatingSystem
Resource         ../../Objects/Excel_Download.robot
Resource         ../../TestData/Excel_Download.robot

*** Keywords ***
the user clicks on the 'Office Supply Sales sample data workbook' link
    Wait Until Keyword Success  Click Href    ${excel_file_hyper_link}

Click Href
    [Arguments]   ${locator}
    ${element}   Get WebElement    ${locator}
    ${href}    Get Element Attribute    ${element}    href
    Execute JavaScript    window.location.href='${href}'

Check Download
    ${downloads}   Get File List
    ${downloaded_file}    Set Variable    ${download_dir}/${file_name}
    Run Keyword If  '${downloaded_file}' in '${downloads}'  Log File downloaded successfully.  level=INFO  #Verifies downloaded file
    ... ELSE Fail Download failed: file not found.

the file should be downloaded successfully in the local machine
    Wait Until Keyword Succeeds   30S   1S   File Should Exist    ${download_dir}/${file_name}

Get File List
    ${files}   List Files In Directory    ${download_dir}
    Log    List of Files   ${files}