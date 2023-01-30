#To run the test cases, use the following command in the terminal:
# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance/Dashboards.robot
# "-d Results/RuntimeResults/AcceptanceResults" is where the results will be saved
# "-i acceptanceAND3666" are the tags selected to run the specific test cases. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptanec/Dashboards.robot" is the robot file path to be executed

#For load testing, swarm was installed. Refer to the following URLs for further information:
#https://iwconnect.com/load-testing-with-robot-framework-swarm/
#https://github.com/damies13/rfswarm

#To run swarm, use the command:
#python3 rfswarm.py

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Dashboards Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Dashboard Test Cases
Access Dashboards Manager
    [documentation]  After login, user should be able to access the dashboard management.
    [tags]  acceptance  regression  dashboard  management  demonstration  sprint60

    Login Acceptance
    Access Dashboards Manager


Create new custom dashboard
    [documentation]  Create a new custon dashboard. This test should be ran togather with "Delete New Dashboard".
    [tags]  acceptance  regression  dashboard  creation

    Login Acceptance
    Element Should Be Visible     class=icon__container
    Sleep                   1s
    Click Element           //a[@href='/sq2020/dashboardmanager/dashboards/all/list']
    Click Element           class=sq-icon--plus-circle
    Click Element           //*[@id="mui-component-select-Dashboard type"]/span
    Click Element           //*[@id="menu-Dashboard type"]/div[3]/ul/li[2]
    Click Element           class=save__button   #//*[contains(text(),'Next')]
    Drag And Drop           //*[@id="views"]/div/div[1]     //*[contains(text(),'Drag Elements Here')]
    Sleep                   1s
    Click Element           class=save__button   #//*[contains(text(),'Next')]
    Input Text              name=name           Robot Custom Dashboard
    #Click Element At Coordinates           656   31
    #Press Keys              //input[@name='name' and @class='input_name_area']       Robot Custom Dashboard

    Sleep                   1s
    Click Element           //*[@class='css-1g6gooi']
    Press Keys              //*[@class='css-1g6gooi']       SQID test tag
    Press Keys              //*[@class='css-1g6gooi']       ENTER
    Input Text              class=input_description_area    Robot description text
    Sleep                   2s
    Click Element           //*[contains(text(),'Next')]
    Click Element           //*[@id="mui-component-select-share-with"]
    Click Element           //*[@id="menu-share-with"]/div[3]/ul/li[3]
    Click Element           //*[contains(text(),'+ Add user')]
    Press Keys              //*[@class='add-share__value-container add-share__value-container--has-value css-tcnfoz']       Runtime Revolution
    Press Keys              //*[@class='add-share__value-container add-share__value-container--has-value css-tcnfoz']       ENTER
    #Click Element           //*[contains(text(),'Save & Close')]


Delete new dashboard
    [documentation]  Test case "Create New Custom Dashboard" required before running this test case.
    [tags]  acceptance  regression  dashboard  deletion

    Login Acceptance
    Element Should Be Visible     class=icon__container
    Click Element           //a[@href='/sq2020/dashboardmanager/dashboards/all/list']
    Input Text              //input[@placeholder='Search']          robot
    Press Keys              //input[@placeholder='Search']          ENTER
    Click Element           //div[@id='action_menu_be2_appobj_206641']//div[@class='action-menu__icon']//*[name()='svg']//*[name()='path' and contains(@d,'M12 8c1.1 ')]
    #Click Element           //span[contains(text(),'Delete')]


Changing Dashboard Settings - 3 dots
    [documentation]  This will test when the user makes changes to the dashboard settings when accessing with the 3dots
    [tags]  acceptance  dashboards  settings  3dots  3599

    Login Acceptance
    Access Dashboards Manager
    #After accessing dashboards, a search will be performed
    Input Text              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     3599
    Press Keys              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     ENTER
    #Selecting the 3 dots to access the dashboard settings
    Click Element           //div[@id='action_menu_be2_appobj_210913']//div[@class='action-menu__icon']
    Click Element           //*[@id="action-menu__popup"]/span[2]/span[2]
    #Setting changes in the Organization tab
    Input Text              name=name       RS 3599 changes by robot
    Press Keys              //*[contains(text(),'Type to search and add tags')]      SQID test tag 3
    Press Keys              //*[contains(text(),'Type to search and add tags')]      ENTER
    Press Keys              class=input_description_area    , changes by robot
    #Changing to the Application tab
    Click Element           //body/div[4]/div[4]/div[1]/div/div/div/button[2]/span/span
    #Adding a new row and setting it with valid new information
    Click Element           class=sq-icon--add-circle
    Click Element           //*[@id="mui-component-select-destination"]
    #Setting to Preview Panel
    Click Element           //*[@id="mui-component-select-destination"]
    #Setting the "Apply to" to inverter
    Click Element           //*[@id="mui-component-select-apply-to"]//body/div[4]/div[4]/div[2]/div/div/div[5]
    Click Element           //*[@id="menu-apply-to"]/div[3]/ul/li[20]//body/div[4]/div[4]/div[2]/div/div/div[5]
    #Select the inverter
    Click Element           //body/div[4]/div[4]/div[2]/div/div/div[5]/div[5]/div[1]/div/div/div
    Click Element           //*[@id="react-select-5-option-5"]//body/div[4]/div[4]/div[2]/div/div/div[5]
    #Change to Sharing tab
    Click Element           //body/div[4]/div[4]/div[1]/div/div/div/button[3]/span/div
    Press Keys              element     Runtime Operator
    Press Keys              Element     ENTER
    #Save changes
    #Click Element           locator


Changing Dashboard Settings - Gear Wheel
    [documentation]  This will test when the user makes changes to the dashboard settings when accessing with the 3dots
    [tags]  acceptance  dashboards  settings  3dots  3599

    Login Acceptance
    Access Dashboards Manager
    #After accessing dashboards, a search will be performed
    Input Text              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     3599
    Press Keys              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     ENTER
    #Selecting the dashboard to access settings with the gear wheel


Template Dashboards - Object Scroll Down Test
    [documentation]  Test case to verify the scrolling behaviour
    [tags]  acceptance  dashboards  object  scroll  3666  sprint60

    Login Acceptance
    Access Dashboards Manager
    #Select a template dashboard - in thi casa, "RS template" or "3666" as filter to select
    Click Element           //*[@id="main-app"]/div[1]/div[1]/nav/div/div[3]/div/ul/li/div[2]/ul/div/div/li[1]/div[1]/div[1]
    Wait Until Element Is Visible       //*[@id="main-app"]/div[1]/div[1]/nav/div/div[3]/div/ul/li/div[2]/ul/div/div/li[1]/div[2]/ul/div/div/li[2]/div[1]/div[2]/a/span
    Click Element           //*[@id="main-app"]/div[1]/div[1]/nav/div/div[3]/div/ul/li/div[2]/ul/div/div/li[1]/div[2]/ul/div/div/li[2]/div[1]/div[2]/a/span
    Reload Page
    Wait Until Element Is Visible       //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input
    Input Text              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     3666
    Press Keys              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     ENTER
    Wait Until Element Is Visible       //body/div[1]/div/div[3]/div[2]/div[3]/div[1]/div/div/div/div/div/div/div/div/table/tbody/tr/td[2]/div/div/span     20s
    Click Element           //body/div[1]/div/div[3]/div[2]/div[3]/div[1]/div/div/div/div/div/div/div/div/table/tbody/tr/td[2]/div/div/span
    #Open the object list
    Wait Until Element is Visible       //*[@id="mui-component-select-level"]
    Click Element           //*[@id="mui-component-select-level"]
    #Performing a scroll till reaching the end of the list
    Scroll Element Into View            //*[@id="menu-level"]/div[3]/ul/li[251]
    Sleep                   2s
    Scroll Element Into View            //*[@id="menu-level"]/div[3]/ul/li[501]
    Sleep                   2s
    Scroll Element Into View            //*[@id="menu-level"]/div[3]/ul/li[751]
    #Test will end here. Scrolling requires a small break for each section to load.


Graph Data Loads - Viewing VS Editing
    [documentation]  Test designed to validate the time it takes to load the graphs
    [tags]  acceptance  regression  dashboards  qackathon  graphs  loading  3968

    Login Acceptance
    Access Dashboards Manager


Dashboard Creation, Edit & Deletion
    [documentation]  This test case will test the creation, edit and deletion of a dashboard
    [tags]  acceptance  regression  dashboards  4154  creation  edit  deletion

    Login Acceptance
    Access Dashboards Manager
    Create Dashboard
    Edit Dashboard
    Delete Dashboard
