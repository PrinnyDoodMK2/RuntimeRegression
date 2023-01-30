# To run the test cases, use the following command in the terminal:
# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Portfolio.robot" is the robot file path to be executed

#For load testing, swarm was installed. Refer to the following URLs for further information:
#https://iwconnect.com/load-testing-with-robot-framework-swarm/
#https://github.com/damies13/rfswarm

#To run swarm, use the command:
#python3 rfswarm.py

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | Portfolio Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
#Library             AutoItLibrary
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
#Resource            /Users/runtime/PycharmProjects/RuntimeRegression/Tests/TestSuites/3E/RegressionTests/Variables&Keywords/Variables.robot
#Resource            /Users/runtime/PycharmProjects/RuntimeRegression/Tests/TestSuites/3E/RegressionTests/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To ACCEPTANCE Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Portfolio Test Cases
Login
    [documentation]  Login regression test in acceptance. This also tests the default access to portfolio.
    [tags]  acceptance  regression  porfolio  login  demonstration

    Login Acceptance
    Element Should Be Visible   class=icon__container


Logout
    [documentation]  Logout regression test.
    [tags]  acceptance  regression  portfolio  logout  demonstration

    Login Acceptance
    Logout Acceptance


Check an alarm on Portfolio
    [documentation]  Check an alarm information in the portfolio manager
    [tags]  acceptance  regression  portfolio  alarms

    Login Acceptance
    Element Should Be Visible   class=button
    Click Element           xpath=//*[text()='Alarms']
    Element Should Be Visible   class=MuiTable-root
    Click Element           //tbody/tr[3]/td[2]/div[1]/div[1]
    #Click Element           //tbody/tr[3]/td[2]/div[1]/div[1]//*[name()='svg']//*[name()='g' and @id='Icon/Bell-Off/Line']//*[name()='path' and @id='Fill']
    Sleep                   2s
    Location Should Be      https://admin.3esynaptiq.com/sq2020/portfoliomanager/sites/all/alarms/list

Filter alarms by search item
    [documentation]  Portfolio->Alarms->Input any term in the search box and press enter
    [tags]  acceptance  regression  3585  portfolio  alarms  filter

    Login Acceptance
    #access the alarms from the portfolio
    Element Should Be Visible   class=button
    Click Element           //a[@href='/sq2020/portfoliomanager/sites/all/alarms/list']
    #apply a specific filter for the alarm types. In this case it will be "Logger No Data"
    Click Element           //*[@id="main-app"]/div[2]/div[1]/div[2]/div/div[2]/div[3]
    Click Element           //*[@id="main-filters"]/div/div/div/div/div/button/span
    #Select one option ("Alarm Type" for this test will be selected)
    Click Element           //body/div[4]/div/div/div[1]/div/div[2]/div[2]/label/span[1]
    #Press the settings icon (three dots)
    Click Element           //*[@id="main-filters"]/div/div/div/div[1]/button/span
    #Select an option ("Logger No Data" in this test case)
    Click Element           //body/div[4]/div/div/div[2]/div[3]/div[15]/label/span[1]
    #Press the button "Set Filter"
    Click Element           //*[contains(text(),'Set Filter')]



Tags request for resource analysis
    [documentation]  Test quest to verify if there is a request for the tags of the Resource Analysis
    [tags]  acceptance  regression  portfolio  3771  sprint60  resource_analysis

    Login Acceptance
    Access Resource Analysis
    #To reload the assets due to robot working too fast
    Reload Page

    Sleep                   5s


Filters Remain Applied With Level Change
    [documentation]  Filters should remain applied in Portfolio when a user decides to change level and go back
    [tags]  acceptance  regression  qackathon  portfolio  filters  3996

    Login Acceptance
    Element Should be Visible           Element





Portfolio Map Data Refresh
    [documentation]  After a set timeframe elapses, the page should refresh content and update the information
    [tags]  acceptance  regression  qackathon  portfolio  map  graphs  refresh  update

    Login Acceptance
    Location Should Be                      https://admin.3esynaptiq.com/sq2020/portfoliomanager/sites/all/assets/plants/map
    #The following steps will colapse the site to check the desired graph. Mouse Over is required
    Mouse Over                          //*[@id="P14453"]/div[1]/span[1]
    Element Should Be Visible           //*[@id="P14453"]/div[1]/span[3]/span
    Click Element                       //*[@id="P14453"]/div[1]/span[3]/span
    Sleep                               2s
    #Take a screenshot for reference
    Capture Page Screenshot             ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_portfolio_graph_reference.png
    Sleep                               6m
    #Capture a page for reference after the time elapses for the refresh & compare with the previous step
    Capture Page Screenshot             ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_portfolio_graph_VR.png
    Compare Images                      ${VR_REFERENCE_IMAGE_FOLDER}/acceptance_portfolio_graph_reference.png    ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_portfolio_graph_VR.png    save_folder=${VR_COMPARISON_PORTFOLIO}      ssim=0.70
    Sleep                               5s


Tasks - Filter Validation
    [documentation]  This test case will approach the portfolio tasks filter and verify its condition
    [tags]  acceptance  regression  portfolio  tasks  3827  qackathon

    Login Acceptance
    Wait Until Element is Visible       //*[@id="main-app"]/div[2]/div[1]/div[1]/div/div/div[3]/span/a
    #Access Tasks in the Portfolio
    Click Element                       //*[@id="main-app"]/div[2]/div[1]/div[1]/div/div/div[3]/span/a
    #Click in Filter Data
    Location Should Be                  https://admin.3esynaptiq.com/sq2020/portfoliomanager/sites/all/interventions/list
    Click Element                       //*[@id="main-app"]/div[2]/div[1]/div[2]/div/div[2]/div[4]
    #Add a Filter of any kind. For this scenario, we will use "Task Type"
    Click Element                       //*[@id="main-filters"]/div/div/div/div/div/button/span
    Click Element                       //body/div[4]/div/div/div[1]/div/div[2]/div[5]/label/span[2]
    #Select the Task Type and apply the filter. In this case, it will be set to "Outage"
    Click Element                       //*[@id="main-filters"]/div/div/div/div[1]/button/span
    Sleep                               1s
    Click Element                       //body/div[4]/div/div/div[2]/div[3]/div[6]/label/span[1]/span/input
    Sleep                               1s
    Click Element                       //body/div[4]/div/div/div[2]/div[4]/div[2]/button
    Sleep                               2s
    #Capture a screenshot for reference
    Capture Page Screenshot             ${VR_REFERENCE_IMAGE_FOLDER}/Acceptance/acceptance_portfolio_tasks_filter_reference.png
    #Reload Page and capture a second screenshot for comparison
    Reload Page
    Sleep                               5s
    Capture Page Screenshot             ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_portfolio_tasks_filter_afterreload_VR.png
    Compare Images                      ${VR_REFERENCE_IMAGE_FOLDER}/Acceptance/acceptance_portfolio_tasks_filter_reference.png    ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_portfolio_tasks_filter_afterreload_VR.png    save_folder=${VR_COMPARISON_PORTFOLIO}      ssim=0.95


Tasks - scroll bar validation in the task forms
    [documentation]  Validation of the scroll bars behaviour
    [tags]  acceptance  regression  portfolio  tasks  3995  demonstration  sprint61  VR

    Login Acceptance
    Wait Until Element is Visible       //*[@id="main-app"]/div[2]/div[1]/div[1]/div/div/div[3]/span/a
    #Location Should Be                  https://admin.3esynaptiq.com/sq2020/portfoliomanager/sites/all/assets/plants/map
    #access the tasks from portfolio
    Click Element                       //*[@id="main-app"]/div[2]/div[1]/div[1]/div/div/div[3]/span/a
    #Location Should Be                  https://admin.3esynaptiq.com/sq2020/portfoliomanager/sites/all/interventions/list
    Wait Until Element is Visible       //a[@href='/sq2020/portfoliomanager/sites/all/interventions/form-view']
    #access form view
    Click Element                       //a[@href='/sq2020/portfoliomanager/sites/all/interventions/form-view']
    #Location Should Be                  http://localhost:3000/portfoliomanager/portfoliomanager/sites/all/interventions/form-view
    Maximize Browser Window
    Sleep                               10s
    #select one task
    Reload Page
    Wait Until Element is Visible       //*[@id="task-list"]             30s
    Click Element                       //*[@id="task-list"]
    Scroll All Down
    Capture Page Screenshot             ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_portfolio_alarms_VR_3995.png
    Compare Images                      ${VR_REFERENCE_IMAGE_FOLDER}/reference_3995_endresult.png         ${ACCEPTANCE_VR_IMAGES_OBTAINED}/acceptance_portfolio_alarms_VR_3995.png      save_folder=${VR_COMPARISON_PORTFOLIO}      ssim=0.70









#python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptance Tests/TestSuites/3E/RegressionTests/Acceptance
