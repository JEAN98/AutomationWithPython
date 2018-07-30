*** Settings ***
Library  Selenium2Library
Resource  base_page.robot

*** Variables ***
${INPUT_USER_NAME}  id=ctl00_Main_LoginConrol_UserName
${INPUT_PASSWORD}   id=ctl00_Main_LoginConrol_Password
${BUTTON_LOG_IN}    id=ctl00_Main_LoginConrol_LoginButton
${LOGIN_SUCCESFUL}  id=ctl00_LoginView_MemberName
${LOG_OUT}          id=ctl00_LoginView_MemberLoginStatus

*** Keywords ***
Do Login
    [Arguments]    ${user_name}  ${password}
    Type On Element   ${INPUT_USER_NAME}  ${user_name}
    Type On Element   ${INPUT_PASSWORD}   ${password}
    Click On Element  ${BUTTON_LOG_IN}

Do Log Out
    Click On Element  ${LOG_OUT}

Login Succesuful
    Wait For Element Visible  ${LOGIN_SUCCESFUL}
    Do Log Out

Login Page Load
    Wait For Element Visible  ${INPUT_USER_NAME}
    Wait For Element Visible  ${INPUT_PASSWORD}
    Wait For Element Visible  ${BUTTON_LOG_IN}
    Wait For Element Visible  id=ctl00_Main_RegisterLink
    Wait For Element Visible  id=ctl00_Main_ForgotPasswordButton

Do Login Invalid Credentials
    [Arguments]    ${user_name}  ${password}
    Type On Element   ${INPUT_USER_NAME}  ${user_name}
    Type On Element   ${INPUT_PASSWORD}   ${password}
    Click On Element  ${BUTTON_LOG_IN}
    Wait For Element Visible  id=ctl00_LoginView_LoginLink

