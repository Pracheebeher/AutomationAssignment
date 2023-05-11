*** Settings ***
Library           SeleniumLibrary
Library           ../../../Library/Collections.py
Resource         ../../Objects/Generic.robot
Resource         ../../Objects/Home_Page.robot
Resource         ../../TestData/Home_Page.robot

*** Keywords ***

the user scrolldown to the sample data section
    Wait Until Keyword Success   Wait Until Element Is Visible   ${sampledatasection}

the user should see how many different sample datas are there in the webpage
    ${count1}=       Get Element Count  ${sampledatasectioncolumn1}
    ${count2}=       Get Element Count  ${sampledatasectioncolumn2}
    ${total_count}=  Evaluate  ${count1} + ${count2}
    Log To Console   The total count is: ${total_count}

the user scrolldown to the table
    Wait Until Keyword Success   Wait Until Element Is Visible   ${table}

the user switches to mobile view and scrolls down to the table
    the user switches to mobile view
    the user scrolldown to the table

the user switches to mobile view
    Set Window Size    414    736    #iPhone 6/7/8 screen resolution

the user scrolls down to the bottom of the page
    Wait Until Page Contains Element    ${copyright_text}

the user should see how many different items are there
    ${column_elements}    Get WebElements    ${item_column}
    ${all_elements}    Create List
    ${all_elements}  Remove Column Name From List   ${column_elements}   ${item_column_name}
    ${unique_elements}   Remove Duplicates   ${all_elements}
    ${number_of_unique_elements}   Get Length  ${unique_elements}
    Log To Console    Number of Unique Items: ${number_of_unique_elements}

the user should see the item/items with less than 5 units
    ${column_units_elements}    Get WebElements    ${units_column}
    ${column_item_elements}    Get WebElements    ${item_column}
    ${units_elements}    Create List
    ${item_elements}    Create List
    ${units_elements}   Remove Column Name From List   ${column_units_elements}   ${units_column_name}
    ${item_elements}   Remove Column Name From List   ${column_item_elements}   ${item_column_name}
    ${units_decimal_elements}    Create List
    ${units_decimal_elements}   Convert List Of String To List Of Number   ${units_elements}
    ${less_than_5}    Create List
    FOR    ${element}    IN    @{units_decimal_elements}
        Run Keyword If    ${element} < 5   Append To List    ${less_than_5}    ${element}
    END
    ${number_of_items_less_than_5}   Get Length  ${less_than_5}
    ${min_units_quantity}    Evaluate    min(${units_decimal_elements})
    Log  Minimum unit quantity ${min_units_quantity}
    Run Keyword If   ${min_units_quantity} < 5  Log To Console   ${number_of_items_less_than_5} item/items less than 5 units   ELSE   Log To Console  There is no item less than 5 units

the user should see if there is a pencil with less than 5 units
    ${column_units_elements}   Get WebElements    ${units_column}
    ${column_item_elements}   Get WebElements    ${item_column}
    ${units_elements}   Create List
    ${item_elements}   Create List
    ${units_elements}  Remove Column Name From List   ${column_units_elements}   ${units_column_name}
    ${item_elements}  Remove Column Name From List   ${column_item_elements}   ${item_column_name}
    ${indices_item_pencil}   Create List
    ${index}   Set Variable   0
    # This "for loop" iterates and creates a list of indices where pencil existed in an order
    FOR    ${element}    IN    @{item_elements}
        Run Keyword If   '${element}' == '${item_pencil_name}'   Append To List   ${indices_item_pencil}   ${index}
        ${index}  evaluate  ${index} + 1
    END
    ${units_pencil}    Create List
    # This "for loop" iterates and creates a list with unit's mapped to the pencil item
    FOR   ${index}  IN  @{indices_item_pencil}
        ${unit_pencil}   Get From List   ${units_elements}   ${index}
        Append To List   ${units_pencil}   ${unit_pencil}
    END
    ${units_decimal_pencil}    Create List
    ${units_decimal_pencil}   Convert List Of String To List Of Number   ${units_pencil}
    Log   lets check ${units_decimal_pencil}
    ${min_unit_pencil}    Evaluate    min(${units_decimal_pencil})
    Log  Minimum unit of pencil ${min_unit_pencil}
    Run Keyword If  ${min_unit_pencil} < 5   Log To Console  Yes,there are pencils less than 5 units   ELSE   Log To Console  No,there are no pencils less than 5 units

the user should see the most expensive item in the list
    ${column_price_elements}    Get WebElements    ${price_column}
    ${column_item_elements}    Get WebElements    ${item_column}
    ${price_elements}   Create List
    ${item_elements}   Create List
    ${price_elements}  Remove Column Name From List   ${column_price_elements}   ${price_column_name}
    ${item_elements}  Remove Column Name From List   ${column_item_elements}   ${item_column_name}
    ${price_decimal_elements}   Create List
    ${price_decimal_elements}   Convert List Of String To List Of Number   ${price_elements}
    ${max_unit_price}    Evaluate    max(${price_decimal_elements})
    Log  Maximum unit price ${max_unit_price}
    ${index_max_unit_price}  Get Index From List  ${price_decimal_elements}   ${max_unit_price}
    ${item_max_unit_price}   Get From List   ${item_elements}   ${index_max_unit_price}
    Log To Console  Expensive item by unit price is ${item_max_unit_price}

Remove Column Name From List
    [Arguments]    ${input_list}    ${column_name}
    ${updated_list}  Create List
    FOR    ${element}    IN    @{input_list}
        ${text}    Get Text    ${element}
        Run Keyword If    '${text}' != '${column_name}'  Append To List    ${updated_list}    ${text}
    END
    [Return]    ${updated_list}

Convert List Of String To List Of Number
    [Arguments]    ${input_list}
    ${updated_list}  Create List
    FOR    ${value}    IN    @{input_list}
        ${decimal_value}    Convert To Number    ${value}
        Append To List    ${updated_list}    ${decimal_value}
    END
    [Return]    ${updated_list}




