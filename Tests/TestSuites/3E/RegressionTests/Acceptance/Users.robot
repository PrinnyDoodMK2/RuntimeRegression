#To run the test cases, use the following command in the terminal:
# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance/Users.robot
# "-d Results/RuntimeResults/AcceptanceResults" is where the results will be saved
# "-i viewsORalarms" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Users.robot" is the robot file path to be executed

#For load testing, swarm was installed. Refer to the following URLs for further information:
#https://iwconnect.com/load-testing-with-robot-framework-swarm/
#https://github.com/damies13/rfswarm

#To run swarm, use the command:
#python3 rfswarm.py

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Users Manager Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Users test cases
Access Users Manager
    [documentation]  This test case will simulate the login and access to the Users Manager
    [tags]  acceptance  regression  users  demonstration  access

    Login Acceptance
    Access Users Manager
    Sleep                                   1s
    Capture Page Screenshot                 ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_users_manager_reference_1.png


Users Manager - Visual Regression
    [documentation]  This test case will performe a visual regression of the Users Manager list
    [tags]  acceptance  regression  visualregression  vr  users  demonstration

    Login Acceptance
    Access Users Manager
    Capture Page Screenshot                 ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_users_manager_visual_regression_1.png
    Sleep                                   3s
    Compare Images                          ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_users_manager_reference_1.png         ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_users_manager_visual_regression_1.png      save_folder=${VR_COMPARISON}      ssim=1.00


Users - Account & Preferences
    [documentation]  Test case to verify if Account & Preferences is accessible
    [tags]  acceptance  regression  users  accountpreferencesaccess

    Login Acceptance
    Access Account & Preferences


Translations - Language Change
    [documentation]  Test case to validate language change in the application
    [tags]  acceptance  regression  users  accountpreferences  translations

    Login Acceptance
    Access Account & Preferences
    #Select the option Language & Timezone
    Click Element   //*[@id="language_timezone"]
    Page Should Contain     Language
    Page Should Contain Element     //*[@id="mui-component-select-language"]
    #Select the French language
    Click Element   //*[@id="mui-component-select-language"]
    Click Element   //*[@id="menu-language"]/div[3]/ul/li[2]
