*** Settings ***
Library   Selenium2Library
Library   String
Resource  base_page.robot
Resource  login_page.robot


*** Variables ***
${INPUT_FIRST_NAME}  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_FirstName
${INPUT_LAST_NAME}   id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_LastName
${INPUT_EMAIL}       id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_Email
${INPUT_USER_NAME}   id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_UserName
${INPUT_PASSWORD}    id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_Password
${INPUT_REPASSWORD}  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_ConfirmPassword
${INPUT_QUESTION}    id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_Question
${INPUT_ANSWER}      id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_Answer
${REGISTER_BUTTON}   id=ctl00_Main_CreateUserWizardControl___CustomNav0_StepNextButtonButton


*** Keywords ***
Load Page
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl
    Wait For Element Visible  ${REGISTER_BUTTON}
    Wait For Element Visible  id=user_assistance
    Wait For Element Visible  id=nav_header

Type On Register Inputs
    [Arguments]  ${dict}
    Type On Element    ${INPUT_FIRST_NAME}    ${dict['firstName']}
    Type On Element    ${INPUT_LAST_NAME}     ${dict['lastName']}
    Type On Element    ${INPUT_EMAIL}         ${dict['email']}
    Type On Element    ${INPUT_USER_NAME}     ${dict['userName']}
    Type On Element    ${INPUT_PASSWORD}      ${dict['password']}
    Type On Element    ${INPUT_REPASSWORD}    ${dict['confirmPassword']}
    Type On Element    ${INPUT_QUESTION}      ${dict['securityQuestion']}
    Type On Element    ${INPUT_ANSWER}        ${dict['securityAnswer']}

Create New Register
    [Arguments]  ${dict}
    Type On Register Inputs  ${dict}
    Click On Element         ${REGISTER_BUTTON}
    #Do Log Out

Type Empty Register
    Clear Input Text   ${INPUT_FIRST_NAME}
    Clear Input Text   ${INPUT_LAST_NAME}
    Clear Input Text   ${INPUT_EMAIL}
    Clear Input Text   ${INPUT_USER_NAME}
    Clear Input Text   ${INPUT_PASSWORD}
    Clear Input Text   ${INPUT_REPASSWORD}
    Clear Input Text   ${INPUT_QUESTION}
    Clear Input Text   ${INPUT_ANSWER}
    Click On Element   ${REGISTER_BUTTON}

Empty Error Messages
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_FirstNameRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_LastNameRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_EmailRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_UserNameRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_PasswordRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_ConfirmPasswordRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_QuestionRequired
    Wait For Element Visible  id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_AnswerRequired

Create Empty Register
    Type Empty Register
    Empty Error Messages

Register With Different Password
    [Arguments]  ${dict}
    Type On Register Inputs  ${dict}
    ${error_mathc_passwords}  Set Variable  color: red; display: inline;
    Click On Element         ${REGISTER_BUTTON}
    ${current_style_error_message}=  Get element attribute   id=ctl00_Main_CreateUserWizardControl_CreateUserStepContainer_PasswordCompare    style
    Log to Console  ${current_style_error_message}
    Log to Console  ${error_mathc_passwords}
    Should be equal  ${error_mathc_passwords}  ${current_style_error_message}  FatalError

Register User Name Taken
    [Arguments]  ${dict}
    Type On Register Inputs   ${dict}
    Click On Element          ${REGISTER_BUTTON}
    Wait For Element Visible  id=ctl00_Main_InfoLabel
