#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Users.robot
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
#Users test cases
