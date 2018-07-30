*** Settings ***
Library  Selenium2Library
Resource  base_page.robot

*** Variables ***
${BASE_URL}       http://192.168.0.103:86/
${BROWSER_TYPE}   chrome
${LOGIN_LINK}     id=ctl00_LoginView_LoginLink
${REGISTER_LINK}  id=ctl00_LoginView_RegisterLink


*** Keywords ***
Go To Platform
    Open Browser      ${BASE_URL}  ${BROWSER_TYPE}

Go To Login Page
    Go To             ${BASE_URL}
    Click On Element  ${LOGIN_LINK}

Go To Register Page
    Click On Element  ${REGISTER_LINK}


