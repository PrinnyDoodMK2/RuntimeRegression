*** Settings ***
Library  SeleniumLibrary
Resource
Test Setup
Test Teardown

*** Variables ***


*** Test Cases ***
Sample test case
    [documentation]  Google Test
    [tags]  regression  google  demo
    Open Browser    http://www.google.com   chrome
    Close Browser


*** Keywords ***


