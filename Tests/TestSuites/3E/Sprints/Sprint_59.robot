#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Portfolio.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Portfolio.robot" is the robot file path to be executed

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Portfolio Regression
Library             SeleniumLibrary
#Library             AutoItLibrary
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
Disable & Enable Alarm through the panel button
    [documentation]  Through the Alarms Management panel, user can enable and disable an alarm
    [tags]  acceptance  regression  alarms  enale  disable  3714

    Login Acceptance
    Access Alarms Manager
    Sleep                               2s
    #Due to a strange behaviour where the page is slower than the process from the robot, use the following step
    Reload Page
    #Next steps will select one option from the list and open access to the disable button
    Click Element                       //*[contains(text(),'Inverter deviation')]
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[3]/table/tbody/tr[1]
    #To press the disable button
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[4]/div[1]/div[2]/div[1]/button
    #To press the enable button after a few seconds of disabling
    Sleep                               5s
    Click Element                       //*[@id="main-app"]/div[2]/div[2]/div[4]/div[1]/div[2]/div[2]/button
    #Final sleep to aknowledge the result
    Sleep                               5s