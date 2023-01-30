*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Alarms Regression
Library             SeleniumLibrary
Library             Screenshot
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Portfolio
Tags request for resource analysis
    [documentation]  Test quest to verify if there is a request for the tags of the Resource Analysis
    [tags]  acceptance  regression  portfolio  3771  sprint60  resource_analysis

    Login Acceptance
    Access Resource Analysis
    #To reload the assets due to robot working too fast
    Reload Page

    Sleep                   5s

#Alarms
Alarms Management - Search for Inverter
    [documentation]  Test case created to verify the search of an inverter in alarms management
    [tags]  acceptance  regression  alarms  search  filters  3723  sprint60

    Login Acceptance
    Access Alarms Manager
    #Changing the level from "All" to "Inverter"
    Click Element                       //div[@id='mui-component-select-level']
    Click Element                       //*[@id="menu-level"]/div[3]/ul/li[11]
    #Changing the inverter to another option by searching first - Search made for "Fabriano"
    Click Element                       //div[@id='mui-component-select-logical_device']
    Input Text                          //*[@id="menu-logical_device"]/div[3]/ul/li[1]/div/div[1]/input     Fabriano
    Click Element                       //*[@id="menu-logical_device"]/div[3]/ul/li[4]


Alarms Management - Check if button is the opposite from the present stat of an alarm exception
    [documentation]  The button after clicking an alarm exception should enable or disable depending on present state
    [tags]  acceptance  regression  alarms  3720  sprint60

    Login Acceptance
    Access Alarm Manager
    #Select an alarm with exceptions
    Click Element                       //Element
    #Click on an exception - in this case the exception is ""
    Click Element                       //Element
    #The following keyword will verify if the button is the same as the present state - Not OK if such happens
    Page Should Contain Button          //Element

#Analysis

#Dashboards
Template Dashboards - Object Scroll Down Test
    [documentation]  Test case to verify the scrolling behaviour
    [tags]  acceptance  dashboards  object  scroll  3666  sprint60

    Login Acceptance
    Access Dashboards Manager
    #Select a template dashboard - in thi casa, "RS template" or "3666" as filter to select
    Click Element           //*[@id="main-app"]/div[1]/div[1]/nav/div/div[3]/div/ul/li/div[2]/ul/div/div/li[1]/div[1]/div[1]
    Wait Until Element Is Visible       //*[@id="main-app"]/div[1]/div[1]/nav/div/div[3]/div/ul/li/div[2]/ul/div/div/li[1]/div[2]/ul/div/div/li[2]/div[1]/div[2]/a/span
    Click Element           //*[@id="main-app"]/div[1]/div[1]/nav/div/div[3]/div/ul/li/div[2]/ul/div/div/li[1]/div[2]/ul/div/div/li[2]/div[1]/div[2]/a/span
    Reload Page
    Wait Until Element Is Visible       //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input
    Input Text              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     3666
    Press Keys              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     ENTER
    Wait Until Element Is Visible       //body/div[1]/div/div[3]/div[2]/div[3]/div[1]/div/div/div/div/div/div/div/div/table/tbody/tr/td[2]/div/div/span     20s
    Click Element           //body/div[1]/div/div[3]/div[2]/div[3]/div[1]/div/div/div/div/div/div/div/div/table/tbody/tr/td[2]/div/div/span
    #Open the object list
    Wait Until Element is Visible       //*[@id="mui-component-select-level"]
    Click Element           //*[@id="mui-component-select-level"]
    #Performing a scroll till reaching the end of the list
    Scroll Element Into View            //*[@id="menu-level"]/div[3]/ul/li[251]
    Sleep                   2s
    Scroll Element Into View            //*[@id="menu-level"]/div[3]/ul/li[501]
    Sleep                   2s
    Scroll Element Into View            //*[@id="menu-level"]/div[3]/ul/li[751]
    #Test will end here. Scrolling requires a small break for each section to load.
