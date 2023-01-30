#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Analysis.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Analysis.robot" is the robot file path to be executed

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Analysis Regression
Library             SeleniumLibrary
Resource            ../Variables&Keywords/Variables.robot
Resource            ../Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Analysis Test Cases
Accessing Analysis
    [documentation]  After login, user should be able to access analysis/views management.
    [tags]  acceptance  regression  analysis  views  management
    Open Browser To ACCEPTANCE Login Page
    Input Text              name=username      ${ACCEPTANCE USERNAME 1}
    Input Password          name=password       ${ACCEPTANCE PASSWORD 1}
    Click Element           class=button
    Element Should Be Visible   //span[@class='sq-icon sq-icon--activity']
    Click element           //span[@class='sq-icon sq-icon--activity']
    Location Should Be      https://admin.3esynaptiq.com/sq2020/viewsmanager/views/list
    Sleep                   4s
    [Teardown]  Close Browser
