*** Settings ***
Library  Selenium2Library
Library    Collections
Library    OperatingSystem
Library    ../resources/FileTest.py
Resource  ../pages/navigation_page.robot
Resource  ../pages/register_page.robot


Suite Setup     Go To Platform
Test Setup      Go To Register Page
Suite Teardown  Close All Browsers

*** Variables ***
${json_path}    ../resources/


*** Test Cases ***
Verify Load Page Test
    [Tags]  VerifyLoadPageTag
    Load Page

Create Empty Register Test
    Create Empty Register

Register With Different Password Test
    [Tags]  Tests with json data
    ${dict}  Get Dict Different Password
    Register With Different Password  ${dict['register'][0]}

Register With User Taken Test
    [Tags]  Tests with json data
    ${dict}  Get Dict User Name Taken
    Register User Name Taken  ${dict['register'][0]}

Create New Register Test
    [Tags]  Tests with json data
    ${dict}  Get Dict
    Log To Console  ${dict}
    :FOR    ${INDEX}    IN RANGE    0    1
    \   Log to console  ${INDEX}
    \   Log to console  ${dict['register'][${INDEX}]['firstName']}
    \   Create New Register  ${dict['register'][${INDEX}]}







#Create Register Test
  #  ${dict}  Get Dict Of Register Data
  #   ${dict}  Get Dict
  #   Log To Console  ${dict}
  #   Log to console  myFirstanme
  #  Log to console  ${dict['register'][0]['firstName']}
  #   :FOR    ${INDEX}    IN RANGE    0    1
  #  \   Log to console  ${INDEX}
  #   \   Log to console  ${dict['register'][${INDEX}]['firstName']}

  #  :FOR    ${ELEMENT}    IN    ${dict['register']}
  #   \   Log to console  ${ELEMENT}
  #  \   Log to console  ${ELEMENT['firstName']}"""


#Example Json
  #    ${json}  Get Binary File  ${json_path}RegisterData.json
  #    Log to console  ${json}
      #Log to console  ${value}


#*** Keywords ***
#Load Json With Path File
 #   ${result}=  Load Json From File	 ../resources/RegisterData.json
  #  [Return]   ${result}