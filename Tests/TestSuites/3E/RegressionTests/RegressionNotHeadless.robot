*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Library             SeleniumLibrary
Resource            Variables.robot
Resource            Keywords.robot
#Test Setup      #Open Browser To Local Login Page
#Test Teardown   #Close Browser

*** Test Cases ***
