# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance

*** Settings ***
Documentation       Keywords will be stored here
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
Resource            ../Variables&Keywords/Variables.robot

*** Keywords ***

#To open browser with the desired test target URL
Open Browser To LOCAL Login Page
    #Open Browser    ${LOCAL LOGIN URL}    ${BROWSER1}       options=add_argument("--incognito")
    Open Browser    ${LOCAL LOGIN URL}    ${BROWSER1}       #runtime_profile_dir=${RUNTIME_PROFILE}
    Maximize Browser Window
    Set Selenium Speed              0.5s
    Set Browser Implicit Wait       5s
    Sleep                           2s

Open Browser To ACCEPTANCE Login Page
    Open Browser    ${ACCEPTANCE LOGIN URL}    ${BROWSER1}      #options=add_argument("--incognito")
    Maximize Browser Window
    Set Selenium Speed              0.5s
    Set Browser Implicit Wait       5s
    Sleep                           2s

Open Browser To PREPROD Login Page
    Open Browser    ${PREPROD LOGIN URL}    ${BROWSER1}     #options=add_argument("--incognito")
    Maximize Browser Window
    Set Selenium Speed              0.5s
    Set Browser Implicit Wait       5s
    Sleep                           2s

Open Browser To PROD Login Page
    Open Browser    ${PROD LOGIN URL}     ${BROWSER1}       #options=add_argument("--incognito")
    Maximize Browser Window
    Set Selenium Speed              0.5s
    Set Browser Implicit Wait       5s
    Sleep                           2s

#To perform the login process for each ambient
Login Acceptance
    [documentation]  This keyword will perfom the steps for a valid login in ACCEPTANCE
    Input Text              name=username       ${ACCEPTANCE USERNAME 1}
    Input Password          name=password       ${ACCEPTANCE PASSWORD 1}
    Click Element           class=button

Login Local
    [documentation]  This keyword will perfom the steps for a valid login in LOCAL
    Input Text              name=username       ${LOCAL USERNAME}
    Input Password          name=password       ${LOCAL PASSWORD}
    Click Element           class=button

Login PreProd
    [documentation]  This keyword will perfom the steps for a valid login in PREPRODUCTION
    Sleep                   1s
    Reload Page
    Input Text              name=username       ${PREPROD USERNAME 1}
    Input Password          name=password       ${PREPROD PASSWORD 1}
    Sleep                   1s
    Click Element           //*[@id="main-app"]/section/form/div[4]/button

Login Prod
    [documentation]  This keyword will perfom the steps for a valid login in PRODUCTION
    Input Text              name=username       ${PROD USERNAME 2}
    Input Password          name=password       ${PROD PASSWORD 2}
    Click Element           class=button


#To perform the Logout from each environment
Logout Local


Logout Acceptance
    [documentation]  This keyword will perform the logout process
    Element Should Be Visible           //*[@id="user_popup"]/button
    Click Element                       //*[@id="user_popup"]/button
    Click Element                       //*[@id="user_popup"]/div/ul/li
    Location Should Be                  https://admin.3esynaptiq.com/sq2020/sign-in
    Sleep                               2s


Logout PreProd


Logout Prod




#Keyword to finalize the test cases
Finalize Test Case
    [documentation]  This will includ a wait time of 2 seconds and the [Teardown] close browser keyword
    Sleep                   4s
    [Teardown]  Close Browser
#    Log                     This test was executed by ${USERNAME} on ${OS}

#Keywords to access the app's manager tabs
Access Portfolio
    [documentation]  This keyword will include the steps to access the portfolio
    Wait Until Element Is Visible       //a[@href='/sq2020/portfoliomanager/sites/all/assets/plants/map']     15s
    Click Element                       //a[@href='/sq2020/portfoliomanager/sites/all/assets/plants/map']
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Alarms Manager
    [documentation]  This keyword will include the steps to access the alarms manager
    Wait Until Element Is Visible       //*[@id="root"]/div/div[2]/div[1]/a[4]/div     15s
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[4]/div
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Dashboards Manager
    [documentation]  This keyword will include the steps to access the Dashboards Manager
    Wait Until Element Is Visible       //a[@href='/sq2020/dashboardmanager/dashboards/all/list']     15s
    Click Element                       //a[@href='/sq2020/dashboardmanager/dashboards/all/list']
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Views Manager
    [documentation]  This keyword will include the steps to access the Analysis/Views Manager
    Wait Until Element Is Visible       //a[@href='/sq2020/viewsmanager/views/list']     15s
    Click Element                       //a[@href='/sq2020/viewsmanager/views/list']
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Resource Analysis
    [documentation]  This keyword will include the steps to access the resource analysis in the portfolio
    Wait Until Element Is Visible       //*[@id="root"]/div/div[2]/h1     15s
    Click Element                       //*[@id="root"]/div/div[2]/h1
    Click Element                       //*[@id="simple-popover"]/div[3]/div/div/div[1]/div[2]/div[2]
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Users Manager
    [documentation]  This keyword will include the steps to access the Users Manager
    Wait Until Element Is Visible       //*[@id="root"]/div/div[2]/div[1]/a[6]
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[6]
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Notifications Manager
    [documentation]  This keyword will include the steps to access the Notifications Manager
    Wait Until Element is Visible       //*[@id="root"]/div/div[2]/div[1]/a[5]    15s
    Click Element                       //*[@id="root"]/div/div[2]/div[1]/a[5]
    Sleep                               2s
    #Reload Page
    #Sleep                               2s


Access Account & Preferences
    [documentation]  This keyworld will include the steps to access the user account & preferences
    Wait Until Element is Visible       //*[@id="user_popup"]/button
    Click Element                       //*[@id="user_popup"]/button
    #Select Account & Preferences from the list (1st Option)
    Click Element                       //*[@id="user_popup"]/div/ul/li[1]/div
    Sleep                               2s


#Scroll keyword for reference and test case 3995
Scroll All Down
    [documentation]  This keyword was generated for the issue in test case 3995. To run, use tag 3995.
    Sleep                               2s
    Press Keys                          //*[@id="main-app"]/div[2]/div[2]/div/div[2]/div/div[3]         ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN
    Press Keys                          //*[@id="main-app"]/div[2]/div[2]/div/div[3]/div/div            ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN
    Press Keys                          None            ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN  ARROW_DOWN
    #scroll the page a certain number of pixels (horizontaly,verticaly)
    execute javascript                  window.scrollTo(0,3000)
    #or scroll to the end of the page
    Execute Javascript                  window.scrollTo(0,document.body.scrollHeight)
    #or scroll to a specific coordinate
    #Execute JavaScript                  window.scrollTo(${x_location},${y_location})


#--------------------------------------------------------------------------------------------------------------
#The following keywords were created for the general creation, edit and deletion of dashboards. Reuse as needed.
#The following steps will be considered as already performed in the test cases that call these keywords:
#-> Login "Environment"
#-> Access Dashboards Manager
#--------------------------------------------------------------------------------------------------------------
Create Dashboard
    [documentation]  This keyword will follow the dashboard creation process
    Click Element           //*[@id="main-app"]/div[1]/div[1]/nav/div/div[2]
    Location Should Be      https://admin.3esynaptiq.com/sq2020/dashboardmanager/dashboards/all/list
    Sleep                   1s
    Click Element           //*[@id="mui-component-select-Dashboard type"]/span
    #Select "custom dashboard"
    Click Element           //*[@id="menu-Dashboard type"]/div[3]/ul/li[2]
    Click Element           //body/div[4]/div[3]/div[1]/div[3]/div/button/span   #"Next" Button
    #Select view 3615
    Input Text              //body/div[4]/div[3]/div[2]/div[1]/div[2]/div[1]/form/input     3615
    Press Keys              None        ENTER
    Drag And Drop           //*[@id="views"]/div/div[5]/div[2]/span[2]     //body/div[4]/div[3]/div[2]/div[2]/div[2]/div
    Click Element           //body/div[4]/div[3]/div[1]/div[3]/div/button/span   #"Next" Button
    #Fill the "Organize" information
    Input Text              //body/div[4]/div[3]/div[2]/form/div/div/div[2]/input     Robot Testing Dashboard RS      #"Name" filled
    #The following step will depend from test case to test case. These steps will select a tag
    #Click Element
    Input Text              //body/div[4]/div[3]/div[2]/form/div/div/div[6]/textarea     A robot dashboard created for automation purposes.      #"Description" filled
    Click Element           //body/div[4]/div[3]/div[1]/div[3]/div[2]/button/span   #"Next" Button
    #Fill the "Share" information
    Click Element           //*[@id="mui-component-select-share-with"]
    Click Element           //*[@id="menu-share-with"]/div[3]/ul/li[3]      #Will share with a specific "User"
    Click Element           //body/div[4]/div[3]/div[2]/div/div[2]/div[2]/div[3]/div/div/div/div/div/div
    Press Keys              None     Runtime Revolution      ENTER       #User "Runtime Revolution" selected
    Click Element           //body/div[4]/div[3]/div[1]/div[3]/div[2]/button/span   #"Next" Button
    #Fill in the "Apply" information





