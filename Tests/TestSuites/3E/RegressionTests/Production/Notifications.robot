#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Notifications.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i viewsORalarms" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Portfolio.robot" is the robot file path to be executed

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Library             SeleniumLibrary
#Library             AutoItLibrary
Resource            /Users/runtime/PycharmProjects/RuntimeRegression/Tests/TestSuites/3E/RegressionTests/Variables&Keywords/Variables.robot
Resource            /Users/runtime/PycharmProjects/RuntimeRegression/Tests/TestSuites/3E/RegressionTests/Variables&Keywords/Keywords.robot
#Test Setup          Open Browser To Local Login Page
#Test Teardown       Close Browser

*** Test Cases ***
#Notifications Test Cases
Accessing Notifications
    [documentation]  After login, user should be able to check notifications management.
    [tags]  acceptance  regression  notifications  management
    Open Browser To ACCEPTANCE Login Page
    Input Text              name=username      ${ACCEPTANCE USERNAME 1}
    Input Password          name=password       ${ACCEPTANCE PASSWORD 1}
    Click Element           class=button
    Element Should Be Visible   //*[@href='/sq2020/alarmsnotificationmanager']
    Click element           //*[@href='/sq2020/alarmsnotificationmanager']
    Location Should Be      https://admin.3esynaptiq.com/sq2020/alarmsnotificationmanager
    Sleep                   4s
    [Teardown]  Close Browser