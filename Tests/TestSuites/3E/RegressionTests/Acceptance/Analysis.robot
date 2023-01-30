# To run the test cases, use the following command in the terminal:
# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Analysis.robot" is the robot file path to be executed

#For load testing, swarm was installed. Refer to the following URLs for further information:
#https://iwconnect.com/load-testing-with-robot-framework-swarm/
#https://github.com/damies13/rfswarm

#To run swarm, use the command:
#python3 rfswarm.py

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Analysis Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Analysis Test Cases
Access Analysis/Views Manager
    [documentation]  After login, user should be able to access analysis/views management.
    [tags]  acceptance  regression  analysis  views  management  demonstration

    Login Acceptance
    Access Views Manager
    Location Should Be      https://admin.3esynaptiq.com/sq2020/viewsmanager/views/list
    Sleep                   1s


Editing View Type of an Already Existing View
    [documentation]  User should be able to edit view type if permissions are met
    [tags]  acceptance  regression  analysis  views  edit  qackathon  3471

    Login Acceptance
    Access Views Manager
    Location Should Be      https://admin.3esynaptiq.com/sq2020/viewsmanager/views/list
    #Select the option to edit a view
    Click Element           //*[@id="action_menu_undefined"]/div/svg
    Click Element           //*[contains(text(),'Edit')]
    Sleep                   2s
    Location Should Be      https://admin.3esynaptiq.com/sq2020/viewsmanager/edit/views/be2_appobj_212503
    Capture Page Screenshot     ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_views_manager_reference_1.png
    #Edit View Type
    Click Element           //*[@id="main-app"]/div/div[2]/div[2]/div[1]/div/div/div/button[1]
    Click Element           //*[@id="main-app"]/div/div[2]/div[2]/div[1]/div[2]/div[6]
    Click Element           //*[@id="main-app"]/div/div[2]/div[2]/div[1]/div[1]/div/div/button[2]
    Sleep 2s
    Capture Page Screenshot     ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_views_manager_VR_1.png
    #Compare the change with WatchUI
    Compare Images                          ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_views_manager_reference_1.png         ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_views_manager_VR_1.png      save_folder=${VR_COMPARISON}      ssim=1.00


Indicator validation after changing view type
    [documentation]  When user changes view type by creating or editing a new view, already selected indicators should remain selected and visible.
    [tags]  acceptance  regression  analysis  views  indicators  create  edit  qackathon  2580

    Login Acceptance
    Access Views Manager
    Location Should Be      https://admin.3esynaptiq.com/sq2020/viewsmanager/views/list
    #Create New View Path
    Click Element           explore new view
    Click Element           view type
        #add data
    Click Element           add data
        #with or without variable object
    Click Element           toggle variable object
        #select a level - in this case it will be "inverter"
    Click Element           drop down opens
    Click Element           inverter
    Click Element           all inverters
        #select the indicators
    Click Element           Availability selected
    Click Element           Energy selected
        #change view type
    Click Element           View Type
    Capture Page Screenshot     base screeshot
    Click Element           Select another view type
    Capture Page Screenshot     compared screenshot
        #compare base and compared screenshot with WatchUI
    Compare Images          Compare
    Sleep                   2s

    #Edit View Path
    Click Element           Close New View
    Access Views Manager
        #Click the 3dots to select Edit
    Click Element           3dots
    Click Element           Edit


Loading animation when creating views with a heavy load of data
    [documentation]  A loading icon or animation should be displayed to informe the user that the information if being loaded
    [tags]  acceptance  regression  analysis  views  qackathon  loading  animation  3956

    Login Acceptance
    Access Views Manager
    #Select to Explore New View
    Click Element           Element
    #Set a view type with granularity
    Click Element           Element
    #Select a lot of data to load









