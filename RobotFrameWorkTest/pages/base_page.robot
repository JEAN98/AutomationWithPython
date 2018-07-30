*** Settings ***
Library  Selenium2Library


*** Variables ***
${TIME_OUT_Error}  The current node does not exist
${ENABLE_FALSE}   The web element is false
${Wait_Time}  5s


*** Keywords ***
Wait For Element Enable
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}  ${Wait_Time}  ${ENABLE_FALSE}

Wait For Element Visible
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  ${Wait_Time}  ${TIME_OUT_Error}

Type On Element
    [Arguments]  ${locator}   ${text}
    Wait For Element Visible  ${locator}
    Wait For Element Enable   ${locator}
    Input Text  ${locator}    ${text}

Click On Element
    [Arguments]  ${locator}
    Wait For Element Visible  ${locator}
    Wait For Element Enable   ${locator}
    Click Element             ${locator}

Get Text On Element
    [Arguments]  ${locator}
    Wait For Element Visible  ${locator}
    Wait For Element Enable   ${locator}
    Get Text                  ${locator}

Hover On Item
    [Arguments]  ${locator}
    Mouse Over   ${locator}

Clear Input Text
    [Arguments]  ${locator}
    Wait For Element Visible  ${locator}
    Wait For Element Enable   ${locator}
    Clear Element Text        ${locator}



