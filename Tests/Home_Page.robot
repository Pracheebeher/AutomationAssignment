*** Settings ***
Resource   ../Resources/Keywords/Generic/Keyword.robot
Resource  ../Resources/Keywords/Home_Page/Keyword.robot

*** Test Cases ***
Counting Different Items
  [Documentation]  Verify the number of different/Unique items
  [Tags]    Smoke
  [Setup]    Test Setup
  Given the user lands on the home page
  When the user scrolldown to the table
  Then the user should see how many different items are there
  [Teardown]    Test TearDown

Item Less Than 5 Units
  [Documentation]  Verify if there is an item with less than 5 units
  [Tags]    Smoke
  [Setup]    Test Setup
  #Verifying if there in an item in an order with less than 5 units
  Given the user lands on the home page
  When the user scrolldown to the table
  Then the user should see the item/items with less than 5 units
  [Teardown]    Test TearDown

Pencil Less Than 5 Units
  [Documentation]  Verify if there is a pencil with less than 5 units
  [Tags]    Regression
  [Setup]    Test Setup
  #Verifying if the number of pencils in an order is less than 5 units
  Given the user lands on the home page
  When the user scrolldown to the table
  Then the user should see if there is a pencil with less than 5 units
  [Teardown]    Test TearDown

Most Expensive Item in the list
  [Documentation]  Verify the most expensive item in the list
  [Tags]    Regression
  [Setup]    Test Setup
  #Verifying the most expensive item in the list.
  Given the user lands on the home page
  When the user scrolldown to the table
  Then the user should see the most expensive item in the list
  [Teardown]    Test TearDown

Check website in mobile view and find most expensive item in the list
  [Documentation]  Verify the numbers of sample data in the webpage
  [Tags]    Smoke
  [Setup]    Test Setup
  #Verifying the most expensive item in the list in mobile view.
  Given the user lands on the home page
  When the user switches to mobile view and scrolls down to the table
  Then the user should see the most expensive item in the list
  [Teardown]    Test TearDown

Check website in mobile view and verify scrolling behaviour of website
  [Documentation]  Verify the numbers of sample data in the webpage
  [Tags]    Smoke
  [Setup]    Test Setup
  #Checking website in mobile view and verify scrolling behaviour of website
  Given the user lands on the home page
  When the user switches to mobile view
  Then the user scrolls down to the bottom of the page
  [Teardown]    Test TearDown

Finding Numbers of Sample Data in the webpage
  [Documentation]  Verify the numbers of sample data in the webpage
  [Tags]    Smoke
  [Setup]    Test Setup
  Given the user lands on the home page
  When the user scrolldown to the sample data section
  Then the user should see how many different sample datas are there in the webpage
  [Teardown]    Test TearDown
