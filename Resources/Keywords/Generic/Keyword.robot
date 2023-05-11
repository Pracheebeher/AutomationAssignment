*** Settings ***
Library           SeleniumLibrary
Resource          ../../Objects/Generic.robot
Resource          ../../TestData/Generic.robot


*** Keywords ***
the user lands on the home page
    the user clicks the 'Accept all' button

the user clicks the 'Accept all' button
    #below line verifies if "gdpr popup" is visible
    ${element_exists}  Run Keyword And Return Status  Element Should Be Visible  ${gdpr_popover}
    #below line check if "gdpr popup" is visible, if it is visible then it locates and clicks the accept all button
    Run Keyword If  '${element_exists}' == 'True'   locate and click 'Accept all' button

locate and click 'Accept all' button
    Wait Until Keyword Success  Select Frame    ${gdpr_popover}
    Wait Until Keyword Success  Click Element   ${accept_button}

Wait Until Keyword Success
    [Arguments]  ${Keyword}  @{KeywordArgs}
    Wait Until Page Contains Element    @{KeywordArgs}
    Wait Until Keyword Succeeds   @{timeout}    @{timeout_interval}   ${Keyword}   @{KeywordArgs}

the website should be displayed in mobile view
    Capture Page Screenshot
    Set Window Size    1280    800    # restore original window size

Test Setup
    FOR    ${browser}    IN    @{browsers}
        Open Browser    ${url}    ${browser}
    END
    Maximize Browser Window

Test TearDown
    Delete All Cookies
    Close All Browsers



