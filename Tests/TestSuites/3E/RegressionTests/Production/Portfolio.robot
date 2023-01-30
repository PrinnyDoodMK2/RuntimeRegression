#To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Portfolio.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i regression" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Acceptance/Portfolio.robot" is the robot file path to be executed

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Prod | Portfolio Regression
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Library             AutoItLibrary
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
Test Setup          Open Browser To PROD Login Page
Test Teardown       Finalize Test Case

*** Test Cases ***
#Portfolio Test Cases
Login
    [documentation]  Login regression test in acceptance.
    [tags]  acceptance  regression  porfolio  login

    Login Acceptance
    Element Should Be Visible   class=icon__container


#Logout
#    [documentation]  Simple logout regression test.
#    [tags]  acceptance  regression  portfolio  logout

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
    [tags]  regression  3585  portfolio  alarms  filter

    Login Acceptance
    Element Should Be Visible   class=button
    Click Element           //a[@href='/sq2020/portfoliomanager/sites/all/alarms/list']
    Click Element           //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input
    Input Text              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     Logger no data
    Press Keys              //*[@id="main-app"]/div[2]/div[1]/div[2]/div/form/input     ENTER


Tasks - scroll bar validation in the task forms
    [documentation]  Validation of the scroll bars behaviour
    [tags]  prod  regression  portfolio  tasks  3995  demonstration  sprint61  VR

    Login Prod
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
    Capture Page Screenshot             ${PROD_VR_IMAGES_OBTAINED}/prod_portfolio_alarms_VR_3995.png
    Compare Images                      ${VR_REFERENCE_IMAGE_FOLDER}/reference_3995_endresult.png         ${PREPROD_VR_IMAGES_OBTAINED}/preprod_portfolio_alarms_VR_3995.png      save_folder=${PREPROD_VR_COMPARISON_PORTFOLIO}      ssim=0.70







