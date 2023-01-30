# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptanceAND3666 Tests/TestSuites/3E/RegressionTests/Acceptance

*** Settings ***
Documentation       All variables should be defined here
Library             SeleniumLibrary
Library             Screenshot
Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
#Resource            ../Variables&Keywords/Keywords.robot

*** Variables ***
#In the case of need for a list of variables, the following should be written:
#@{variable list}   variable1  variable2  variable3  variable4  variableX
#when calling the variable in a test case, instead of using a $, the @ is used and an index should be provided:

#Input Text     Locator from the page     @{variable list}[0]

#in this example, text will be placed in the designated locator from the webpage and the first element from the
#variable list will be written (for this example, the index points to "variable1")


#User Profile for when a page does not load
${RUNTIME_PROFILE}              /'Runtime's MacBook Pro'/Update/Users/runtime

#Test targets (URLs)
${LOCAL LOGIN URL}              http://localhost:3000/portfoliomanager/sign-in
${ACCEPTANCE LOGIN URL}         https://admin.3esynaptiq.com/sq2020/sign-in
${PREPROD LOGIN URL}            http://sp-docker01.synaptiq.local:8091/sq2020/sign-in
${PROD LOGIN URL}               https://synaptiq.3esynaptiq.com/sq2020/sign-in

#Browsers
${BROWSER1}                     headlesschrome
${BROWSER2}                     headlessfirefox

#Users Localhost
${LOCAL USERNAME}               runtimerev
${LOCAL PASSWORD}               x8Wc!&1Z^#

#Users Acceptance
#Solar User
${ACCEPTANCE USERNAME 1}        runtimerev
${ACCEPTANCE PASSWORD 1}        x8Wc!&1Z^#
#Wind User
${ACCEPTANCE USERNAME 2}        3eelicio
${ACCEPTANCE PASSWORD 2}        I8A-7jlpe2

#Users PREPROD
#Solar
${PREPROD USERNAME 1}           sqdemo
${PREPROD PASSWORD 1}           3ESqdemo2019$!
##################
#Wind
${PREPROD USERNAME 2}           3eelicio
${PREPROD PASSWORD 2}           I8A-7jlpe2

#Users PROD
${PROD USERNAME 1}              3edemo
${PROD PASSWORD 1}              oJnCUZ!37
##################
#Solar
${PROD USERNAME 2}              sqdemo
${PROD PASSWORD 2}              3ESqdemo2019$!
##################
#Wind
${PROD USERNAME 3}              3eelicio
${PROD PASSWORD 3}              I8A-7jlpe2

#User username
${USERNAME}                     username
##################
#OS in which the tests were executed
${OS}                           os

#To access the Resources folder
${RESOURCES}                    /Users/runtime/PycharmProjects/RuntimeRegression/Resources
##################
#Visual Regression (VR) images folder for reference:
${VR_REFERENCE_IMAGE_FOLDER}       /Users/runtime/PycharmProjects/RuntimeRegression/Resources/VisualRegressionReferences

#The following variables are paths to reach images obtained during testing. These will be compared with a reference
#Visual Regression (VR)
#Acceptance:
${ACCEPTANCE_VR_IMAGES_OBTAINED}    /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/AcceptanceResults/VisualRegressionResults/ImagesAquiredForComparison
##################
#Local:
${LOCAL_VR_IMAGES_OBTAINED}         path
##################
#PreProd
${PREPROD_VR_IMAGES_OBTAINED}       /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/PreProdResults/VisualRegressionResults/ImagesAquiredForComparison
##################
#Prod
${PROD_VR_IMAGES_OBTAINED}          path

#Save folder for the comparison performed in visual regression (VR):
#LOCAL
${LOCAL_VR_COMPARISON}                        /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/LocalResults/VisualRegressionResults/UsersManager
${LOCAL_VR_COMPARISON_PORTFOLIO}              /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/LocalResults/VisualRegressionResults/Portfolio
${LOCAL_VR_COMPARISON_DASHBOARDS_MANAGER}     /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/LocalResults/VisualRegressionResults/DashboardsManager
${LOCAL_VR_COMPARISON_ANALYSIS_MANAGER}       /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/LocalResults/VisualRegressionResults/AnalysisManager
${LOCAL_VR_COMPARISON_ALARMS_MANAGER}         /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/LocalResults/VisualRegressionResults/AlarmsManager

#ACCEPTANCE
${VR_COMPARISON}                        /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/AcceptanceResults/VisualRegressionResults/UsersManager
${VR_COMPARISON_PORTFOLIO}              /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/AcceptanceResults/VisualRegressionResults/Portfolio
${VR_COMPARISON_DASHBOARDS_MANAGER}     /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/AcceptanceResults/VisualRegressionResults/DashboardsManager
${VR_COMPARISON_ANALYSIS_MANAGER}       /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/AcceptanceResults/VisualRegressionResults/AnalysisManager
${VR_COMPARISON_ALARMS_MANAGER}         /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/AcceptanceResults/VisualRegressionResults/AlarmsManager

#PREPROD
${PREPROD_VR_COMPARISON}                        /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/PreProdResults/VisualRegressionResults/UsersManager
${PREPROD_VR_COMPARISON_PORTFOLIO}              /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/PreProdResults/VisualRegressionResults/Portfolio
${PREPROD_VR_COMPARISON_DASHBOARDS_MANAGER}     /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/PreProdResults/VisualRegressionResults/DashboardsManager
${PREPROD_VR_COMPARISON_ANALYSIS_MANAGER}       /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/PreProdResults/VisualRegressionResults/AnalysisManager
${PREPROD_VR_COMPARISON_ALARMS_MANAGER}         /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/PreProdResults/VisualRegressionResults/AlarmsManager

#PROD
${PROD_VR_COMPARISON}                        /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/ProdResults/VisualRegressionResults/UsersManager
${PROD_VR_COMPARISON_PORTFOLIO}              /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/ProdResults/VisualRegressionResults/Portfolio
${PROD_VR_COMPARISON_DASHBOARDS_MANAGER}     /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/ProdResults/VisualRegressionResults/DashboardsManager
${PROD_VR_COMPARISON_ANALYSIS_MANAGER}       /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/ProdResults/VisualRegressionResults/AnalysisManager
${PROD_VR_COMPARISON_ALARMS_MANAGER}         /Users/runtime/PycharmProjects/RuntimeRegression/Results/RuntimeResults/ProdResults/VisualRegressionResults/AlarmsManager


#rfswarm location
${SWARM_LOCATION}                           /Users/runtime/PycharmProjects/RuntimeRegression/rfswarm-master



#Coordinates:
#Test Case for issue 3995 - Tasks
${x_location}                       X
${y_location}                       Y