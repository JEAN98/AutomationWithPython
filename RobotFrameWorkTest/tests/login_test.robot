*** Settings ***
Library  Selenium2Library
Resource  ../pages/navigation_page.robot
Resource  ../pages/login_page.robot

Suite Setup     Go To Platform
Test Setup      Go To Login Page
Suite Teardown  Close All Browsers


*** Variables ***
${USER_NAME}  jeanvega
${PASSWORD}  1234567890AB-
${INVALID_PASSWORD}  1234567890ab-


*** Test Cases ***
Verify Login Page Load Test
    [Tags]  VerifyLoadPageTag
    Login Page Load

Verify Do Login Test
    Do Login  ${USER_NAME}  ${PASSWORD}
    Login Succesuful

Verify Do Login Invalid Crendetials
    Do Login Invalid Credentials  ${USER_NAME}  ${INVALID_PASSWORD}


