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

