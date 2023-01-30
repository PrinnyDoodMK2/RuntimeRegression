# To run the test cases, use the following command in the terminal:
# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Alarms.robot" is the robot file path to be executed

#For load testing, swarm was installed. Refer to the following URLs for further information:
#https://iwconnect.com/load-testing-with-robot-framework-swarm/
#https://github.com/damies13/rfswarm

#To run swarm, use the command:
#python3 rfswarm.py

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Alarms Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Alarms Test Cases
Access Alarms Manager
    [documentation]  This test will simulate a user login and access to the Alarms Manager
    [tags]  acceptance  regression  alarms  manager  demonstration  sprint60

    Login Acceptance
    Access Alarms Manager


"Use Default" button check
    [documentation]  The button "Use Default" should not be interactable and visible to the user
    [tags]  acceptance  regression  alarms  manager  3715

    Login Acceptance
    Access Alarms Manager
    #Capture Page Screenshot             ${VR_REFERENCE_IMAGE_FOLDER}/alarms_manager_problem_1.png
    Sleep                               2s
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]
    Wait Until Element is Visible       //*[@id="mui-component-select-level"]   10s
    Press Keys                          //*[@id="main-app"]/div[2]/div[2]/div[1]/div[1]/div/div[1]/input     inverter deviation  ENTER
    Sleep                               10s
    #Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[4]/div[1]/div[2]/div[2]/button
    #Reload Page
    #Wait Until Element is Visible       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[1]/td[3]    180s
    #Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[1]/td[3]


Add & enable a new exception
    [documentation]  After adding an exception, 'Enable Exception' button should be displayed instead of 'Enable'
    [tags]  acceptance  regression  alarms  manager  exception  3791

    Login Acceptance
    Access Alarms Manager
    #Necessary to circumvent the present issue in the alarms manager
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]


Disable & Enable Alarm through the panel button
    [documentation]  Through the Alarms Management panel, user can enable and disable an alarm
    [tags]  acceptance  regression  alarms  manager  enale  disable  3714  sprint59

    Login Acceptance
    Access Alarms Manager
    #Necessary to circumvent the present issue in the alarms manager
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]
    Sleep                               2s
    #Due to a strange behaviour where the page is slower than the process from the robot, use the following step if needed
    #Reload Page
    #Next steps will select one option from the list and open access to the disable button
    Click Element                       //*[contains(text(),'Inverter deviation')]
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[1]
    #To press the disable button
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[4]/div[1]/div[2]/div[1]/button
    #To press the enable button after a few seconds of disabling
    Sleep                               5s
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[4]/div[1]/div[2]/div[2]/button


Alarms Management - Search for Inverter
    [documentation]  Test case created to verify the search of an inverter in alarms management
    [tags]  acceptance  regression  alarms  search  manager  filters  3723  sprint60

    Login Acceptance
    Access Alarms Manager
    #Necessary to circumvent the present issue in the alarms manager
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]
    #Changing the level from "All" to "Inverter"
    Click Element                       //div[@id='mui-component-select-level']
    Click Element                       //*[@id="menu-level"]/div[3]/ul/li[11]
    #Changing the inverter to another option by searching first - Search made for "Fabriano"
    Click Element                       //div[@id='mui-component-select-logical_device']
    Input Text                          //*[@id="menu-logical_device"]/div[3]/ul/li[1]/div/div[1]/input     Fabriano
    Click Element                       //*[@id="menu-logical_device"]/div[3]/ul/li[4]


Alarms Management - Check if button is the opposite from the present stat of an alarm exception
    [documentation]  The button after clicking an alarm exception should enable or disable depending on present state
    [tags]  acceptance  regression  alarms  manager  3720  sprint60

    Login Acceptance
    Access Alarms Manager
    #Necessary to circumvent the present issue in the alarms manager
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]
    #Select an alarm with exceptions. In this case, the alarm will be "Inverter Error Code"
    Press Keys                          //*[@id="main-app"]/div[2]/div[2]/div[1]/div[1]/div/div[1]/input  Inverter Error Code  ENTER
    #Expand the exceptions
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[2]/td[1]/div/span[2]
    #Click on an exception - in this case the exception is "BE Brugge 04"
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[8]/td[1]/div
    #The following keyword will verify if the button is the same as the present state - Not OK if such happens
    Page Should Contain Button          //*[@id="main-app"]/div[2]/div[2]/div[4]/div[1]/div[2]/div[2]/button









