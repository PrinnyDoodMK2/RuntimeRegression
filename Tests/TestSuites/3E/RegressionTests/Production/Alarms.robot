#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Alarms.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Alarms.robot" is the robot file path to be executed

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Alarms Regression
Library             SeleniumLibrary
Resource            ../Variables&Keywords/Variables.robot
Resource            ../Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Alarms Test Cases
"Use Default" button check
    [documentation]  The button "Use Default" should not be interactable and visible to the user
    [tags]  acceptance  regression  alarms  3715

    Login Acceptance
    Wait Until Element Is Visible       //*[@id="root"]/div/div[2]/div[1]/a[4]/div/span
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]/div/span
    Wait Until Element Is Visible       //*[@id="main-app"]/div[1]/div[1]/nav/div/div[2]/div/ul/li/div/div[2]/span    5s
    Click Element                       //*[@id="main-app"]/div[1]/div[1]/nav/div/div[2]/div/ul/li/ul/div/div/li[1]
    Wait Until Element is Visible       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[1]/td[3]    20s
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[1]/td[3]

Add & enable a new exception
    [documentation]  After adding an exception, 'Enable Exception' button should be displayed instead of 'Enable'
    [tags]  acceptance  regression  alarms  exception  3791

    Login Acceptance
    Access Alarms Manager

