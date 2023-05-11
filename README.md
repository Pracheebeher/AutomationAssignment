
# Robot Framework Assignment


- [Introduction](https://www.python.org/)
- [Keyword Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Installation]()
- [Web browser driver](https://www.selenium.dev/selenium/docs/api/py/index.html#drivers )
- [Usage]()
- [Documentation]()
- [Execution]()
- [Result]()



# Introduction

This project tests the data from a table in [Sample Data Page ](https://contextures.com/xlsampledata01.html#data) and verifies some data elements like the unique number of Items in the table.
It also verifies the downloading operation in the website. Testscripts have been written in BDD (Behaviour Driven Development) style.

# Keyword Documentation

See [keyword documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) for available keywords and more information about the library in general.

# Installation

### Note: All the below steps are excuted on macOS Monterey version 12.2.1

## Preconditions
Python (Before installing Robot Framework, you need to install Python)  
Browser (I prefer Chrome )  
Chromedriver (compatible with your chrome version)
- Install [Python](https://www.python.org/) from the official Python website.


- Install [Robot Framework](https://robotframework.org/): Once you have Python installed, you can use pip (Python Package Index) to install [Robot Framework](https://robotframework.org/). Open a command prompt or terminal window and type the following command:

```bash
pip install robotframework
```

- Install [Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html): You install the [Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) using pip with the following command:

```bash
pip install robotframework-seleniumlibrary
```
- [Install Pycharm (IDE)](https://www.jetbrains.com/pycharm/download/#section=mac) and then set robot plugin in your IDE
```bash
Goto preferences>plugins>marketplace> Search 'Robot Framework support', 'Robot Framework helper', 'Run Robot framework TestCase' and 'Run Robot framework file' over there. Add all these into your plugin.
Restart the Pycharm.
``` 

## Web browser driver
After installing the library, you need to install browser and operating system specific browser drivers for all the browsers.
More information about drivers can be found from the link:
The approach to install a browser driver is downloading a right driver, such as chromedriver for Chrome, and placing it into a directory that is in [PATH](https://en.wikipedia.org/wiki/PATH_(variable)). 
This Project has been tested on Chrome and Firefox browser. And the Drivers were installed using the below links:
https://www.selenium.dev/selenium/docs/api/py/index.html#drivers 

Note: In order to run this project You need to install chrome driver from https://chromedriver.chromium.org/downloads
And 
also you need to install geckodriver from https://github.com/mozilla/geckodriver/releases

## Usage

A specific usecase has been written in BDD (Behaviour Driven Development) style to find the distinct items of the Item Column from the Table given in the home page.

```bash
*** Test Cases ***
Counting Different Items
[Documentation] Verify the number of different/Unique items
[Tags] Smoke
[Setup] Test Setup
Given the user lands on the home page
When The user scrolldown to the table
Then the user should see how many different items are there
[Teardown] Test TearDown
```
# Documentation
Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). I have implemnted POM as design pattern to write my Test script.

## Projcet Structure

1. [Requirements.txt]()- Requirement file defines all the basic requirenments which are used in this project.  
2. [Keyword]()- Keyword folder contains keyword.robot file which contains all basic common keyword used in testcases.
3. [Objects]()- Object file defines all the locators used in project.   
4. [Testcases]()- From the name itself it is clear that this file defines all the testcases which are implemented.  
5. [Assignment]()- This is the main file. By executing this file all the testcases will run accordingly.


# Execution


 Note1: Make sure you are inside your project folder before executing the below commands. 

 Note2: Before running this project make sure you change the Path where the download will happen at this location" ${download_dir}    /Users/pracheebehera/Downloads"
 
After installations and with all other preconditions in place, you can run this project on the command line by using the robot command:
```bash
robot -d Results Tests
```

To run single testcase use command:
```bash
robot -d Results -t "Countingdiffrentitems" Tests/Home_Page.robot
```
To run Multiple testcases use command:
```bash
robot -d Results -t "countingdifferentitems" -t  "Itemlessthan5units" Tests/Home_Page.robot
```
Tags: Robot framework gives the feature of tags. For more details refer [Robot Uesr Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#id540). Use tags while execution to run the categorized testcases, below is a sample for the same.
```bash
robot -i Regression Home_Page.robot 
```
If you want to rerun failed testcases that is also possible via "Robotframework-retryfailed". And command to execute this is as follows;
```bash
robot --listener RetryFailed:1 Tests/Home_Page.robot Tests/Excel_Download.robot
```
The '1' in the above command refers to the number of retries.
# Result
You get the results like log, output, log & screenshots(Incase of Failure) file when you execute your Test.
```bash
robot -d Results Tests 
```
These results showcase a lot about the data that is here in the table
["1a) Office Supply Sales Table"](https://contextures.com/xlsampledata01.html#data)
e.g: Most Expensive Item in the list. A lot more analysis can be done on this table to find out the selling pattern of the store. 
(Ofcourse this would need more data in the sample table)

