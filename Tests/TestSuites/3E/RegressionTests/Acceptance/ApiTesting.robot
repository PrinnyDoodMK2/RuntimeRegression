# Selenium
# To run the test cases, use the following command in the terminal:
# Python3 -m robot -d Results/RuntimeResults -i regression Tests/TestSuites/3E/RegressionTests/Acceptance/Notifications.robot
# "-d Results/RuntimeResults" is where the results will be saved
# "-i viewsORalarms" is the tag selected to run the specific test cases that are related. OR, AND & NOT usable
# "Tests/TestSuites/3E/RegressionTests/Portfolio.robot" is the robot file path to be executed

# For load testing, swarm was installed. Refer to the following URLs for further information:
# https://iwconnect.com/load-testing-with-robot-framework-swarm/
# https://github.com/damies13/rfswarm

# To run swarm, use the command:
# python3 rfswarm.py

# For api testing, JSONlibrary was installed with pip3. Same for RequestsLibrary.
# To run the api project, use the following command:
# python3 -m robot -d Results/RuntimeResults/AcceptanceResults -i acceptance Tests/TestSuites/3E/RegressionTests/Acceptance/ApiTesting.robot

*** Settings ***
#Libraries can be associated, same for resources. Able to define setup, teadown & implicit wait
Documentation       Acceptance | API Testing setup
Library             SeleniumLibrary
Library             RequestsLibrary
Library             JSONLibrary
Library             Collections
#Library             Screenshot
#Library             WatchUI         tesseract_path=/usr/local/Cellar/tesseract/5.2.0/bin/tesseract
#Library             AutoItLibrary
Resource            ../../../../../Resources/Variables&Keywords/Variables.robot
Resource            ../../../../../Resources/Variables&Keywords/Keywords.robot
#Test Setup          Open Browser To ACCEPTANCE Login Page
#Test Teardown       Finalize Test Case

*** Test Cases ***
Do a GET Request and validate the response code and response body
    [documentation]  This test case verifies that the response code of the GET Request should be 200,
    ...  the response body contains the 'title' key with value as 'London',
    ...  and the response body contains the key 'location_type'.
    [tags]  acceptance  smoke  api  demo  get
    Create Session  mysession  https://www.metaweather.com  verify=true
    ${response}=  GET On Session  mysession  /api/location/search/  params=query=london
    Status Should Be  200  ${response}  #Check Status as 200

    #Check Title as London from Response Body
    ${title}=  Get Value From Json  ${response.json()}[0]  title
    ${titleFromList}=  Get From List   ${title}  0
    Should be equal  ${titleFromList}  London

    #Check location_type is present in the repsonse body
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  location_type

#GET
#Create Session mysession https://www.metaweather.com verify=true – Create Session is coming from the RequestsLibrary.
#It creates an HTTP session to an server. mysession is the variable where we are storing the session.
#https://www.metaweather.com is the url with which we are estabilishing the session.
#verify=true checks whether the SSL cert will be verified or not.

#${response}= GET On Session mysession /api/location/search/ params=query=london –
#We are saving the response in the ${response} variable.
#GET On Session is coming from the RequestsLibrary. It sends a ‘GET’ request on a previously created HTTP Session.
#mysession is our previously created session. /api/location/search/ is the remaining part of the url.
#params=query=london sends the parameter ‘query’ with value ‘london’.
#This will translate into ?query=london.

#Status Should Be 200 ${response} – Status Should be is coming from RequestsLibrary.
#It basically checks the response status with the expected status, which in our case is 200.

#${title}= Get Value From Json ${response.json()}[0] title – Get Value From Json is coimg from JSONLibrary.
#It gets the value From JSON using JSONPath. ${response.json()} parses the response body into a json format.

#As you can see above, our response body is inside an array and we need to access the value of the ‘title’ key,
#hence we are using ${response.json()}[0] title.
#Then, finally we are saving the value in ${title}.

#${titleFromList}= Get From List ${title} 0 – The ${title} will have our value but it will be in the form of a list.
#So to extract the value from the list we are using Get From List. Get from List comes from Collections Library.
#It returns the value specified with an index from list.
#Since we have only one value in the list, hence we have mentioned 0.
#Finally we are saving the value in ${titleFromList}.

#Should be equal ${titleFromList} London – Should be equal comes from the BuiltIn Library.
#It checks that both the values are equal.

#${body}= Convert To String ${response.content} – Convert to String comes from the BuiltIn Library.
#It converts the given item to a Unicode string. We are converting the response content in to a string here.
#We are saving this in ${body}.

#Should Contain ${body} location_type – Should Contain comes from the BuiltIn Library.
#It checks that the expected string ‘location_type’ is present in ‘${body}’.

Do a POST Request and validate the response code, response body, and response headers
    [documentation]  This test case verifies that the response code of the POST Request should be 201,
    ...  the response body contains the 'id' key with value '101',
    ...  and the response header 'Content-Type' has the value 'application/json; charset=utf-8'.
    [tags]  acceptance  smoke  api  demo  post
    Create Session  mysession  https://jsonplaceholder.typicode.com  verify=true
    &{body}=  Create Dictionary  title=foo  body=bar  userId=9000
    &{header}=  Create Dictionary  Cache-Control=no-cache
    ${response}=  POST On Session  mysession  /posts  data=${body}  headers=${header}
    Status Should Be  201  ${response}  #Check Status as 201

    #Check id as 101 from Response Body
    ${id}=  Get Value From Json  ${response.json()}  id
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  101

    #Check the value of the header Content-Type
    ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
    Should be equal  ${getHeaderValue}  application/json; charset=utf-8

#Post
#Create Session mysession https://jsonplaceholder.typicode.com verify=true –
#Creates a session with the url https://jsonplaceholder.typicode.com and saves it in mysession.

#&{body}= Create Dictionary title=foo body=bar userId=9000 – Create Dictionary comes from the BuiltIn Library.
#It creates and returns a dictionary based on the given items.
#title=foo body=bar userId=9000 are key value pairs which will make up the request body.
#We are saving the dictionary in &{body}.

#&{header}= Create Dictionary Cache-Control=no-cache – Similarly we are creating a dictionary of header for
# request headers and saving it in &{header}.

#${response}= POST On Session mysession /posts data=${body} headers=${header} –
#We are saving the response in ${response}.
#POST On Session comes from the RequestsLibrary.
#It sends a ‘POST’ request on a previously created HTTP Session. /posts is the remaning part of url.
#data=${body} is used for send our request body.
#headers=${header} is used to send our request header.

#Status Should Be 201 ${response} – Validates that the response status is 201.

#${id}= Get Value From Json ${response.json()} id – As you can see in the image below we are saving the
#value of the ‘id’ key from the response body into ${id}.

#${idFromList}= Get From List ${id} 0 – Gets the value from the ${id}
#list. Since there is only one value hence we are using the index as 0. We are saving this in ${idFromList}.

#${idFromListAsString}= Convert To String ${idFromList} – Converts the extracted value of ‘id’ into string and
#then saving it to ${idFromListAsString}.

#Should be equal As Strings ${idFromListAsString} 101 – Should be equal As Strings comes from the BuiltIn Library.
#It checks the expected and actual strings are equal or not.

#${getHeaderValue}= Get From Dictionary ${response.headers} Content-Type – Get From Dictionary comes from the
#Collection Framework. It returns a value from the given dictionary based on the given key.
#Here we are saving the value of the ‘Content-Type’ response header to ${getHeaderValue}.

#Should be equal ${getHeaderValue} application/json; charset=utf-8 – It validates that
# the response header ‘Content-Type’ has the value ‘application/json; charset=utf-8’.

#After Execution, we should see a ‘PASS’ –


