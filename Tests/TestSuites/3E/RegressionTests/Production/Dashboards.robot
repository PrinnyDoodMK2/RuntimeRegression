#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Dashboards.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptanec/Dashboards.robot" is the robot file path to be executed

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Dashboards Regression
Library             SeleniumLibrary
Resource            ../Variables&Keywords/Variables.robot
Resource            ../Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Dashboard Test Cases
#Accessing Dashboard
#    [documentation]  After login, user should be able to access the dashboard management.
#    [tags]  acceptance  regression  dashboard  management

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
