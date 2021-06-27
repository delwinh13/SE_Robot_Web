*** Settings ***
Resource       vars.robot
Library  Selenium2Library

*** Keywords ***
Launch IsoMetrix Application
  Open Browser  ${URL}  ${BROWSER}
  set selenium speed  1 seconds
  Maximize Browser Window
  Title Should Be  IsoMetrix

Launch Mail Slurper
  Open Browser  ${Url3}  ${BROWSER}
Login mail Slurper
   Input Text  ${MailSlurperUsername}     ${MailSlurperUsername}
   Input Text   ${MailSlurperPassword}     ${MailSlurperPassword}
   Click Button   ${MailSlurperLoginBtn}
Office Login Local Browser
   Open Browser   ${Url2}   ${BROWSER}
   Click Element   ${Office_Pick_Account}
   Click Element    ${Office_Signin_Btn}
   Click Element  ${Office_OutlookIcon}

Office Login Via Jenkins
  Open Browser   ${Url2}   ${BROWSER}
   Input Text  ${Office_UserName}      ${Office_Username}
   Input Text   ${Office_Password}      ${Office_Password}
   Click Element   ${Office_Signin_Btn}

Login with Valid Credentials
  set selenium speed  1 seconds
  Input Text  ${Usernameid}  ${Username Value}
  Input Text  ${Passwordid}  ${Password Value}
  # [Setup]    Remove Directory    ${OUTPUTDIR}/Results    recursive
  # ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/Login-{index}-name.png
  Click Element  ${SubmitButtonid}
  set selenium speed  1 seconds
  Wait Until Page Contains Element  ${SiteName}
  set selenium speed  1 seconds
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/Succesful_Login-{index}-name.png

Switch to Iframe
  Select Frame  ${MainiFrame}
  set selenium speed  3 seconds

Log out
  Click Element  ${LogoutButton}
  Wait Until Page Contains Element  ${SigninAgainBtn}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/Succesful_Logout-{index}-name.png

Blank Username and Blank password
  Click Element  ${SubmitButtonid}
  set selenium speed  3 seconds
  Wait Until Element Is Visible       ${BlankCredentialsErrorMessage}
  Element Should Contain      ${BlankCredentialsErrorMessage}   ${PleaseEnterValueErrorMessage}


Invalid Username and Blank Password
  Input Text     ${Usernameid}   ${Invalid Username}
  Click Element  ${SubmitButtonid}
  Wait Until Element Is Visible    ${BlankPasswordErrorMessage}
  Element should Contain   ${BlankPasswordErrorMessage}      ${PleaseEnterValueErrorMessage}
  Click Element  ${PasswordErrorMessagePopup}

Invalid Password and Blank Username
    Input Text  ${Passwordid}  123
    Click Element  ${SubmitButtonid}
    Wait Until Element Is Visible    ${BlankpasswordErrorMessage}
    Element Should Contain     ${BlankpasswordErrorMessage}                ${PleaseEnterValueErrorMessage}

Valid Username and Invalid Password
  Input Text  ${Usernameid}  ${Username Value Password Reset}
  Input Text  ${Passwordid}   ${Invalid Password}
  Click Element  ${SubmitButtonid}
  Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
  Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}


Forgot Password Link
   Input Text  ${Usernameid}  ${ForgotPasswordLink_Username}
    Input Text  ${Passwordid}   ${Invalid Password}
    Click Element  ${SubmitButtonid}
  Click Element  ${ForgotPasswordLink}
  Wait Until Page Contains Element  ${txtForgotUsername}
  Click Element                     ${lblForgotBack}
   ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/Forgot_Password_Link-{index}-name.png
#  Click Element     ${SubmitButtonid}
  #Validate error message

Request New Account Link
    Input Text  ${Usernameid}  ${Username Value Request New Account}
     Input Text  ${Passwordid}   ${Invalid Password}
     Click Element  ${SubmitButtonid}
    Click Element    ${RequestNewAccountLink}
    Wait Until Page Contains Element  ${RequestNewAccount_UsernameField}
    set selenium speed  3 seconds
    Click Element     ${BackToLoginLabel}


#Reset Password With Blank Username and Password
#     Click Elemnt   ${ResetPasswordBtn}
#     Element Shound Contain    ${PasswordRestBlankUsernameandPassword}      Validation: Please enter value

Request Access With No Data
  Click Element     ${RequestAccessLabel}
  set selenium speed  3 seconds
   Wait Until Page Contains Element   ${RequestAccessSurname}
     set selenium speed  3 seconds
  Click Element   ${requestAccessBtn}
    Element Should Contain    ${RequestAccessUsernameErrorMsg}     ${PleaseEnterValueErrorMessage}
    Click Element    ${PleaseEnterSurnamePopup}
   Click Element     ${BackToLoginLabel}


Negative Validation Request Access With Surname Only
      Click Element     ${RequestAccessLabel}
      Input Text        ${RequestAccessSurname}   ${RequestAccessSurnameValue}
      Click Element     ${requestAccessBtn}
      set selenium speed  3 seconds
#      Wait Until Element Contains      ${PleaseEnterValueName_ErrorMsg}
      Element Should Contain      ${PleaseEnterValueName_ErrorMsg}     ${PleaseEnterValueErrorMessage}
      Click Element      ${PleaseEnterNamePopup}

Negative Validation Request Access With Surname and Name
  Click Element     ${RequestAccessLabel}
   Input Text        ${RequestAccessSurname}   ${RequestAccessSurnameValue}
      Input Text         ${RequestAccessname}    ${RequestAccessnameValue}
        Click Element     ${requestAccessBtn}
        set selenium speed  3 seconds
#        Wait Until Page Contains     ${PleaseEnterValueEmailAddress_ErrorMsg}
       Element Should Contain      ${PleaseEnterValueEmailAddress_ErrorMsg}     ${PleaseEnterValueErrorMessage}
         Click Element      ${PleaseEnterEmailPopup}

Negative Validation Request Access With Surname ,Name and Email Address
  Click Element     ${RequestAccessLabel}
          Input Text        ${RequestAccessSurname}   ${RequestAccessSurnameValue}
          Input Text         ${RequestAccessname}    ${RequestAccessnameValue}
           Input Text         ${RequestAccessEmail}  ${RequestAccessEmailInvalidValue}
           Click Element     ${requestAccessBtn}
           set selenium speed  3 seconds
#           Wait Until Page Contains   ${PleaseEnterValueReasonForRequest_ErrorMsg}
           Element Should Contain     ${PleaseEnterValueReasonForRequest_ErrorMsg}    ${PleaseEnterValueErrorMessage}
           Click Element     ${PleaseEnterCommentsPopup}

Negative Validation Request Access With Surname ,Name, Email Address and Reason For Request
         Click Element     ${RequestAccessLabel}
       Input Text        ${RequestAccessSurname}   ${RequestAccessSurnameValue}
       Input Text         ${RequestAccessname}      ${RequestAccessnameValue}
       Input Text         ${RequestAccessEmail}     ${RequestAccessEmailInvalidValue}
       Input Text        ${RequestAccessComments}    ${RequestAccessCommentsValue}
       Click Element     ${requestAccessBtn}
       set selenium speed  3 seconds
#       wait Until Page Contains     ${RequestAccess_InvalidEmail_ErrorMsg}
       Element Should Contain      ${RequestAccess_InvalidEmail_ErrorMsg}      ${InvalidEmail_ErrorMsg}
#       Click Element    ${PleaseEnterValidEmailAddressPopup}
       Click Element     ${BackToLoginLabel}


Successful Access Request
   Click Element     ${RequestAccessLabel}
  Input Text        ${RequestAccessSurname}   ${RequestAccessSurnameValue}
  Input Text        ${RequestAccessname}     ${RequestAccessnameValue}
  Input Text        ${RequestAccessEmail}      ${RequestAccessEmailvalidValue}
  Input Text        ${RequestAccessComments}    ${RequestAccessCommentsValue}
  Click Element     ${requestAccessBtn}
  set selenium speed  3 seconds
  Element Should Contain   ${SuccesfulRequestAcessMsg}    ${SuccesfulRequestAccessConfirmationMsg}
  #Validate Messsage
  Click Element     ${BackToLogin}

Reset Password With Blank Username and Email Address
  Click Element  ${ResetPassowrd}
  Click Element   ${ResetPasswordBtn}
  set selenium speed  3 seconds
  Element Should Contain    ${UnsuccessfulPasswordResetMsg}     ${PleaseEnterValueErrorMessage}
  Click Element   ${ResetPasswordUsernamePopup}

Reset Password With Invalid Username Only
     Click Element  ${ResetPassowrd}
      Input Text        ${ForgotPasswordUsername}    ${ResetPasswordInvalidUsernameValue}
      Click Element     ${ResetPasswordBtn}
      set selenium speed  3 seconds
      Element Should Contain       ${ResetPasswordBlankPasswordErrorMsg}     ${PleaseEnterValueErrorMessage}
       Click Element      ${ResetPasswordEmailPopup}
#        Click Element          ${BacktoLoginLabel}

Reset Pasword With Invalid Email Address
        Click Element     ${ResetPassowrd}
         Input Text        ${ForgotPasswordUsername}    ${ResetPasswordInvalidUsernameValue}
         Input Text       ${ForgotPasswordEmail}        ${ResetPasswordInvalidEmailValue}
          Click Element   ${ResetPasswordBtn}
        set selenium speed  3 seconds
        Element Should Contain       ${ResetPasswordInvalidEmailAddressMsg}      Invalid email address
        Click Element          ${ResetPasswordEmailPopup}
#        Click Element          ${BacktoLoginLabel}

Sucessful Password Reset
    Click Element     ${ResetPassowrd}
  Input Text  ${ForgotPasswordUsername}    Isometrixsystem
  Input Text  ${ForgotPasswordEmail}       kopano.makanatleng@isometrix.com
  Click Element   ${ResetPasswordBtn}
  set selenium speed  5 seconds
  Element Should Contain     ${UnsuccessfulPasswordResetMsg}     Confirmation: Your password has been successfully reset

Locked Account

  Input Text  ${Usernameid}  ${LockedAccountUsername}
  Input Text  ${Passwordid}   ${Invalid Password}
  Click Element  ${SubmitButtonid}
  Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
  Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}
#  Click Element    ${InvalidCredentialsPopupMessage}
  ###########################Repeat 5 times(1)##########################
   Click Element  ${SubmitButtonid}
    Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
    Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}
#    Click Element    ${InvalidCredentialsPopupMessage}
    ######################################(2)##########################################
     Click Element  ${SubmitButtonid}
      Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
      Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}
#      Click Element    ${InvalidCredentialsPopupMessage}
      ##################################(3)###############################
       Click Element  ${SubmitButtonid}
        Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
        Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}
#        Click Element    ${InvalidCredentialsPopupMessage}
        #####################################(4)###############################
         Click Element  ${SubmitButtonid}
          Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
          Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}
#          Click Element    ${InvalidCredentialsPopupMessage}
          #######################################(5)###################################
           Click Element  ${SubmitButtonid}
            Wait Until Element Is Visible    ${ValidUsernameAndInvalidPasswordErrorMsg}
            Element Should Contain   ${ValidUsernameAndInvalidPasswordErrorMsg}    ${InvalidCredentialsErrorMsg}
#            Click Element    ${InvalidCredentialsPopupMessage}
##########################################################################################################################
####################################SOURCES###########################################################################
Navigate to Sources
  set selenium speed   4 seconds
  Wait Until Page Contains Element  ${SourcesTile}
  set selenium speed  4 seconds
  Click Element  ${SourcesTile}
#  set selenium speed  3 seconds
#   ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/SourcesTile-{index}-name.png

Navigate to Module C1
  set selenium speed   2 seconds
  Wait Until Page Contains Element  ${ModuleC1}
   set selenium speed  1 seconds
  Click Element  ${ModuleC1}
#  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleC2-{index}-name.png
#   set selenium speed  1 seconds

Navigate to Module C2
  set selenium speed   2 seconds
  Click Element  ${ModuleC2}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleC2-{index}-name.png
     set selenium speed  1 seconds

Navigate to Module C3
  set selenium speed   2 seconds
  Click Element  ${ModuleC3}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleC3-{index}-name.png
       set selenium speed  1 seconds

Add a New Record
  set selenium speed   2 seconds
  Wait Until Page Contains Element  ${AddNewBtn}
   set selenium speed  1 seconds
  Click Element   ${AddNewBtn}
  set selenium speed  2 seconds
#  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/AddNewRecord-{index}-.png

#Save Record
#  Click Element   ${SaveRecordBtn}
#   set selenium speed  2 seconds

User Defined Sources Single Select
##########################User Defined Sources Single Select###########################################################################
#*************************Single Level (Flat list) ***************************************************************************
  set selenium speed  2 seconds
  Element Should Contain      ${UserDefinedSources_ReadOnlyDefaultValueField}   Test 1
  Click Element  ${UserDefinedSources_SingleSelectDropdown}
  Element Should Contain   ${UserDefinedSources_SingleSelectDropdownContainer}    Test 1
  Click Element  ${UserDefinedSources_SingleSelectDropdownValue}
  Element Should Contain   ${UserDefinedSources_SingleSelectCheckBox_Container}      Test 2
  Click Element  ${UserDefinedSources_SingleSelectChecbox_Value}

User Defined Sources Multi Select
##########################User Defined Sources Multi Select###########################################################################
   set selenium speed  3 seconds
  Click Element  ${UserDefined_MultiSelectDropDown}
  Element Should Contain  ${UserDefined_UserDefinedSources_MultiSelect_DropdownContainer}   Test 1
  Element Should Contain  ${UserDefined_UserDefinedSources_MultiSelect_DropdownContainer}   Test  2
  Click Element  ${UserDefined_MultiSelectDropDownValue1}
  Click Element  ${UserDefined_MultiSelectDropDownValue2}
   Click Element  ${UserDefined_MultiSelectDropDown}
  Element Should Contain  ${UserDefined_UseDefinedSources_MultiSelect_CheckboxContainer}     Test 3
  Element Should Contain  ${UserDefined_UseDefinedSources_MultiSelect_CheckboxContainer}     Test 4
  Click Element  ${UserDefined_MultiSelectCheckboxValue1}
  Click Element  ${UserDefined_MultiSelectCheckboxValue2}


User Defined Sources Hierarchy Single Select
##########################User Defined Sources Hierarchy Single Select###########################################################################
   Set Selenium Implicit Wait   5 seconds
   Element Should Contain  ${UserDefinedSources_HierarchyDefaultReadOnlyValue}     Test 2 -> Test 2.1 -> Test 2.1.1 -> Test 2.1.1.1
  Click Element   ${UserDefinedSourcesHierarchySingleSelectDropdown}
  Element Should Contain  ${UserDefinedSourcesHierarchySingleSelectDropdown_Container}       Test 1
    Click Element  ${UserDefinedSourcesHierarchySingleSelectDropdownExpand}
    Element Should Contain   ${UserDefinedSourceHierarchySingleSelectValueContainer}        Test 1.1
  Click Element  ${UserDefinedSourcesHierarchySingleSelectDropdownValue}

   Element Should Contain  ${UserDefinedSourcesHierarchySingleSelectCheckboxContainer}      Test 2
  Click Element  ${UserDefinedSourcesHierarchySingleSelectCheckboxExpandTest2}
  Element Should Contain  ${UserDefinedSourcesHierarchySingleSelectCheckboxTest2.1Exist}       Test 2.1
  Click Element   ${UserDefinedSourcesHierarchySingleSelectCheckboxExpand2.1}
  Element Should Contain  ${UserDefinedSourcesHierarchySingleSelectCheckbox2.1.1Exists}        Test 2.1.1
  Click Element  ${UserDefinedSourcesHierarchySingleSelectCheckboxExpand2.1.1}
  Element Should Contain  ${UserDefinedSourcesHierarchySingleSelectCheckboxExpand2.1.1.1Exists}     Test 2.1.1.1
  Click Element    ${UserDefinedSourcesHierarchySingleSelectCheckboxExpand2.1.1.1Exists}



User Defined Sources Hierarchy Multi Select
##########################User Defined Sources Hierarchy Multi Select###########################################################################
  Click Element   ${UserDefinedSourcesHierarchyMultiSelectDropDown}
  Element Should Contain   ${UserDefinedSourcesHierarchyMultiSelectDropDownContainer}     Test 1
  Click Element   ${UserDefinedSourcesHierarchyMultiSelectDropdownExpandTest1}
   Element Should Contain   ${UserDefinedSourcesHierarchyMultiSelectDropdownTest1.1Exists}     Test 1.1
   Click Element         ${UserDefinedSourcesHierarchyMultiSelectDropdownTest1.1}
   Click Element  ${UserDefinedSourcesHierarchyMultiSelectDropdownExpandTest2}
  Element Should Contain  ${UserDefinedSourcesHierarchyMultiSelectDropdownTest2.1Exists}    Test 2.1
    Click Element  ${UserDefinedSourcesHierarchyMultiSelectDropdownTest2.1}


Display and Select -Min/Max
    Wait Until Page Contains Element  ${Select/Display-Min/Max}
    Click Element  ${Select1-1Display1-1Dropdown}
    Click Element  ${Select1-1Display1-1Value}
    Click Element  ${Select1-2Display1-2Expand}
    Click Element  ${Select1-2Display1-2ExpandTest1}
    Click Element  ${Select1-2Display1-2ExpandTest1.1}
    Click Element  ${Select1-MaxDisplay1-MaxDropdown}
    Click Element  ${Select1-MaxDisplay1-MaxExpandTest2}
    Click Element  ${Select1-MaxDisplay1-MaxExpandTest2.1}
    Click Element  ${Select1-MaxDisplay1-MaxExpandTest2.1.1}
    Click Element  ${Select1-MaxDisplay1-MaxExpandTest2.1.1.1}
    Click Element  ${Select2-2Display1-3Dropdown}
    Click Element  ${Select2-2Display1-3ExpandTest3}
    Click Element  ${Select2-2Display1-3Value}
    Click Element   ${SelectMax-MaxDisplayMax-MaxDropdown}
    Click Element    ${SelectMax-MaxDisplayMax-MaxExpandTest3}
    Click Element    ${SelectMax-MaxDisplayMax-MaxExpandTest3.1}
    Click Element   ${SelectMax-MaxDisplayMax-MaxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/DisplayMaxMin-{index}-.png
            set selenium speed  1 seconds
         Click Element   ${SaveRecordBtn}


Filtered (Lite)
    Wait Until Page Contains Element  ${FilterOn}
       Click Element  ${EqualstoDropdown}
       Click Element  ${EqualsToExpandTest2}
       Click Element  ${EqualsToExpand2.1}
       Click Element  ${EqualsToExpand2.1.1}
       Click Element  ${EqualsToValue2}
       Click Element  ${IsNotEqualToDropdown}
       Click Element  ${IsNotEqualToExpandTest3}
       Click Element  ${IsNotEqualToExpand3.1}
      Click Element  ${IsNotEqualToValue}
      Click Element  ${ContainsDropdown}
      Click Element  ${ContainsExpandTest2}
      Click Element  ${ContainsExpandTest2.1}
      Click Element   ${ContainsValue2.1.1}
      Click Element   ${DoesNotContainDropdown}
      Click Element   ${DoesNotContainExpandTest3}
      Click Element   ${DoesNotContainExpandTest3.1}
      Click Element   ${DoesNotContainValue3.1.1}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/Filters-{index}-.png
            set selenium speed  1 seconds
         Click Element   ${SaveRecordBtn}

Module A1 All Levels and Views Textbox B1 All
   Click Element  ${B1AllDropdownControl}
   Click Element  ${B1AllExpandA1}
   Element Should Contain    ${B1AllDropdownValueA1Container}    A1
   Click Element  ${B1AllValue}
   Click Element  ${B1AllCheckboxExpandA1}
   Element Should Contain   ${B1AllCheckboxValueA1B1Container}    A1 B1
   Click Element  ${B1AllCheckboxValue}
     ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textbox-{index}-.png
                   set selenium speed  1 seconds
                Click Element   ${SaveRecordBtn}
Module A1 ALL Levels and Views Textbox B2 Specific
   Click Element  ${B2SpecificDropdwonControl}
   Element Should Contain  ${B2SpecificDropdwonControlA1Container}    A1
   Click Element  ${B2SpecificExpandA1}
   Element Should Contain   ${B2SpecificExpandA1Container}   A1 B2
   Click Element  ${B2SpecificValue}

   Element Should Contain     ${B2SpecificCheckboxA1Container}  A1
   Click Element  ${B2SpecificCheckboxExpandA1}
   Element Should Contain    ${B2SpecificCheckboxExpandA1B2Container}   A1 B2
   Click Element  ${B2SpecifiCheckboxValue}
     ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textbox-{index}-.png
                   set selenium speed  1 seconds
                Click Element   ${SaveRecordBtn}
Module A1 ALL Levels and Views Textbox B3 Module
   Click Element  ${B3ModuleDropdownControl}
   Element Should Contain   ${B3ModuleDropdownControlContainer}    A1
   Click Element  ${B3ModuleExpandA1}
   Element Should Contain    ${B3ModuleExpandA1Container}   A1 B3
   Click Element  ${B3ModuleValue}

   Element Should Contain    ${B3ModuleCheckboxA1Container}   A1
   Click Element  ${B3ModuleCheckboxExpandA1}
   Element Should Contain    ${B3ModuleCheckboxExpandA1Container}   A1 B3
   Click Element  ${B3ModuleCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textbox-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A1 ALL Levels and Views Textbox B4 Enherit
   Click Element  ${B4EnheritDropdownControl}
   Element Should Contain   ${B4EnheritDropdownControlContainer}  A1
   Click Element  ${B4EnheritExpandA1}
   Element Should Contain    ${B4EnheritExpandA1Container}  A1 B4
   Click Element  ${B4EnheritValue}

   Element Should Contain   ${B4EnheritContainer}  A1
   Click Element  ${B4EnheritCheckboxExpand}
   Element Should Contain  ${B4EnheritCheckboxExpandContainer}  A1 B4
   Click Element  ${B4EnheritCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textbox-{index}-.png
               set selenium speed  1 seconds
            Click Element   ${SaveRecordBtn}

Module A1-All Levels and Views Numeric Textbox B1 All
    Click Element  ${B1AllNumericDropdownControl}
    Element Should Contain    ${B1AllNumericDropdownControlContainer}  1.000
    Click Element  ${B1AllNumericExpand1}
    Element Should Contain    ${B1AllNumericExpand1Container}   11.000
    Click Element  ${B1AllNumericValue}

    Element Should Contain   ${B1AllNumericCheckboxContainer}   1.000
    Click Element  ${B1AllNumericCheckboxExpand1}
    Element Should Contain    ${B1AllNumericCheckboxExpand1Container}    11.000
    Click Element  ${B1AllNumericCheckboxValue}
     ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                    set selenium speed  1 seconds
                 Click Element   ${SaveRecordBtn}
Module A1-All Levels and Views Numeric Textbox B2 Specific
    Click Element  ${B2SpecificNumericDropdownControl}
    Element Should Contain   ${B2SpecificNumericDropdownControlContainer}    1.000
    Click Element  ${B2SpecificNumericExpand}
    Element Should Contain     ${B2SpecificNumericExpandContainer}    12.000
    Click Element  ${B2SpecificNumericValue}

    Element Should Contain   ${B2SpecificNumericCheckboxContainer}  1.000
    Click Element  ${B2SpecificNumericCheckboxExpand1}
    Element Should Contain    ${B2SpecificNumericCheckboxExpand1Container}    12.000
    Click Element  ${B2SpecificNumericCheckboxValue}
      ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}

Module A1-All Levels and Views Numeric Textbox B3 Module
    Click Element  ${B3ModuleNumericDropdownControl}
    Element Should Contain   ${B3ModuleNumericDropdownControlContainer}   1.000
   Click Element  ${B3ModuleNumericExpand}
   Element Should Contain  ${B3ModuleNumericExpandContainer}  13.000
    Click Element  ${B3ModuleNumericValue}

    Element Should Contain   ${B3ModuleNumericCheckboxContainer}  1.000
    Click Element  ${B3ModuleNumericCheckboxExpand1}
    Element Should Contain   ${B3ModuleNumericCheckboxExpand1Container}   13.000
    Click Element  ${B3ModuleNumericCheckboxValue}
     ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                    set selenium speed  1 seconds
                 Click Element   ${SaveRecordBtn}

Module A1-All Levels and Views Numeric Textbox B4 Enherit
    Click Element  ${B4EnheritNumericDropdownControl}
    Element Should Contain   ${B4EnheritNumericDropdownControlContainer}  1.000
    Click Element  ${B4EnheritNumericExpand}
    Element Should Contain  ${B4EnheritNumericExpandContainer}   14.000
    Click Element  ${B4EnheritNumericValue}

    Element Should Contain   ${B4EnheritNumericCheckboxContainer}    1.000
    Click Element  ${B4EnheritNumericCheckboxExpand1}
    Element Should Contain   ${B4EnheritNumericCheckboxExpand1Container}   14.000
    Click Element  ${B4EnheritNumericCheckboxValue}
      ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1NumericTextbox-{index}-.png
                   set selenium speed  1 seconds
                Click Element   ${SaveRecordBtn}
       ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                      set selenium speed  1 seconds
                   Click Element   ${SaveRecordBtn}
Module A1 -All Levels and Views Text Area B1 All

    Click Element  ${B1AllTextAreaDropdownControl}
     Element Should Contain   ${B1AllTextAreaDropdownControlContainer}    Test A1
    Click Element  ${B1AllTextAreaExpandTestA1}
     Element Should Contain   ${B1AllTextAreaExpandTestA1Container}   Test A1 B1
    Click Element  ${B1AllTextAreaValue}

     Element Should Contain   ${B1AllTextAreaCheckboxContainer}  Test A1
    Click Element  ${B1AllTextAreaCheckboxExpandTestA1}
     Element Should Contain    ${B1AllTextAreaCheckboxExpandTestA1Container}    Test A1 B1
    Click Element  ${B1AllTextAreaCheckboxValue}
     ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                    set selenium speed  1 seconds
                 Click Element   ${SaveRecordBtn}
Module A1 -All Levels and Views Text Area B2 Specific
    Click Element  ${B2SpecificTextAreaDropdownControl}
     Element Should Contain  ${B2SpecificTextAreaDropdownControlContainer}   Test A1
    Click Element  ${B2SpecificAreaExpandTestA1}
     Element Should Contain   ${B2SpecificAreaExpandTestA1Container}     Test A1 B2
    Click Element  ${B2SpecificTextAreaValue}

     Element Should Contain  ${B2SpecificTextAreaCheckboxContainer}   Test A1
    Click Element  ${B2SpecificTextAreaCheckboxExpandTestA1}
     Element Should Contain    ${B2SpecificTextAreaCheckboxExpandTestA1Container}  Test A1 B2
    Click Element  ${B2SpecificTextAreaCheckboxValue}
   ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A1 -All Levels and Views Text Area B3 Module
    Click Element  ${B3ModuleTextAreaDropdownControl}
    Click Element  ${B3ModuleTextAreaExpandTestA1}
     Element Should Contain    ${B3ModuleTextAreaValue}  Test A1 B3
    Click Element  ${B3ModuleTextAreaValue}

    Click Element  ${B3ModuleTextAreaCheckboxExpandTestA1}
     Element Should Contain    ${B3ModuleTextAreaCheckboxExpandTestA1Container}   Test A1 B3
    Click Element  ${B3ModuleTextAreaCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
                   set selenium speed  1 seconds
                Click Element   ${SaveRecordBtn}
Module A1 -All Levels and Views Text Area B4 Enherit
    Click Element  ${B4EnheritTextAreaDropdownControl}
    Click Element  ${B4EnheritTextAreaExpandTestA1}
     Element Should Contain  ${B4EnheritTextAreaValue}  Test A1 B4
    Click Element  ${B4EnheritTextAreaValue}

    Click Element  ${B4EnheritTextAreaCheckboxExpandTestA1}
     Element Should Contain  ${B4EnheritTextAreaCheckboxContainer}   Test A1 B4
    Click Element  ${B4EnheritTextAreaCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Textarea-{index}-.png
               set selenium speed  1 seconds
            Click Element   ${SaveRecordBtn}

Navigate to Module A2 Specific
   Click Element  ${ModuleSourcesTab}
   Click Element  ${ModuleA2Specific}
   Wait Until Page Contains Element  ${ModuleA2TextBoxField}

Navigate to Module A1 All Levels And Views
  Wait Until Page Contains Element  ${ModuleA1TextBoxField}
  Click Element  ${ModuleSourcesTab}

Navigate to Module A3
   Click Element  ${ModuleSourcesTab}
   Click Element  ${ModuleA3ModuleControlTab}
   Wait Until Page Contains Element  ${ModuleA3TextBox}



Module A2 - Specifc Textbox B1 All
#################################MODULE A2 SPECIFIC######################################
###############################B1 All Textbox###################################################
  Click Element   ${ModuleA2_B1AllDropdownControl}
  Click Element   ${ModuleA2_B1AllExpandA2}
  Element Should Contain     ${ModuleA2_B1AllValue}    A2 B1
  Click Element   ${ModuleA2_B1AllValue}
  Click Element   ${ModuleA2_B1AllCheckboxExpandA2}
   Element Should Contain  ${ModuleA2_B1AllCheckboxValueContainer}   A2 B1
  Click Element  ${ModuleA2_B1AllCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A2 - Specifc Textbox B2 Specific
  ###############################B2 Specific#####################################################################
   Click Element   ${ModuleA2_B2SpecificDropdwonControl}
   Click Element  ${ModuleA2_B2SpecificExpandA2}
   Element Should Contain    ${ModuleA2_B2SpecificValue}   A2 B2
   Click Element  ${ModuleA2_B2SpecificValue}

   Click Element  ${ModuleA2_B2SpecificCheckboxExpandA2}
   Element Should Contain  ${ModuleA2_B2SpecificCheckboxValueContainer}   A2 B2
   Click Element  ${ModuleA2_B2SpecifiCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A2 - Specifc Textbox B3 Module
  ############################B3-Module###############################################################################
   Click Element  ${ModuleA2_B3ModuleDropdownControl}
  Click Element   ${ModuleA2_B3ModuleExpandA2}
  Element Should Contain     ${ModuleA2_B3ModuleValue}  A2 B3
   Click Element  ${ModuleA2_B3ModuleValue}

   Click Element  ${ModuleA2_B3ModuleCheckboxExpandA2}
   Element Should Contain  ${ModuleA2_B3ModuleCheckboxValueContainer}   A2 B3
   Click Element  ${ModuleA2_B3ModuleCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                set selenium speed  1 seconds
             Click Element   ${SaveRecordBtn}
Module A2 - Specifc Textbox B4 Enherit
  ################################B4-Enherit####################################################################################
   Click Element  ${ModuleA2_B4EnheritDropdownControl}
   Click Element  ${ModuleA2_B4EnheritExpandA2}
   Element Should Contain    ${ModuleA2_B4EnheritValue}   A2 B4
   Click Element  ${ModuleA2_B4EnheritValue}

   Click Element  ${ModuleA2_B4EnheritCheckboxExpandA2}
   Element Should Contain  ${ModuleA2_B4EnheritCheckboxValueContainer}   A2 B4
   Click Element  ${ModuleA2_B4EnheritCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2Textbox-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}

Module A2 - Specific Numeric B1 All
  ##########################MODULE A2 NUMERIC TEXTBOX########################################################################
  ############################B1 All Numeric##############################################################################
   Click Element  ${ModuleA2_B1AllNumericDropdownControl}
   Click Element  ${ModuleA2_B1AllNumericExpand2}
   Element Should Contain    ${ModuleA2_B1AllNumericValue}  21.000
   Click Element  ${ModuleA2_B1AllNumericValue}
   Click Element  ${ModuleA2_B1AllNumericCheckboxExpand2}
   Element Should Contain   ${ModuleA2_B1AllNumericCheckboxValueContainer}   21.000
   Click Element  ${ModuleA2_B1AllNumericCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A2 - Specific Numeric B2 Specific
  #################################B2 Specific Numeric######################################################
   Click Element  ${ModuleA2_B2SpecificNumericDropdownControl}
   Click Element  ${ModuleA2_B2SpecificNumericExpand2}
   Element Should Contain    ${ModuleA2_B2SpecificNumericValue}   22.000
   Click Element  ${ModuleA2_B2SpecificNumericValue}
   Click Element  ${ModuleA2_B2SpecificNumericCheckboxExpand2}
   Element Should Contain  ${ModuleA2_B2SpecificNumericCheckboxValueContainer}  22.000
   Click Element  ${ModuleA2_B2SpecificNumericCheckboxValue}
   ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                 set selenium speed  1 seconds
              Click Element   ${SaveRecordBtn}
Module A2 - Specific Numeric B3 Module
  ################################B3 Module Numeric#########################################################
   Click Element  ${ModuleA2_B3ModuleNumericDropdownControl}
   Click Element  ${ModuleA2_B3ModuleNumericExpand2}
   Element Should Contain   ${ModuleA2_B3ModuleNumericValue}  23.000
   Click Element  ${ModuleA2_B3ModuleNumericValue}
   Click Element  ${ModuleA2_B3ModuleNumericCheckboxExpand2}
   Element Should Contain   ${ModuleA2_B3ModuleNumericCheckboxValueContainer}  23.000
   Click Element  ${ModuleA2_B3ModuleNumericCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
               set selenium speed  1 seconds
            Click Element   ${SaveRecordBtn}
Module A2 - Specific Numeric B4 Enherit
  ###################################B4 Enherit Numeric#####################################################
   Click Element  ${ModuleA2_B4EnheritNumericDropdownControl}
   Click Element  ${ModuleA2_B4EnheritNumericExpand2}
   Element Should Contain    ${ModuleA2_B4EnheritNumericValue}  24.000
   Click Element  ${ModuleA2_B4EnheritNumericValue}
   Click Element  ${ModuleA2_B4EnheritNumericCheckboxExpand2}
   Element Should Contain  ${ModuleA2_B4EnheritNumericCheckboxValueContainer}  24.000
   Click Element  ${ModuleA2_B4EnheritNumericCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA1Numeric-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
                ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                              set selenium speed  1 seconds
                           Click Element   ${SaveRecordBtn}

Module A2 - Specific Text Area B1 All
  #####################################MODULE A2 TEXT AREA###################################
  #######################################B1 All Textarea##########################################################
   Click Element  ${ModuleA2_B1AllTextAreaDropdownControl}
   Click Element  ${ModuleA2_B1AllTextAreaExpandTestA2}
   Element Should Contain    ${ModuleA2_B1AllTextAreaValue}  Test A2 B1
   Click Element  ${ModuleA2_B1AllTextAreaValue}
   Click Element  ${ModuleA2_B1AllTextAreaCheckboxExpandTestA2}
   Element Should Contain   ${ModuleA2_B1AllTextAreaCheckboxValueContainer}   Test A2 B1
   Click Element  ${ModuleA2_B1AllTextAreaCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}

Module A2 - Specific Text Area B2 Specific
  ##################################B2 Specific Textarea############################################################
   Click Element  ${ModuleA2_B2SpecificTextAreaDropdownControl}
   Click Element  ${ModuleA2_B2SpecificAreaExpandTestA1}
   Element Should Contain   ${ModuleA2_B2SpecificTextAreaValue}  Test A2 B2
   Click Element  ${ModuleA2_B2SpecificTextAreaValue}

   Click Element  ${ModuleA2_B2SpecificTextAreaCheckboxExpandTestA2}
   Element Should Contain  ${ModuleA2_B2SpecificTextAreaCheckboxValueContainer}    Test A2 B2
   Click Element  ${ModuleA2_B2SpecificTextAreaCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A2 - Specific Text Area B3 Module
  ################################B3 Module TextArea##################################################################
   Click Element  ${ModuleA2_B3ModuleTextAreaDropdownControl}
   Click Element  ${ModuleA2_B3ModuleTextAreaExpandTestA2}
   Element Should Contain  ${ModuleA2_B3ModuleTextAreaValue}  Test A2 B3
   Click Element  ${ModuleA2_B3ModuleTextAreaValue}
   Click Element  ${ModuleA2_B3ModuleTextAreaCheckboxExpandTestA2}
   Element Should Contain  ${ModuleA2_B3ModuleTextAreaCheckboxValueContainer}  Test A2 B3
   Click Element  ${ModuleA2_B3ModuleTextAreaCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}
Module A2 - Specific Text Area B4 Enherit
  ################################B4 Enherit Textarea####################################################################
   Click Element  ${ModuleA2_B4EnheritTextAreaDropdownControl}
   Click Element  ${ModuleA2_B4EnheritTextAreaExpandTestA2}
   Element Should Contain   ${ModuleA2_B4EnheritTextAreaValue}  Test A2 B4
   Click Element  ${ModuleA2_B4EnheritTextAreaValue}

   Click Element  ${ModuleA2_B4EnheritTextAreaCheckboxExpandTestA2}
   Element Should Contain   ${ModuleA2_B4EnheritTextAreaCheckboxValueContainer}  Test A2 B4
   Click Element  ${ModuleA2_B4EnheritTextAreaCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA2specific-{index}-.png
               set selenium speed  1 seconds
            Click Element   ${SaveRecordBtn}



#################################MODULE A3 -MODULE CONTROL ######################################
Module A3 - Module Control Textbox B1 All
###############################B1 All Textbox###################################################
  Click Element  ${ModuleA3_B1AllDropdownControl}
  Click Element  ${ModuleA3_B1AllExpandA3}
  Element Should Contain     ${ModuleA3_B1AllValue}     A3 B1
  Click Element  ${ModuleA3_B1AllValue}
  Click Element  ${ModuleA3_B1AllCheckboxExpandA3}
  Element Should Contain    ${ModuleA3_B1AllCheckboxValueContainer}    A3 B1
  Click Element  ${ModuleA3_B1AllCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}

Module A3 - Module Control Textbox B2 Specific
###############################B2 Specific#####################################################################
  Click Element  ${ModuleA3_B2SpecificDropdwonControl}
  Click Element  ${ModuleA3_B2SpecificExpandA3}
  Element Should Contain    ${ModuleA3_B2SpecificValue}   A3 B2
  Click Element  ${ModuleA3_B2SpecificValue}
  Click Element  ${ModuleA3_B2SpecificCheckboxExpandA3}
  Element Should Contain  ${ModuleA3_B2SpecifiCheckboxValueContainer}  A3 B2
  Click Element  ${ModuleA3_B2SpecifiCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}

Module A3 - Module Control Textbox B3 Module
############################B3-Module###############################################################################
  Click Element  ${ModuleA3_B3ModuleDropdownControl}
  Click Element  ${ModuleA3_B3ModuleExpandA3}
  Element Should Contain    ${ModuleA3_B3ModuleValue}   A3 B3
  Click Element   ${ModuleA3_B3ModuleValue}
  Click Element  ${ModuleA3_B3ModuleCheckboxExpandA3}
  Element Should Contain   ${ModuleA3_B3ModuleCheckboxValueContainer}   A3 B3
  Click Element  ${ModuleA3_B3ModuleCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}

Module A3 - Module Control Textbox B4 Enherit
################################B4-Enherit####################################################################################
  Click Element  ${ModuleA3_B4EnheritDropdownControl}
  Click Element  ${ModuleA3_B4EnheritExpandA3}
  Element Should Contain    ${ModuleA3_B4EnheritValue}   A3 B4
  Click Element  ${ModuleA3_B4EnheritValue}
  Click Element  ${ModuleA3_B4EnheritCheckboxExpandA3}
  Element Should Contain   ${ModuleA3_B4EnheritCheckboxValueContainer}   A3 B4
  Click Element  ${ModuleA3_B4EnheritCheckboxValue}
    ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3Textbox-{index}-.png
                  set selenium speed  1 seconds
               Click Element   ${SaveRecordBtn}

Module A3 - Module Control Numeric B1 All
############################B1 All Numeric##############################################################################
  Click Element  ${ModuleA3_B1AllNumericDropdownControl}
  Click Element  ${ModuleA3_B1AllNumericExpand3}
  Element Should Contain  ${ModuleA3_B1AllNumericValue}  31.000
  Click Element  ${ModuleA3_B1AllNumericValue}
  Click Element  ${ModuleA3_B1AllNumericCheckboxExpand3}
  Element Should Contain   ${ModuleA3_B1AllNumericCheckboxValueContainer}  31.000
  Click Element  ${ModuleA3_B1AllNumericCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}

Module A3 - Module Control Numeric B2 Specific
#################################B2 Specific Numeric######################################################
  Click Element  ${ModuleA3_B2SpecificNumericDropdownControl}
  Click Element  ${ModuleA3_B2SpecificNumericExpand3}
  Element Should Contain   ${ModuleA3_B2SpecificNumericValue}   32.000
  Click Element  ${ModuleA3_B2SpecificNumericValue}
  Click Element  ${ModuleA3_B2SpecificNumericCheckboxExpand3}
  Element Should Contain  ${ModuleA3_B2SpecificNumericCheckboxValueContainer}   32.000
  Click Element  ${ModuleA3_B2SpecificNumericCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}
Module A3 - Module Control Numeric B3 Module
################################B3 Module Numeric#########################################################
  Click Element  ${ModuleA3_B3ModuleNumericDropdownControl}
  Click Element  ${ModuleA3_B3ModuleNumericExpand3}
  Element Should Contain    ${ModuleA3_B3ModuleNumericValue}   33.000
  Click Element  ${ModuleA3_B3ModuleNumericValue}
  Click Element  ${ModuleA3_B3ModuleNumericCheckboxExpand3}
  Element Should Contain   ${ModuleA3_B3ModuleNumericCheckboxValueContainer}   33.000
  Click Element  ${ModuleA3_B3ModuleNumericCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}
Module A3 - Module Control Numeric B4 Enherit
###################################B4 Enherit Numeric#####################################################
  Click Element  ${ModuleA3_B4EnheritNumericDropdownControl}
  Click Element  ${ModuleA3_B4EnheritNumericExpand3}
  Element Should Contain  ${ModuleA3_B4EnheritNumericValue}   34.000
  Click Element  ${ModuleA3_B4EnheritNumericValue}
  Click Element  ${ModuleA3_B4EnheritNumericCheckboxExpand3}
  Element Should Contain   ${ModuleA3_B4EnheritNumericCheckboxValueContainer}   34.000
  Click Element  ${ModuleA3_B4EnheritNumericCheckboxValue}

   ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3Numeric-{index}-.png
                 set selenium speed  1 seconds
              Click Element   ${SaveRecordBtn}

Module A3 - Module Control Text Area B1 All
#######################################B1 All Textarea##########################################################
  Click Element  ${ModuleA3_B1AllTextAreaDropdownControl}
  Click Element  ${ModuleA3_B1AllTextAreaExpandTestA3}
  Element Should Contain   ${ModuleA3_B1AllTextAreaValue}  Test A3 B1
  Click Element  ${ModuleA3_B1AllTextAreaValue}
  Click Element  ${ModuleA3_B1AllTextAreaCheckboxExpandTestA3}
  Element Should Contain   ${ModuleA3_B1AllTextAreaCheckboxValueContainer}    Test A3 B1
  Click Element  ${ModuleA3_B1AllTextAreaCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}
Module A3 - Module Control Text Area B2 Specific
##################################B2 Specific Textarea############################################################
  Click Element  ${ModuleA3_B2SpecificTextAreaDropdownControl}
  Click Element  ${ModuleA3_B2SpecificAreaExpandTestA3}
  Element Should Contain    ${ModuleA3_B2SpecificTextAreaValue}   Test A3 B2
  Click Element  ${ModuleA3_B2SpecificTextAreaValue}
  Click Element  ${ModuleA3_B2SpecificTextAreaCheckboxExpandTestA3}
  Element Should Contain   ${ModuleA3_B2SpecificTextAreaCheckboxValueContainer}  Test A3 B2
  Click Element  ${ModuleA3_B2SpecificTextAreaCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                     set selenium speed  1 seconds
                  Click Element   ${SaveRecordBtn}
Module A3 - Module Control Text Area B3 Module
################################B3 Module TextArea##################################################################
  Click Element  ${ModuleA3_B3ModuleTextAreaDropdownControl}
  Click Element  ${ModuleA3_B3ModuleTextAreaExpandTestA3}
  Element Should Contain   ${ModuleA3_B3ModuleTextAreaValue}   Test A3 B3
  Click Element  ${ModuleA3_B3ModuleTextAreaValue}
  Click Element  ${ModuleA3_B3ModuleTextAreaCheckboxExpandTestA3}
  Element Should Contain    ${ModuleA3_B3ModuleTextAreaCheckboxValueContainer}     Test A3 B3
  Click Element  ${ModuleA3_B3ModuleTextAreaCheckboxValue}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                    set selenium speed  1 seconds
                 Click Element   ${SaveRecordBtn}

Module A3 - Module Control Text Area B4 Enherit
################################B4 Enherit Textarea####################################################################
  Click Element  ${ModuleA3_B4EnheritTextAreaDropdownControl}
  Click Element  ${ModuleA3_B4EnheritTextAreaExpandTestA3}
  Element Should Contain    ${ModuleA3_B4EnheritTextAreaValue}   Test A3 B4
  Click Element  ${ModuleA3_B4EnheritTextAreaValue}
  Click Element  ${ModuleA3_B4EnheritTextAreaCheckboxExpandTestA3}
  Element Should Contain    ${ModuleA3_B4EnheritTextAreaCheckboxValueContainer}     Test A3 B4
  Click Element  ${ModuleA3_B4EnheritTextAreaCheckboxValue}

     ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/ModuleA3ModuleControl-{index}-.png
                   set selenium speed  1 seconds
                Click Element   ${SaveRecordBtn}
#####################################################MODULE C2###################################################################################

Navigate to System Sources
#   Wait until page contains   ${SystemSourcesTab}
    set selenium speed  5 seconds
    Click Element      ${SystemSourcesTab}

System Source Standard Level List Single Select
#################################System Source  Standard Level List Single Select ############################################################################################
   Click Element  ${SystemSource_StandardLevelList_SingleSelectDropdownControl}
   Element Should Contain   ${SystemSource_StandardLevelList_SingleSelectDropdownControlContainer}    Metrix
   Click Element  ${SystemSource_StandardLevelList_ExpandMetrix}
    Element Should Contain   ${SystemSource_StandardLevelList_SingleSelectDropdownControlContainer}    Account Management
   Click Element  ${SystemSource_StandardLevelList_ExpandAccountManagement}
    Element Should Contain   ${SystemSource_StandardLevelList_SingleSelectDropdownControlContainer}   Customer Relationship Management
   Click Element  ${SystemSource_StandardLevelList_CustomerRelationships}
     Click Element   ${SaveRecordBtn}

System Source Standard Level List Multi Select Dropdown
#################################Single select############################################################################################
   Click Element  ${SystemSource_MultiSelectDropdowncontrol}
   Element Should Contain   ${SystemSource_MultiSelectDropdowncontrolContainer}   Metrix
  Click Element  ${SystemSource_ExpandMultiSelectMetrixDropdown}
   Element Should Contain   ${SystemSource_MultiSelectDropdowncontrolContainer}   Account Management
  Click Element  ${SystemSource_ExpandMultiSelectAccountManagementDropdown}
   Element Should Contain   ${SystemSource_MultiSelectDropdowncontrolContainer}   Customer Relationship Management
  Click Element  ${SystemSource_MultiSelect_CustomerRelationship_Value}
    Click Element   ${SaveRecordBtn}

System Source Standard Level List Multi Select Checkbox
  Element Should Contain   ${MultiSelectCheckboxDropdownControlContainer}  Metrix
  Click Element  ${MultiSelectCheckboxExpandMetrix}
  Element Should Contain   ${MultiSelectCheckboxDropdownControlContainer}  Account Management
  Click Element  ${MultiSelectCheckboxAccountManagement}
  Element Should Contain   ${MultiSelectCheckboxDropdownControlContainer}  Software Develeopment
  Click Element  ${MultiSelectCheckboxSoftwareDevelopment}
  Click Element   ${SaveRecordBtn}

System Sources Standard View Lists Single Select
 #################################### System Sources - Views##############################################################################
    Click Element   ${SingleSelectViewListDropdownControl}
    Element Should Contain  ${SingleSelectViewListDropdownControlContainer}  Quality
    Click Element  ${SingleSelectDropdownValue}

System Sources Standard View Lists Multiple Select dropdown
    Click Element    ${MultipleSelectViewlistDropdownControl}
    Element Should Contain   ${MultipleSelectViewlistDropdownControlContainer}   Human Resource
    Click Element    ${MultipleSelectViewlistDropdownHR}
    Element Should Contain   ${MultipleSelectViewlistDropdownControlContainer}   Quality
    Click Element   ${MultipleSelectViewlistDropdownQuality}
    Element Should Contain   ${MultipleSelectViewlistDropdownControlContainer}   Safety
    Click Element   ${MultipleSelectViewlistDropdownSafety}

System Sources Standard View Lists Multiple Select Checkbox List
    Click Element    ${MultipleSelectViewlistDropdownControl}
    Element Should Contain  ${MultipleSelectCheckboxContainer}   Human Resource
    Click Element   ${MultiSelectCheckboxHR}
    Element Should Contain  ${MultipleSelectCheckboxContainer}   Quality
    Click Element   ${MultiSelectCheckBoxQuality}
    Element Should Contain  ${MultipleSelectCheckboxContainer}   Safety
   Click Element    ${MultiSelectCheckboxSafety}
#        ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/SystemSourcesView-{index}-.png
#                         set selenium speed  1 seconds
                      Click Element   ${SaveRecordBtn}

System Sources Standard User Lists Single Select
############################System Sources - Users############################################################################################
   Click Element  ${SingleSelectDropdownUser}
   Click Element  ${SingleSelectDropdownUserValue}
System Sources Standard User Lists Multi Select Dropdown List
   Click Element  ${MultiselectDropdownUser}
   Click Element  ${MultiSelectDropdownUserRecordOwnershipExternal}
   Click Element  ${MultiSelectDropdownUserRecordOwnership1}
   Click Element   ${MultiSelectDropdownUserRecordOwnership2}
    Click Element  ${MultiselectDropdownUser}

System Sources Standard User Lists Multi Select Checkbox List
   Click Element  ${MultiSelectCheckboxUserRecordOwnershipExternal}
   Click Element  ${MultiSelectCheckboxUserRecordOwnership1}
   Click Element  ${MultiSelectCheckboxUserRecordOwnership2}

#  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/SystemSourcesUsers-{index}-.png
#                           set selenium speed  1 seconds
                        Click Element   ${SaveRecordBtn}

System Sources Standard User Groups Lists Single Select
####################################### System Sources - User Groups#################################################################################
    Click Element  ${SingleSelectDropdownUserGroups}
     Click Element  ${SingleSelectDropdownUserGroupsValue}
System Sources Standard User Groups Lists Multi Select Dropdown List
     Click Element  ${MultiselectDropdownUserGroups}
      Click Element  ${MultiSelectDropdownUserGroupsLevel1}
     Click Element  ${MultiSelectDropdownUserGroupsLevel2}
      Click Element  ${MultiSelectDropdownUserGroupsStandard}
      Click Element  ${MultiselectDropdownUserGroups}
System Sources Standard User Groups Lists Multi Select Checkbox List
     Click Element  ${MultiSelectCheckboxUserGroupsLevel1}
     Click Element  ${MultiSelectCheckboxUserGroupsLevel2}
     Click Element  ${MultiSelectCheckboxUserGroupsStandard}
#       ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/SystemSourcesUsersGroups-{index}-.png
#                                set selenium speed  1 seconds
                             Click Element   ${SaveRecordBtn}

##################################All Filters Instance Based########################################
##################################Single Select#################################################################

Navigate To All Filters Instance Based
  Click Element  ${AllFiltersInstanceBasedTab}
  ${file1} =    Capture Page Screenshot    ${OUTPUTDIR}/Results/AllFiltersInstanceBasedTab-{index}-.png
                                  set selenium speed  1 seconds

Add Record - All Filters Instance Based
   Click Element  ${AddAllFilterInstancebasedRecord}
    set selenium speed  1 seconds

Verify Default Values on Level and View Fields
############################Verify Level and View Field####################################################################
    Wait Until Page Contains Element  ${LevelField}
    #Verify Text field
    Wait Until Page Contains Element  ${ViewField}
    #Verify text field
#     ${file1} =    Capture Page Screenshot ${OUTPUTDIR}/Results/VerifyLevelandViewField-{index}-.png
                                      set selenium speed  1 seconds


Verify Default Values on Match on(Instance Based)
#######################################Verify Deafault Values on Match on(Instance Based)###################################
  Element Should Be Visible    ${MatchonInstanceBasedTextbox}
  Element Should Contain    ${MatchonInstanceBasedDropdownText}   Test 2
  Element Should Contain  ${MatchonInstanceBasedDropdownSource}  Test 2
  Element Should Contain   ${MatchOnInstanceBasedSpecify}     Test 3
#   ${file1} =    Capture Page Screenshot  ${OUTPUTDIR}/Results/VerifyDefaultValuesonMatchon(Instance Based)-{index}-.png
                                        set selenium speed  1 seconds
Single Select - Equals to (Instance)
###############################Single Select - Equals to (Instance)#########################################################
   Click Element  ${DropdownControl_EqualsToInstanceBasedTextbox}
   Element Should Contain   ${EqualsToInstnaceBasedTextBox_Value}  Test 2
   Click Element  ${EqualsToInstnaceBasedTextBox_Value}
   Click Element  ${DropdownControl_EqualsToInstanceBaseDropdwonText}
#   Element Should Contain   ${EqualsToInstanceBasedDropdownTextCheckboxValue}   Test 2
   Click Element  ${EqualsToInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_EqualsToInstanceBasedDropdownSource}
#  Element Should Contain    ${EqualsToInstanceBasedDropdownSource_CheckboxValue}   Test 2
  Click Element  ${EqualsToInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_EqualsToInstanceBasedSpecify}
#  Element Should Contain   ${EqualsToInstanceBasedSpecify_Value}   Test 3
  Click Element  ${EqualsToInstanceBasedSpecify_Value}
   ${file1} =    Capture Page Screenshot  ${OUTPUTDIR}/Results/SingleSelectEqualsto(Instance)-{index}-.png
                                          set selenium speed  1 seconds
                                       Click Element   ${SaveRecordBtn}


Single Select - Is not equals to (Instance)
############################################# Single Select - Is not equals to (Instance)###############################################################
   Click Element  ${DropdownControl_IsNotEqualsToInstanceBasedTextbox}
   Element Should Not Contain  ${DropdownControl_IsNotEqualsToInstanceBasedTextboxConatiner}   Test 2
   Click Element  ${IsNotEqualsToInstnaceBasedTextBox_Value}
  Click Element  ${DropdownControl_IsNotEqualsToInstanceBaseDropdwonText}
  Element Should Not Contain  ${DropdownControl_IsNotEqualsToInstanceBaseDropdwonTextContainer}    Test 2
  Click Element  ${IsNotEqualsToInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_IsNotEqualsToInstanceBasedDropdownSource}
  Element Should Not Contain    ${DropdownControl_IsNotEqualsToInstanceBasedDropdownSourceContainer}   Test  2
  Click Element  ${IsNotEqualsToInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_IsNotEqualsToInstanceBasedSpecify}
  Element Should Not Contain    ${DropdownControl_IsNotEqualsToInstanceBasedSpecifyConatiner}   Test 3
  Click Element  ${IsNotEqualsToInstanceBasedSpecify_Value}
   ${file1} =    Capture Page Screenshot
      ${OUTPUTDIR}/Results/SingleSelectIsnotequalsto(Instance)-{index}-.png
                                            set selenium speed  1 seconds
                                         Click Element   ${SaveRecordBtn}
Single Select - Starts with (Instance)
#########################Single Select - Starts with (Instance)###########################################################################
  Click Element  ${DropdownControl_StartsWithInstanceBasedTextbox}
  Click Element   ${StartsWithInstanceBasedTextBox_Value}
  Click Element   ${DropdownControl_StartsWithInstanceBaseDropdwonText}
  Click Element   ${StartsWithInstanceBasedDropdownTextCheckboxValue}
  Click Element   ${DropdownControl_StartsWithInstanceBasedDropdownSource}
  Click Element   ${StartsWithInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_StartsWithInstanceBasedSpecify}
  Click Element  ${StartsWithInstanceBasedSpecify_Value}
#   ${file1} =    Capture Page Screenshot
#        ${OUTPUTDIR}/Results/SingleSelectStartswith(Instance)-{index}-.png
#                                              set selenium speed  1 seconds
                                           Click Element   ${SaveRecordBtn}
Single Select - Ends with (Instance)
###########################################Single Select - Ends with (Instance)########################################################
  Click Element  ${DropdownControl_EndsWithInstanceBasedTextbox}
  Click Element  ${EndsWithInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_EndsWithInstanceBaseDropdwonText}
  Click Element  ${EndsWithInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_EndsWithInstanceBasedDropdownSource}
  Click Element  ${EndsWithInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_EndsWithInstanceBasedSpecify}
  Click Element  ${EndsWithInstanceBasedSpecify_Value}
#  ${file1} =    Capture Page Screenshot
#         ${OUTPUTDIR}/Results/SingleSelectEndswith(Instance)-{index}-.png
                                               set selenium speed  1 seconds
                                            Click Element   ${SaveRecordBtn}
Single Select - Contains (Instance)
########################################### Single Select - Contains (Instance)###########################################
  Click Element  ${DropdownControl_ContainsInstanceBasedTextbox}
  Click Element  ${ContainsInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_ContainsInstanceBaseDropdwonText}
  Click Element  ${ContainsInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_ContainsInstanceBasedDropdownSource}
  Click Element  ${ContainsInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_ContainsInstanceBasedSpecify}
  Click Element  ${ContainsInstanceBasedSpecify_Value}
#    ${file1} =    Capture Page Screenshot
#             ${OUTPUTDIR}/Results/SingleSelectContains(Instance)-{index}-.png
#                                                   set selenium speed  1 seconds
                                                Click Element   ${SaveRecordBtn}
Single Select - Does not contain (Instance)
###########################################Single Select - Does not contain (Instance)####################################
  Click Element  ${DropdownControl_DoesNotContainInstanceBasedTextbox}
  Element Should Not Contain  ${DropdownControl_DoesNotContainInstanceBasedTextboxConatiner}   Test 2
  Click Element  ${DoesNotContainInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_DoesNotContainInstanceBaseDropdwonText}
  Element Should Not Contain    ${DropdownControl_DoesNotContainInstanceBaseDropdwonTextContainer}    Test 2
  Click Element  ${DoesNotContainInstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${DropdownControl_DoesNotContainInstanceBasedDropdownSource}
  Element Should Not Contain    ${DropdownControl_DoesNotContainInstanceBasedDropdownSourceContainer}     Test 2
  Click Element  ${DoesNotContainInstanceBasedDropdownSource_CheckboxValueTest1}
  Click Element   ${DropdownControl_DoesNotContainInstanceBasedSpecify}
  Element Should Not Contain     ${DropdownControl_DoesNotContainInstanceBasedSpecifyContainer}      Test 3
  Click Element  ${DoesNotContainInstanceBasedSpecify_Value}
#      ${file1} =    Capture Page Screenshot
#               ${OUTPUTDIR}/Results/SingleSelectDoesnotcontain(Instance)-{index}-.png
#                                                     set selenium speed  1 seconds
                                                  Click Element   ${SaveRecordBtn}
Between (Instance)
#################################################Between (Instance)############################################################################
   Click Element  ${DropdownControl_BetweenInstanceBasedTextbox}
   Element Should Contain    ${DropdownControl_BetweenInstanceBasedTextboxContainer}    1,2,3
   Click Element   ${BetweenInstanceBasedTextBox_Value}
   Click Element  ${DropdownControl_BetweenInstanceBaseDropdwonText}
   Element Should Contain    ${DropdownControl_BetweenInstanceBaseDropdwonTextContainer}    1,2,3
   Click Element   ${BetweenInstanceBasedDropdownTextCheckboxValue}
   Click Element   ${DropdownControl_BetweenInstanceBasedDropdownSource}
   Element Should Contain   ${DropdownControl_BetweenInstanceBasedDropdownSourceContainer}   1,2,3
   Click Element  ${BetweenInstanceBasedDropdownSource_CheckboxValue}
   Click Element  ${DropdownControl_BetweenInstanceBasedSpecify}
   Element Should Contain    ${DropdownControl_BetweenInstanceBasedSpecifyContainer}     1,2,3
   Click Element  ${BetweenInstanceBasedSpecify_Value}
#     ${file1} =    Capture Page Screenshot
#                   ${OUTPUTDIR}/Results/Between(Instance)-{index}-.png
#                                                         set selenium speed  1 seconds
                                                      Click Element   ${SaveRecordBtn}
Less than (Instance)
#################################################### Less than (Instance)##################################################################
  Click Element  ${DropdownControl_LessThanInstanceBasedTextbox}
  Click Element  ${LessThanInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_LessThanInstanceBaseDropdwonText}
  Click Element  ${LessThanInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_LessThanInstanceBasedDropdownSource}
  Click Element  ${LessThanInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_LessThanInstanceBasedSpecify}
  Click Element  ${LessThanInstanceBasedSpecify_Value}
#   ${file1} =    Capture Page Screenshot
#                     ${OUTPUTDIR}/Results/LessThan(Instance)-{index}-.png
#                                                           set selenium speed  1 seconds

                                                        Click Element   ${SaveRecordBtn}
Less than and equals to (Instance)
################################################################ Less than and equals to (Instance)########################################
  Click Element  ${DropdownControl_LessThanAndEqualsToInstanceBasedTextbox}
  Click Element  ${LessThanAndEqualsToInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_LessThanAndEqualsToInstanceBaseDropdwonText}
   Click Element  ${LessThanAndEqualsToInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_LessThanAndEqualsToInstanceBasedDropdownSource}
  Click Element  ${LessThanAndEqualsToInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_LessThanAndEqualsToInstanceBasedSpecify}
  Click Element  ${LessThanAndEqualsToInstanceBasedSpecify_Value}
#     ${file1} =    Capture Page Screenshot
#                       ${OUTPUTDIR}/Results/LessThanAndEqualsTo(Instance)-{index}-.png
#                                                             set selenium speed  1 seconds
                                                          Click Element   ${SaveRecordBtn}
Greater than (Instance)
##############################################################Greater than (Instance)######################################
  Click Element  ${DropdownControl_GreatorThanInstanceBasedTextbox}
  Click Element  ${GreatorThanInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_GreatorThanInstanceBaseDropdwonText}
  Click Element  ${GreatorThanInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_GreatorThanInstanceBasedDropdownSource}
  Click Element  ${GreatorThanInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_GreatorThanInstanceBasedSpecify}
  Click Element  ${GreatorThanInstanceBasedSpecify_Value}
#   ${file1} =    Capture Page Screenshot
#                         ${OUTPUTDIR}/Results/GreatorThan(Instance)-{index}-.png
#                                                               set selenium speed  1 seconds
                                                            Click Element   ${SaveRecordBtn}
Greater than and equals to (Instance)
####################################################################Greater than and equals to (Instance)##################################
  Click Element  ${DropdownControl_GreatorThenAndLessThanInstanceBasedTextbox}
  Click Element  ${GreatorThenAndLessThanInstanceBasedTextBox_Value}
  Click Element  ${DropdownControl_GreatorThenAndLessThanInstanceBaseDropdwonText}
  Click Element  ${GreatorThenAndLessThanInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${DropdownControl_GreatorThenAndLessThanInstanceBasedDropdownSource}
  Click Element  ${GreatorThenAndLessThanInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${DropdownControl_GreatorThenAndLessThanInstanceBasedSpecify}
  Click Element  ${GreatorThenAndLessThanInstanceBasedSpecify_Value}

#     ${file1} =    Capture Page Screenshot
#                             ${OUTPUTDIR}/Results/GreatorThanandEqualsTo(Instance)-{index}-.png
#                                                                   set selenium speed  1 seconds
                                                                Click Element   ${SaveRecordBtn}
                                                                   set selenium speed  1 seconds
Update Match on Values
################################################Update Match on Values#####################################################################
   Click Element  ${MatchOnInstnaceBasedInputField}
  Click Element  ${DropdownControl_MatchOn_MultiSelectEqualsToInstanceBaseDropdwonText}
  Click Element  ${Deselect_MatchOn_MultiSelectEqualsToInstanceBaseDropdwonText}
  Click Element  ${MatchOn_MultiSelectEqualsToInstanceBasedDropdownTextCheckboxValueTest3}
  Click Element   ${MatchOn_MultiSelectEqualsToInstanceBasedDropdownTextCheckboxValueTest4}
  Click Element      ${DropdownControl_MatchOn_MultiSelectEqualsToInstanceBasedDropdownSource}
  Click Element   ${Deselect_MatchOn_MultiSelectEqualsToInstanceBasedDropdownSource_CheckboxValueTest2}
  Click Element  ${MatchOn_MultiSelectEqualsToInstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element   ${MatchOn_MultiSelectEqualsToInstanceBasedDropdownSource_CheckboxValueTest4}

Multi Select - Equals to (Instance)
###################################################################Multi Select - Equals to (Instance)#############################################
  Click Element  ${DropdownControl_MultiSelect_EqualsToInstanceBaseDropdwonText}
  Click Element  ${MultiSelect_EqualsToInstanceBasedDropdownTextCheckboxValueTest3}
  Click Element  ${MultiSelect_EqualsToInstanceBasedDropdownTextCheckboxValueTest4}
  Click Element   ${DropdownControl_MultiSelectEqualsToInstanceBasedDropdownSource}
  Click Element  ${MultiSelect_EqualsToInstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element   ${MultiSelect_EqualsToInstanceBasedDropdownSource_CheckboxValueTest4}
#     ${file1} =    Capture Page Screenshot
#                               ${OUTPUTDIR}/Results/MultiSelectEqualsTo(Instance)-{index}-.png

                                                                  Click Element   ${SaveRecordBtn}
                                                                     set selenium speed  1 seconds

Multi Select - Is not Equals to (Instance)
####################################################################Multi Select - Is not Equals to (Instance)###################################
  Click Element  ${DropdownControl_MultiSelectIsNotEqualsToInstanceBaseDropdwonText}
  Click Element  ${MultiSelect_IsNotEqualsToInstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${MultiSelect_IsNotEqualsToInstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${DropdownControl_MultiSelect_IsNotEqualsToInstanceBasedDropdownSource}
  Click Element  ${MultiSelect_IsNotEqualsToInstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element  ${MultiSelect_IsNotEqualsToInstanceBasedDropdownSource_CheckboxValueTest4}
#     ${file1} =    Capture Page Screenshot
#                                  ${OUTPUTDIR}/Results/MultiSelectIsNotEqualsTo(Instance)-{index}-.png
#                                                                        set selenium speed  1 seconds
                                                                     Click Element   ${SaveRecordBtn}
                                                                        set selenium speed  1 seconds

Multi Select - Starts with (Instance)
###########################################################################Multi Select - Starts with (Instance)#############################
  Click Element  ${DropdownControl_MultiSelect_StartsWith_InstanceBaseDropdwonText}
  Click Element  ${MultiSelect_StartsWith_InstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${MultiSelect_StartsWith_InstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${DropdownControl_MultiSelect_StartsWith_InstanceBasedDropdownSource}
  Click Element  ${MultiSelect_StartsWith_InstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element  ${MultiSelect_StartsWith_InstanceBasedDropdownSource_CheckboxValueTest4}
#  ${file1} =    Capture Page Screenshot
#                                  ${OUTPUTDIR}/Results/MultiSelectStartsWith(Instance)-{index}-.png

                                                                     Click Element   ${SaveRecordBtn}
                                                                        set selenium speed  1 seconds
Multi Select - Ends With (Instance)
############################################################################## Multi Select - Ends With (Instance)##############################
  Click Element  ${DropdownControl_MultiSelect_EndsWith_InstanceBaseDropdwonText}        xpath=/html/body/div[1]/div[3]/div/div[2]/div[2]/div[4]/div[7]/div[9]/div[2]/div[1]/div/div[27]/div[1]/a/span[2]/b[1]
  Click Element  ${MultiSelect_EndsWith_InstanceBasedDropdownTextCheckboxValueTest1}     xpath=/html/body/div[1]/div[3]/div/div[2]/div[22]/ul[1]/ul/li[1]/a/i[1]
  Click Element  ${MultiSelect_EndsWith_InstanceBasedDropdownTextCheckboxValueTest2}    xpath=/html/body/div[1]/div[3]/div/div[2]/div[22]/ul[1]/ul/li[2]/a/i[1]
  Click Element  ${DropdownControl_MultiSelect_EndsWith_InstanceBasedDropdownSource}    xpath=/html/body/div[1]/div[3]/div/div[2]/div[2]/div[4]/div[7]/div[9]/div[2]/div[1]/div/div[28]/div[1]/a/span[2]/b[1]
  Click Element  ${MultiSelect_EndsWith_InstanceBasedDropdownSource_CheckboxValueTest3}  xpath=/html/body/div[1]/div[3]/div/div[2]/div[23]/ul[1]/ul/li[1]/a/i[1]
  Click Element  ${MultiSelect_EndsWith_InstanceBasedDropdownSource_CheckboxValueTest4}  xpath=/html/body/div[1]/div[3]/div/div[2]/div[23]/ul[1]/ul/li[2]/a/i[1]
#   ${file1} =    Capture Page Screenshot
#                                    ${OUTPUTDIR}/Results/MultiSelectEndsWith(Instance)-{index}-.png

                                                                       Click Element   ${SaveRecordBtn}
                                                                          set selenium speed  1 seconds
Multi Select - Contians (Instance)
################################################################Multi Select - Contians (Instance)#########################
  Click Element  ${DropdownControl_MultiSelect_Contains_InstanceBaseDropdwonText}
  Click Element  ${MultiSelect_Contains_InstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${MultiSelect_Contains_InstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${DropdownControl_MultiSelect_Contains_InstanceBasedDropdownSource}
  Click Element  ${MultiSelect_Contains_InstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element  ${MultiSelect_Contains_InstanceBasedDropdownSource_CheckboxValueTest4}
#     ${file1} =    Capture Page Screenshot
#                                       ${OUTPUTDIR}/Results/MultiSelectContains(Instance)-{index}-.png

                                                                          Click Element   ${SaveRecordBtn}
                                                                             set selenium speed  1 seconds
Multi Select - Does not contain (Instance)
#############################################################Multi Select - Does not contain (Instance)###############################
   Click Element  ${DropdownControl_MultiSelect_DoesNotContain_InstanceBaseDropdwonText}
  Click Element  ${MultiSelect_DoesNotContain_InstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${MultiSelect_DoesNotContain_InstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${DropdownControl_MultiSelect_DoesNotContain_InstanceBasedDropdownSource}
  Click Element  ${MultiSelect_DoesNotContain_InstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element  ${MultiSelect_DoesNotContain_InstanceBasedDropdownSource_CheckboxValueTest4}
#       ${file1} =    Capture Page Screenshot
#                                             ${OUTPUTDIR}/Results/MultiSelectDoesNotContains(Instance)-{index}-.png
#                                                                                   set selenium speed  1 seconds
                                                                                Click Element   ${SaveRecordBtn}
                                                                                   set selenium speed  1 seconds
Module Filters Verify Deafault Values on Match on(Instance Based)
#######################################Module Filters Verify Deafault Values on Match on(Instance Based)###################################
   Wait Until Page Contains Element   ${ModuleFilters_MatchonInstanceBasedTextbox}
    Wait Until Page Contains Element  ${ModuleFilters_MatchonInstanceBasedDropdownText}
  Wait Until Page Contains Element  ${ModuleFilters_MatchonInstanceBasedDropdownSource}
   Wait Until Page Contains Element  ${ModuleFilters_MatchOnInstanceBasedSpecify}

Module Filters Single Select - Equals to (Instance)
###############################Module Filters Single Select - Equals to (Instance)#########################################################
  Click Element  ${ModuleFilters_DropdownControl_EqualsToInstanceBasedTextbox}
   Click Element  ${ModuleFilters_EqualsToInstnaceBasedTextBox_Value}
   Click Element  ${ModuleFilters_DropdownControl_EqualsToInstanceBaseDropdwonText}
    Click Element  ${ModuleFilters_EqualsToInstanceBasedDropdownTextCheckboxValue}
   Click Element  ${ModuleFilters_DropdownControl_EqualsToInstanceBasedDropdownSource}
   Click Element  ${ModuleFilters_EqualsToInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_EqualsToInstanceBasedSpecify}
   Click Element  ${ModuleFilters_EqualsToInstanceBasedSpecify_Value}
   Click Element   ${SaveRecordBtn}
  set selenium speed  1 seconds

Module Filter Single Select - Is not equals to (Instance)
############################################# Module Filter Single Select - Is not equals to (Instance)###############################################################
  Click Element  ${ModuleFilters_DropdownControl_IsNotEqualsToInstanceBasedTextbox}
  Click Element  ${ModuleFilters_IsNotEqualsToInstnaceBasedTextBox_Value}
  Click Element  ${ModuleFilters_DropdownControl_IsNotEqualsToInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_IsNotEqualsToInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_IsNotEqualsToInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_IsNotEqualsToInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_IsNotEqualsToInstanceBasedSpecify}
  Click Element  ${ModuleFilters_IsNotEqualsToInstanceBasedSpecify_Value}
   Click Element   ${SaveRecordBtn}
    set selenium speed  1 seconds

Module Filters Single Select - Starts with (Instance)
#########################Module Filters Single Select - Starts with (Instance)###########################################################################
  Click Element  ${ModuleFilters_DropdownControl_StartsWithInstanceBasedTextbox}
  Click Element  ${ModuleFilters_StartsWithInstanceBasedTextBox_Value}
  Click Element  ${ModuleFilters_DropdownControl_StartsWithInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_StartsWithInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_StartsWithInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_StartsWithInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_StartsWithInstanceBasedSpecify}
  Click Element  ${ModuleFilters_StartsWithInstanceBasedSpecify_Value}
   Click Element   ${SaveRecordBtn}
  set selenium speed  1 seconds

Module Filters Single Select - Ends with (Instance)
###########################################Module Filters Single Select - Ends with (Instance)########################################################
  Click Element  ${ModuleFilters_DropdownControl_EndsWithInstanceBasedTextbox}
  Click Element  ${ModuleFilters_EndsWithInstanceBasedTextBox_Value}
  Click Element  ${ModuleFilters_DropdownControl_EndsWithInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_EndsWithInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_EndsWithInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_EndsWithInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_EndsWithInstanceBasedSpecify}
  Click Element  ${ModuleFilters_EndsWithInstanceBasedSpecify_Value}
  Click Element   ${SaveRecordBtn}
    set selenium speed  1 seconds

Module Filters Single Select - Contains (Instance)
########################################### Module Filters Single Select - Contains (Instance)###########################################
  Click Element  ${ModuleFilters_DropdownControl_ContainsInstanceBasedTextbox}
  Click Element  ${ModuleFilters_ContainsInstanceBasedTextBox_Value}
  Click Element  ${ModuleFilters_DropdownControl_ContainsInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_ContainsInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_ContainsInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_ContainsInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_ContainsInstanceBasedSpecify}
  Click Element  ${ModuleFilters_ContainsInstanceBasedSpecify_Value}
   Click Element   ${SaveRecordBtn}
      set selenium speed  1 seconds

Module Filters Single Select - Does not contain (Instance)
###########################################Module Filters Single Select - Does not contain (Instance)####################################
   Click Element  ${ModuleFilters_DropdownControl_DoesNotContainInstanceBasedTextbox}
   Click Element  ${ModuleFilters_DoesNotContainInstanceBasedTextBox_Value}
   Click Element  ${ModuleFilters_DropdownControl_DoesNotContainInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_DoesNotContainInstanceBasedDropdownTextCheckboxValueTest3}
  Click Element   ${ModuleFilters_DropdownControl_DoesNotContainInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_DoesNotContainInstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element  ${ModuleFilters_DropdownControl_DoesNotContainInstanceBasedSpecify}
  Click Element  ${ModuleFilters_DoesNotContainInstanceBasedSpecify_Value}
  Click Element   ${SaveRecordBtn}
        set selenium speed  1 seconds

Module Filters Between (Instance)
#################################################Module Filters Between (Instance)############################################################################
  Click Element  ${ModuleFilters_DropdownControl_BetweenInstanceBasedTextbox}
  Click Element  ${ModuleFilters_BetweenInstanceBasedTextBox_Value}
  Click Element  ${ModuleFilters_DropdownControl_BetweenInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_BetweenInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_BetweenInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_BetweenInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_BetweenInstanceBasedSpecify}
  Click Element  ${ModuleFilters_BetweenInstanceBasedSpecify_Value}
  Click Element   ${SaveRecordBtn}
          set selenium speed  1 seconds

Module Filters Less than (Instance)
#################################################### Module Filters Less than (Instance)##################################################################
   Click Element  ${ModuleFilters_DropdownControl_LessThanInstanceBasedTextbox}
   Click Element  ${ModuleFilters_LessThanInstanceBasedTextBox_Value}
   Click Element  ${ModuleFilters_DropdownControl_LessThanInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_LessThanInstanceBasedDropdownTextCheckboxValue}
   Click Element  ${ModuleFilters_DropdownControl_LessThanInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_LessThanInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_LessThanInstanceBasedSpecify}
  Click Element  ${ModuleFilters_LessThanInstanceBasedSpecify_Value}
  Click Element   ${SaveRecordBtn}
            set selenium speed  1 seconds

Module Filters Less than and equals to (Instance)
################################################################Module Filters  Less than and equals to (Instance)########################################
   Click Element  ${ModuleFilters_DropdownControl_LessThanAndEqualsToInstanceBasedTextbox}
   Click Element  ${ModuleFilters_LessThanAndEqualsToInstanceBasedTextBox_Value}
  Click Element  ${ModuleFilters_DropdownControl_LessThanAndEqualsToInstanceBaseDropdwonText}
  Click Element  ${ModuleFilters_LessThanAndEqualsToInstanceBasedDropdownTextCheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_LessThanAndEqualsToInstanceBasedDropdownSource}
  Click Element  ${ModuleFilters_LessThanAndEqualsToInstanceBasedDropdownSource_CheckboxValue}
  Click Element  ${ModuleFilters_DropdownControl_LessThanAndEqualsToInstanceBasedSpecify}
  Click Element  ${ModuleFilters_LessThanAndEqualsToInstanceBasedSpecify_Value}
  Click Element   ${SaveRecordBtn}
              set selenium speed  1 seconds

Module Filter Greater than (Instance)
##############################################################Module Filter Greater than (Instance)######################################
  Click Element   ${ModuleFilter_DropdownControl_GreatorThanInstanceBasedTextbox}
  Click Element   ${ModuleFilter_GreatorThanInstanceBasedTextBox_Value}
  Click Element   ${ModuleFilter_DropdownControl_GreatorThanInstanceBaseDropdwonText}
  Click Element   ${ModuleFilter_GreatorThanInstanceBasedDropdownTextCheckboxValue}
  Click Element   ${ModuleFilter_DropdownControl_GreatorThanInstanceBasedDropdownSource}
  Click Element   ${ModuleFilter_GreatorThanInstanceBasedDropdownSource_CheckboxValue}
  Click Element   ${ModuleFilter_DropdownControl_GreatorThanInstanceBasedSpecify}
  Click Element   ${ModuleFilter_GreatorThanInstanceBasedSpecify_Value}
  Click Element   ${SaveRecordBtn}
                set selenium speed  1 seconds

Module Filter Greater than and equals to (Instance)
####################################################################Module Filter Greater than and equals to (Instance)##################################
     Click Element  ${ModuleFilter_DropdownControl_GreatorThenAndLessThanInstanceBasedTextbox}
     Click Element  ${ModuleFilter_GreatorThenAndLessThanInstanceBasedTextBox_Value}
    Click Element   ${ModuleFilter_DropdownControl_GreatorThenAndLessThanInstanceBaseDropdwonText}
     Click Element   ${ModuleFilter_GreatorThenAndLessThanInstanceBasedDropdownTextCheckboxValue}
    Click Element  ${ModuleFilter_DropdownControl_GreatorThenAndLessThanInstanceBasedDropdownSource}
    Click Element   ${ModuleFilter_GreatorThenAndLessThanInstanceBasedDropdownSource_CheckboxValue}
    Click Element  ${ModuleFilter_DropdownControl_GreatorThenAndLessThanInstanceBasedSpecify}
     Click Element  ${ModuleFilter_GreatorThenAndLessThanInstanceBasedSpecify_Value}
      Click Element   ${SaveRecordBtn}
                     set selenium speed  1 seconds
##################################Navigate to Module Filter Tab#####################################################################################
Navigate to Module Filter Tab
  Click Element   ${ModuleFilterTab}

Module Filter Update Match on Value
########################################################Module Filter Update Multi select Match on################################
     Click Element   ${ModuleFilter_DropdownControl_MatchOn_MultiSelectEqualsToInstanceBaseDropdwonText}
      Click Element   ${ModuleFilter_MatchOn_MultiSelectEqualsToInstanceBasedDropdownTextCheckboxValueTest1}
      Click Element   ${ModuleFilter_DropdownControl_MatchOn_MultiSelectEqualsToInstanceBasedDropdownSource}
      Click Element   ${ModuleFilter_MatchOn_MultiSelectEqualsToInstanceBasedDropdownSource_CheckboxValueTest1}
Module Filter Multi Select - Equals to (Instance)
###################################################################Module Filter Multi Select - Equals to (Instance)#############################################

   Click Element  ${ModuleFilter_DropdownControl_MultiSelect_EqualsToInstanceBaseDropdwonText}
   Click Element  ${ModuleFilter_MultiSelect_EqualsToInstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_EqualsToInstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${ModuleFilter_DropdownControl_MultiSelectEqualsToInstanceBasedDropdownSource}
  Click Element  ${ModuleFilter_MultiSelect_EqualsToInstanceBasedDropdownSource_CheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_EqualsToInstanceBasedDropdownSource_CheckboxValueTest2}
   Click Element   ${SaveRecordBtn}
                       set selenium speed  1 seconds

Module Filter Multi Select - Is not Equals to (Instance)
####################################################################Module Filter Multi Select - Is not Equals to (Instance)###########################################
  Click Element  ${ModuleFilter_DropdownControl_MultiSelectIsNotEqualsToInstanceBaseDropdwonText}
  Click Element  ${ModuleFilter_MultiSelect_IsNotEqualsToInstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_IsNotEqualsToInstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${ModuleFilter_DropdownControl_MultiSelect_IsNotEqualsToInstanceBasedDropdownSource}
  Click Element  ${ModuleFilter_MultiSelect_IsNotEqualsToInstanceBasedDropdownSource_CheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_IsNotEqualsToInstanceBasedDropdownSource_CheckboxValueTest2}
   Click Element   ${SaveRecordBtn}
                         set selenium speed  1 seconds

Module Filters Multi Select - Starts with (Instance)
###########################################################################Module Filters Multi Select - Starts with (Instance)##########################################################
  Click Element  ${ModuleFilter_DropdownControl_MultiSelect_StartsWith_InstanceBaseDropdwonText}
  Click Element  ${ModuleFilter_MultiSelect_StartsWith_InstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_StartsWith_InstanceBasedDropdownTextCheckboxValueTest2}
  Click Element  ${ModuleFilter_DropdownControl_MultiSelect_StartsWith_InstanceBasedDropdownSource}
  Click Element  ${ModuleFilter_MultiSelect_StartsWith_InstanceBasedDropdownSource_CheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_StartsWith_InstanceBasedDropdownSource_CheckboxValueTest2}
   Click Element   ${SaveRecordBtn}
                           set selenium speed  1 seconds

Module Filter Multi Select - Ends With (Instance)
############################################################################## Multi Select - Ends With (Instance)##############################
    Click Element  ${ModuleFilter_DropdownControl_MultiSelect_EndsWith_InstanceBaseDropdwonText}
    Click Element  ${ModuleFilter_MultiSelect_EndsWith_InstanceBasedDropdownTextCheckboxValueTest1}
    Click Element  ${ModuleFilter_MultiSelect_EndsWith_InstanceBasedDropdownTextCheckboxValueTest2}
   Click Element   ${ModuleFilter_DropdownControl_MultiSelect_EndsWith_InstanceBasedDropdownSource}
  Click Element  ${ModuleFilter_MultiSelect_EndsWith_InstanceBasedDropdownSource_CheckboxValueTest1}
   Click Element  ${ModuleFilter_MultiSelect_EndsWith_InstanceBasedDropdownSource_CheckboxValueTest2}
   Click Element   ${SaveRecordBtn}
                             set selenium speed  1 seconds
Module Filter Multi Select - Contians (Instance)
################################################################Multi Select - Contians (Instance)#########################
   Click Element  ${ModuleFilter_DropdownControl_MultiSelect_Contains_InstanceBaseDropdwonText}
  Click Element  ${ModuleFilter_MultiSelect_Contains_InstanceBasedDropdownTextCheckboxValueTest1}
  Click Element  ${ModuleFilter_MultiSelect_Contains_InstanceBasedDropdownTextCheckboxValueTest2}
  Click Element   ${ModuleFilter_DropdownControl_MultiSelect_Contains_InstanceBasedDropdownSource}
  Click Element  ${ModuleFilter_MultiSelect_Contains_InstanceBasedDropdownSource_CheckboxValueTest1}
  Click Element   ${ModuleFilter_MultiSelect_Contains_InstanceBasedDropdownSource_CheckboxValueTest2}
   Click Element   ${SaveRecordBtn}
                               set selenium speed  1 seconds
Module Filter Multi Select - Does not contain (Instance)
#############################################################Module Filter Multi Select - Does not contain (Instance)###############################
  Click Element  ${ModuleFilter_DropdownControl_MultiSelect_DoesNotContain_InstanceBaseDropdwonText}
  Click Element  ${ModuleFilter_MultiSelect_DoesNotContain_InstanceBasedDropdownTextCheckboxValueTest3}
  Click Element  ${ModuleFilter_MultiSelect_DoesNotContain_InstanceBasedDropdownTextCheckboxValueTest4}
  Click Element  ${ModuleFilter_DropdownControl_MultiSelect_DoesNotContain_InstanceBasedDropdownSource}
  Click Element  ${ModuleFilter_MultiSelect_DoesNotContain_InstanceBasedDropdownSource_CheckboxValueTest3}
  Click Element  ${ModuleFilter_MultiSelect_DoesNotContain_InstanceBasedDropdownSource_CheckboxValueTest4}

##############################################SUB MODULE INSTANCE BASED################################################################
######################################Navigate to Sub Module#############################################################
Navigate To Sub Module Tab
   Click Element      ${SubModuleTab}

Verify Default Values on User Defined
###########################################Verify Default Values on User Defined######################################################################
   Wait Until Page Contains Element  ${UserDefined_Textbox}
    Wait Until Page Contains Element  ${UserDefined_Textarea}
    Wait Until Page Contains Element  ${UserDefined_Numeric}

Verify Default Values on Module
############################################Verify Default Values on Module###############################################################################
   Wait Until Page Contains Element  ${Module_Textbox}
    Wait Until Page Contains Element  ${Module_Textarea}
    Wait Until Page Contains Element  ${Module_Numeric}

Verify Default Values in System
############################################Verify Default Values in System#################################################################################
  Wait Until Page Contains Element  ${System_Level}
  Wait Until Page Contains Element  ${System_View}
  Wait Until Page Contains Element  ${System_User}

Save Record
####################################Save Record####################################
  Click Element   ${SaveRecordBtn}
                               set selenium speed  2 seconds
Add New Sub Filters Module
################################################Add New Sub Filters Module######################################################################
   Wait Until Page Contains Element  ${AddNewSubFiltersModule}
  Click Element  ${AddNewSubFiltersModule}

Sub Module Does Not Contain TextArea User Defined
###############################################Sub Module Does Not Contain TextArea User Defined####################################################################################
       Click Element  ${DoesNotContain_UserDefined_TextArea_DropdownControl}
      Element Should Not Contain  ${DoesNotContain_UserDefined_TextArea_Container}   ${UserDefined_TextArea_DoesNotContain_Test1Value}
      Click Element     ${DoesNotContain_UserDefined_Textarea_Value}

Sub Module Does Not Contain Textarea Module
####################################################Sub Module Does Not Contain Textarea Module############################
  Click Element  ${DoesNotContain_Module_TextArea_DropdwonControl}
  Element Should Not Contain  ${DoesNotContain_Module_TextArea_Container}      Textbox 1
  Click Element     ${DoesNotContain_Module_TextArea_Value}

Sub Module Does Not Contain Textarea System
################################################Sub Module Does Not Contain Textarea System###############################
  Click Element  ${DoesNotContain_System_TextArea_DropdwonControl}
  Element Should Not Contain  ${DoesNotContain_System_TextArea_Container}       Human Resources
  Click Element  ${DoesNotContain_System_TextArea_Value}

Sub Module Equals To User Defined Textbox
############################################Sub Module Equals To User Defined Textbox#############################
  Click Element  ${EqualsTo_UseDefined_Textbox_DropdownControl}
  Element Should Contain   ${EqualsTo_UserDefined_Textbox_Container}   Test 1
  Click Element  ${EqualsTo_UserDefined_Textbox_Value}

Sub Module Equals To Module Textbox
############################################Sub Module Equals To Module Textbox#############################
  Click Element  ${EqualsTo_Module_Textbox_DropdownControl}
  Element Should Contain  ${EqualsTo_Module_Textbox_Container}     Textbox 1
  Click Element  ${EqualsTo_Module_Textbox_Value}

Sub Module Equals To System Textbox
#########################################Sub Module Equals To System Textbox######################################3
  Click Element  ${EqualsTo_System_Textbox_DropdownControl}
  Element Should Contain  ${EqualsTo_System_Textbox_Container}    Metrix
  Click Element  ${EqualsTo_System_Textbox_Value}


#########################################Equals to - TextArea##############################################
Sub Module Equals To User Defined TextArea
############################################Sub Module Equals To User Defined TextArea#############################
  Click Element   ${EqualsTo_UseDefined_TextArea_DropdownControl}
   Element Should Contain   ${EqualsTo_UserDefined_Textarea_Container}   Test 1
  Click Element  ${EqualsTo_UserDefined_TextArea_Value}

Sub Module Equals To Module TextArea
############################################Sub Module Equals To Module TextArea#############################
  Click Element  ${EqualsTo_Module_TextArea_DropdownControl}
  Element Should Contain  ${EqualsTo_Module_TextArea_Container}    Textarea 1
   Click Element  ${EqualsTo_Module_TextArea_Value}

Sub Module Equals To System TextArea
#########################################Sub Module Equals To System TextArea######################################
   Click Element  ${EqualsTo_System_TextArea_DropdownControl}
  Element Should Contain  ${EqualsTo_System_TextArea_Container}    Human Resources
  Click Element  ${EqualsTo_System_TextArea_Value}

#################################Equals to Numeric#########################################################################
Sub Module Equals To Numeric User Defined
################################################Sub Module Equals To Numeric User Defined######################################
  Click Element  ${EqualsTo_UserDefined_Numeric_DropdownControl}
   Element Should Contain  ${EqualsTo_UserDefined_Numeric_Container}   1
   Click Element  ${EqualsTo_UserDefined_Numeric_Value}

Sub Module Equals To Numeric Module
################################################Sub Module Equals To Numeric Module######################################
  Click Element  ${EqualsTo_Module_Numeric_DropdownControl}
   Element Should Contain  ${EqualsTo_Module_Numeric_Container}   1
   Click Element   ${EqualsTo_Module_Numeric_Value}

Sub Module Equals To Numeric System
################################################Sub Module Equals To Numeric System######################################
   Click Element  ${EqualsTo_System_Numeric_DropdownControl}
   Element Should Contain  ${EqualsTo_System_Numeric_Container}     Permissions User
   Click Element  ${EqualsTo_System_Numeric_Value}


   #################################Is Not Equal To Textbox#########################################################################
Is Not Equals To Textbox User Defined
   ################################################Sub Module Is Not Equals To Textbox User Defined######################################
   Click Element   ${IsNotEqualsTo_UserDefined_Textbox_DropdownControl}
    Element Should Not Contain   ${IsNotEqualsTo_UserDefined_Textbox_Container}  Test 1
   Click Element  ${IsNotEqualsTo_UserDefined_Textbox_Value}

Is Not Equals To Textbox Module
   ################################################Sub Module Is Not Equals To Textbox Module######################################
    Click Element  ${IsNotEqualsTo_Module_Textbox_DropdownControl}
    Element Should Not Contain  ${IsNotEqualsTo_Module_Textbox_Container}      Textbox 1
    Click Element  ${IsNotEqualsTo_Module_Textbox_Value}

Is Not Equals To Textbox System
   ################################################Sub Module Is Not Equals To Textbox System######################################
   Click Element  ${IsNotEqualsTo_System_Textbox_DropdownControl}
   Element Should Not Contain  ${IsNotEqualsTo_System_Textbox_Container}     Metrix
   Click Element  ${IsNotEqualsTo_System_Textbox_Value}


#################################Is Not Equal To Textarea#########################################################################
Is Not Equals To Textarea User Defined
################################################Sub Module Is Not Equals To Textarea User Defined######################################
  Click Element  ${IsNotEqualsTo_UserDefined_Textarea_DropdownControl}
  Element Should Not Contain  ${IsNotEqualsTo_UserDefined_Textarea_Container}  Test 1
  Click Element  ${IsNotEqualsTo_UserDefined_Textarea_Value}

Is Not Equals To Textarea Module
################################################Sub Module Is Not Equals To Textarea Module######################################
  Click Element  ${IsNotEqualsTo_Module_Textbox_DropdownControl}
  Element Should Not Contain  ${IsNotEqualsTo_Module_Textarea_Container}    Textarea 1
  Click Element  ${IsNotEqualsTo_Module_Textarea_Value}

Is Not Equals To Textarea Module
################################################Sub Module Is Not Equals To Textarea System######################################
  Click Element  ${IsNotEqualsTo_System_Textarea_DropdownControl}
  Element Should Not Contain  ${IsNotEqualsTo_System_Textarea_Container}         Human Resources
  Click Element  ${IsNotEqualsTo_System_Textarea_Value}



#################################Is Not Equal To Numeric#########################################################################
Is Not Equals To Numeric User Defined
################################################Sub Module Is Not Equals To Numeric User Defined######################################
  Click Element  ${IsNotEqualsTo_UserDefined_Numeric_DropdownControl}
  Element Should Not Contain  ${IsNotEqualsTo_UserDefined_Numeric_Container}   1
  Click Element  ${IsNotEqualsTo_UserDefined_Numeric_Value}

Is Not Equals To Numeric Module
################################################Sub Module Is Not Equals To Numeric Module######################################
  Click Element  ${IsNotEqualsTo_Module_Numeric_DropdownControl}
  Element Should Not Contain  ${IsNotEqualsTo_Module_Numeric_Container}     1
  Click Element  ${IsNotEqualsTo_Module_Numeric_Value}

Is Not Equals To Numeric System
################################################Sub Module Is Not Equals To Numeric System######################################
   Click Element     ${IsNotEqualsTo_System_Numeric_DropdownControl}
  Element Should Not Contain  ${IsNotEqualsTo_System_Numeric_Container}    Permissions User
  Click Element  ${IsNotEqualsTo_System_Numeric_Value}

#################################Contains Textbox#########################################################################
Contains Textbox User Defined
################################################Sub Module Contains Textbox User Defined######################################
  Click Element   ${Contains_UserDefined_Textbox_DropdownControl}
  Element Should Contain  ${Contains_UserDefined_Textbox_Container}    Test 1
  Click Element   ${Contains_UserDefined_Textbox_Value}
Contains Textbox Module
################################################Sub Module Contains Textbox Module######################################
  Click Element   ${Contains_Module_Textbox_DropdownControl}
  Element Should Contain  ${Contains_Module_Textbox_Container}       Textbox 1
  Click Element   ${Contains_Module_Textbox_Value}
Contains Textbox System
################################################Sub Module Contains Textbox System######################################
  Click Element   ${Contains_System_Textbox_DropdownControl}
  Element Should Contain  ${Contains_System_Textbox_Container}   Metrix
  Click Element   ${Contains_System_Textbox_Value}

#################################Contains Textarea#########################################################################
Contains Textarea User Defined
################################################Sub Module Contains Textarea User Defined######################################
  Click Element   ${Contains_UserDefined_Textarea_DropdownControl}
  Element Should Contain     ${Contains_UserDefined_Textarea_Container}    Test 1
  Click Element   ${Contains_UserDefined_Textarea_Value}

Contains Textarea Module
################################################Sub Module Contains Textarea Module######################################
  Click Element   ${Contains_Module_Textarea_DropdownControl}
   Element Should Contain   ${Contains_Module_Textarea_Container}     Textarea 1
  Click Element   ${Contains_Module_Textarea_Value}

Contains Textarea System
################################################Sub Module Contains Textarea System######################################
  Click Element   ${Contains_System_Textarea_DropdownControl}
    Element Should Contain   ${Contains_System_Textarea_Container}   Human Resources
  Click Element   ${Contains_System_Textarea_Value}

#################################Contains Numeric#########################################################################
Contains Numeric User Defined
################################################Sub Module Contains Numeric User Defined######################################
   Click Element   ${Contains_UserDefined_Numeric_DropdownControl}
  Element Should Contain   ${Contains_UserDefined_Numeric_Container}   1
  Click Element   ${Contains_UserDefined_Numeric_Value}

Contains Numeric Module
################################################Sub Module Contains Numeric Module######################################
  Click Element   ${Contains_Module_Numeric_DropdownControl}
  Element Should Contain   ${Contains_Module_Numeric_Container}      1
  Click Element   ${Contains_Module_Numeric_Value}

Contains Numeric System
################################################Sub Module Contains Numeric System######################################
  Click Element  ${Contains_System_Numeric_DropdownControl}
  Element Should Contain   ${Contains_System_Numeric_Container}   Permissions User
  Click Element  ${Contains_System_Numeric_Value}


  #################################Does Not Contain Textbox#########################################################################
Does Not Contain Textbox User Defined
  ################################################Sub Module Does Not Contain Textbox  User Defined######################################
   Click Element   ${DoesNotContain_UserDefined_Textbox_DropdownControl}
    Element Should Not Contain  ${DoesNotContain_UserDefined_Textbox_Container}   Test 1
    Click Element  ${DoesNotContain_UserDefined_Textbox_Value}
Does Not Contain Textbox Module
  ################################################Sub Module Does Not Contain Textbox  Module######################################
   Click Element  ${DoesNotContain_Module_Textbox_DropdownControl}
      Element Should Not Contain  ${DoesNotContain_Module_Textbox_Container}       Textbox 1
    Click Element  ${DoesNotContain_Module_Textbox_Value}
Does Not Contain Textbox System
  ################################################Sub Module Does Not Contain Textbox System######################################
    Click Element  ${DoesNotContain_System_Textbox_DropdownControl}
     Element Should Not Contain  ${DoesNotContain_System_Textbox_Container}   Metrix
    Click Element  ${DoesNotContain_System_Textbox_Value}

  #################################Does Not Contain Numeric#########################################################################
Does Not Contain Numeric User Defined
  ################################################Sub Module Does Not Contain Numeric User Defined######################################
   Click Element  ${Contains_UserDefined_Textbox_DropdownControl}
     Element Should Not Contain   ${Contains_UserDefined_Textbox_Container}    1
    Click Element  ${Contains_UserDefined_Textbox_Value}
Does Not Contain Numeric Module
  ################################################Sub Module Does Not Contain Numeric Module######################################
    Click Element  ${Contains_Module_Textbox_DropdownControl}
    Element Should Not Contain  ${Contains_Module_Textbox_Container}    1
    Click Element  ${Contains_Module_Textbox_Value}
Does Not Contain Numeric System
  ################################################Sub Module Does Not Contain Numeric System######################################
    Click Element  ${Contains_System_Textbox_DropdownControl}
    Element Should Not Contain   ${Contains_System_Textbox_Container}  Permissions User
    Click Element   ${Contains_System_Textbox_Value}

############################Update Default values Multi Select###########################################################
Update User Defined Textbox
#########################################Update User Defined Textbox###############################################################################
  Click Element  ${Update_UserDefinedTextbox_DropdownControl}
  Click Element  ${Update_UserDefinedTextbox_Value_Test2}
    Click Element  ${Update_UserDefinedTextbox_DropdownControl}

Update User Defined Textarea
###############################################Update User Defined Textarea##########################################
  Click Element   ${Update_UserDefined_Textarea_DropdownControl}
  Click Element  ${Update_UserDefined_Textarea_Value_Test2}
  Click Element   ${Update_UserDefined_Textarea_DropdownControl}
Update User Defined Numeric
#############################################Update User Defined Numeric####################################################
  Click Element  ${Update_UserDefined_Numeric_DropdownControl}
  Click Element  ${Update_UserDefined_Numeric_Value_2}
   Click Element  ${Update_UserDefined_Numeric_DropdownControl}
Update Module Textbox
#########################################Update Module Textbox#############################################################
  Click Element  ${Update_Module_Textbox_DropdownControl}
  Click Element  ${Update_Module_Textbox_Value_Test2}
  Click Element  ${Update_Module_Textbox_DropdownControl}
Update Module Textarea
#########################################Update Module Textarea#########################################################
  Click Element  ${Update_Module_Textarea_DropdownControl}
  Click Element  ${Update_Module_Textarea_Value_Test2}
   Click Element  ${Update_Module_Textarea_DropdownControl}
Update Module Numeric
#########################################Update Module Numeric#########################################################
  Click Element  ${Update_Module_Numeric_DropdownControl}
  Click Element  ${Update_Module_Numeric_Value_2}
   Click Element  ${Update_Module_Numeric_DropdownControl}
Update System Level
#########################################Update System Level#########################################################
  Click Element  ${Update_UserDefined_Level_DropdownControl}
  Click Element  ${Update_UserDefined_Level_Value}
  Click Element  ${Update_UserDefined_Level_DropdownControl}
Update System View
#########################################Update System View#########################################################
  Click Element  ${Update_UserDefined_View_DropdownControl}
  Click Element  ${Update_UserDefined_View_Value}
  Click Element  ${Update_UserDefined_View_DropdownControl}
Update System User
#########################################Update System User #########################################################
  Click Element  ${Update_UserDefined_User_DropdownControl}
  Click Element  ${Update_UserDefined_User_Value}
  Click Element  ${Update_UserDefined_User_DropdownControl}

User Defined Textbox Multi Select
##########################################User Defined Textbox Multi Select#################################################
   Click Element  ${EqualsTo_UseDefined_Textbox_DropdownControl}
   Click Element  ${EqualsTo_UseDefined_Textbox_Value1}
  Click Element  ${EqualsTo_UseDefined_Textbox_Value2}

User Defined Textarea Multi Select
##########################################User Defined Textarea Multi Select#################################################
  Click Element  ${EqualsTo_UseDefined_Textarea_DropdownControl}
  Click Element  ${EqualsTo_UseDefined_Textarea_Value1}
  Click Element  ${EqualsTo_UseDefined_Textarea_Value2}

User Defined Numeric Multi Select
##########################################User Defined Numeric Multi Select#################################################
   Click Element  ${EqualsTo_UseDefined_Numeric_DropdownControl}
  Click Element  ${EqualsTo_UseDefined_Numeric_Value1}
  Click Element  ${EqualsTo_UseDefined_Numeric_Value2}
Module Textbox Multi Select
##########################################Module Textbox  Multi Select#################################################
  Click Element  ${EqualsTo_Module_Textbox_DropdownControl}
  Click Element  ${EqualsTo_Module_Textbox_Value1}
  Click Element  ${EqualsTo_Module_Textbox_Value2}
Module Textarea Multi Select
##########################################Module Textarea Multi Select#################################################
  Click Element   ${EqualsTo_Module_Textarea_DropdownControl}
  Click Element  ${EqualsTo_Module_Textarea_Value1}
  Click Element  ${EqualsTo_Module_Textarea_Value2}
Module Numeric Multi Select
##########################################Module Numeric Multi Select#################################################
   Click Element  ${EqualsTo_Module_Numeric_DropdownControl}
  Click Element  ${EqualsTo_Module_Numeric_Value1}
  Click Element  ${EqualsTo_Module_Numeric_Value2}
System Level Multi Select
##########################################System Level Multi Select#################################################
  Click Element  ${EqualsTo_System_Level_DropdownControl}
   Click Element  ${EqualsTo_System_Level_Value1}
  Click Element  ${EqualsTo_System_Level_Value2}
System View Multi Select
##########################################System View Multi Select#################################################
   Click Element  ${EqualsTo_System_View_DropdownControl}
   Click Element  ${EqualsTo_System_View_Value1}
   Click Element  ${EqualsTo_System_View_Value2}
System User Multi Select
##########################################System User Multi Select#################################################
   Click Element  ${EqualsTo_System_User_DropdownControl}
   Click Element  ${EqualsTo_System_User_Value1}
   Click Element  ${EqualsTo_System_User_Value2}


#########################################Is Not Equal To Textbox Multi Select######################
Is Not Equal To User Defined Textbox Multi Select
##########################################Is Not Equal To User Defined Textarea Multi Select#################################################
  Click Element  ${IsNotEqualsTo_UseDefined_Textbox_DropdownControl}
  Element Should Not Contain   ${IsNotEqualTo_UserDefined_Textbox_Container}      Test 1, Test 2
   Click Element  ${IsNotEqualsTo_UseDefined_Textbox_Value1}
    Click Element  ${IsNotEqualsTo_UseDefined_Textbox_Value2}

Is Not Equal To User Defined Textarea Multi Select
##########################################Is Not Equal To User Defined Textarea Multi Select#################################################
   Click Element  ${IsNotEqualsTo_UseDefined_Textarea_DropdownControl}
  Element Should Not Containe   ${IsNotEqualTo_UserDefined_Textarea_Container}      Textbox 1,Textbox 2
  Click Element  ${IsNotEqualsTo_UseDefined_Textarea_Value1}
  Click Element  ${IsNotEqualsTo_UseDefined_Textarea_Value2}

Is Not Equal To User Defined Numeric Multi Select
##########################################Is Not Equal To User Defined Numeric Multi Select#################################################
   Click Element  ${IsNotEqualsTo_UseDefined_Numeric_DropdownControl}
   Element Should Not Contain   ${IsNotEqualTo_UserDefined_Numeric_Container}     1,2
   Click Element  ${IsNotEqualsTo_UseDefined_Numeric_Value1}
   Click Element  ${IsNotEqualsTo_UseDefined_Numeric_Value2}

Is Not Equal To Module Textbox Multi Select
########################################## Is Not Equal To Module Textbox  Multi Select#################################################
  Click Element  ${IsNotEqualsTo_Module_Textbox_DropdownControl}
  Element Should Not Contain  ${IsNotEqualTo_Module_Textbox_Container}   Textbox 1,Textbox 2
  Click Element  ${IsNotEqualsTo_Module_Textbox_Value1}
  Click Element  ${IsNotEqualsTo_Module_Textbox_Value2}

Is Not Equal To Module Textarea Multi Select
##########################################Is Not Equal To  Module Textarea Multi Select#################################################
  Click Element  ${IsNotEqualsTo_Module_Textarea_DropdownControl}
  Element Should Not Contain  ${IsNotEqualTo_Module_Textarea_Container}     Textarea 1,Textarea 2
  Click Element  ${IsNotEqualsTo_Module_Textarea_Value1}
  Click Element  ${IsNotEqualsTo_Module_Textarea_Value2}

Is Not Equal To Module Numeric Multi Select
##########################################Is Not Equal To  Module Numeric Multi Select#################################################
  Click Element  ${IsNotEqualsTo_Module_Numeric_DropdownControl}
  Element Should Not Contain  ${IsNotEqualTo_Module_Numeric_Container}      1,2
  Click Element  ${IsNotEqualsTo_Module_Numeric_Value1}
  Click Element  ${IsNotEqualsTo_Module_Numeric_Value2}

Is Not Equal To System Level Multi Select
##########################################Is Not Equal To  System Level Multi Select#################################################
  Click Element  ${IsNotEqualsTo_System_Level_DropdownControl}
  Element Should Not Contain  ${IsNotEqualTo_System_Level_Container}      Metrix,Canada
  Click Element  ${IsNotEqualsTo_System_Level_Value1}
  Click Element  ${IsNotEqualsTo_System_Level_Value2}

Is Not Equal To System View Multi Select
##########################################Is Not Equal To System View Multi Select#################################################
   Click Element   ${IsNotEqualsTo_System_View_DropdownControl}
   Element Should Not Contain  ${IsNotEqualTo_System_View_Container}     Human Resources,Management
   Click Element   ${IsNotEqualsTo_System_View_Value1}
   Click Element   ${IsNotEqualsTo_System_View_Value2}

Is Not Equal To System User Multi Select
##########################################Is Not Equal To System User Multi Select#################################################
   Click Element  ${IsNotEqualsTo_System_User_DropdownControl}
   Element Should Not Contain  ${IsNotEqualTo_System_User_Container}    Persmissions User,Carla Smith
   Click Element  ${IsNotEqualsTo_System_User_Value1}
  Click Element   ${IsNotEqualsTo_System_User_Value2}

####################################Contains Multi Select#####################################################################
Contains User Defined Textbox Multi Select
##########################################Contains User Defined Textbox Multi Select#################################################
   Click Element   ${Contains_UseDefined_Textbox_DropdownControl}
  Click Element   ${Contains_UseDefined_Textbox_Value1}
  Click Element   ${Contains_UseDefined_Textbox_Value2}

Contains User Defined Textarea Multi Select
##########################################Contains User Defined Textarea Multi Select#################################################
  Click Element   ${Contains_UseDefined_Textarea_DropdownControl}
  Click Element   ${Contains_UseDefined_Textarea_Value1}
  Click Element   ${Contains_UseDefined_Textarea_Value2}
Contains User Defined Numeric Multi Select
##########################################Contains User Defined Numeric Multi Select#################################################
   Click Element   ${Contains_UseDefined_Numeric_DropdownControl}
  Click Element   ${Contains_UseDefined_Numeric_Value1}
  Click Element   ${Contains_UseDefined_Numeric_Value2}

Contains Module Textbox Multi Select
##########################################Contains Module Textbox  Multi Select#################################################
   Click Element   ${Contains_Module_Textbox_DropdownControl}
   Click Element   ${Contains_Module_Textbox_Value1}
    Click Element   ${Contains_Module_Textbox_Value2}

Contains Module Textarea Multi Select
##########################################Contains  Module Textarea Multi Select#################################################
  Click Element   ${Contains_Module_Textarea_DropdownControl}
  Click Element   ${Contains_Module_Textarea_Value1}
  Click Element  ${Contains_Module_Textarea_Value2}

Contains Module Numeric Multi Select
##########################################Contains  Module Numeric Multi Select#################################################
  Click Element   ${Contains_Module_Numeric_DropdownControl}
  Click Element   ${Contains_Module_Numeric_Value1}
  Click Element   ${Contains_Module_Numeric_Value2}

Contains System Level Multi Select
##########################################Contains System Level Multi Select#################################################
  Click Element   ${Contains_System_Level_DropdownControl}
  Click Element   ${Contains_System_Level_Value1}
  Click Element   ${Contains_System_Level_Value2}

Contains System View Multi Select
##########################################Contains System View Multi Select#################################################
   Click Element   ${Contains_System_View_DropdownControl}
  Click Element   ${Contains_System_View_Value1}
  Click Element   ${IsNotEqualsTo_System_View_Value2}

Contains System User Multi Select
##########################################Contains System User Multi Select#################################################
  Click Element    ${Contains_System_User_DropdownControl}
  Click Element   ${Contains_System_User_Value1}
  Click Element   ${Contains_System_User_Value2}

####################################Does Not Contain Multi Select#####################################################################
Does Not Contain User Defined Textbox Multi Select
##########################################Does Not Contain User Defined Textbox Multi Select#################################################
  Click Element   ${DoesNotContain_UseDefined_Textbox_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_UserDefined_Textbox_Container}   Test 1,Test 2
  Click Element   ${DoesNotContain_UseDefined_Textbox_Value1}
  Click Element  ${DoesNotContain_UseDefined_Textbox_Value2}

Does Not Contain User Defined Textarea Multi Select
##########################################Does Not Contain User Defined Textarea Multi Select#################################################
   Click Element   ${DoesNotContain_UseDefined_Textarea_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_UserDefined_Textarea_Container}  Textarae 1,Textarea 2
  Click Element   ${DoesNotContain_UseDefined_Textarea_Value1}
  Click Element   ${DoesNotContain_UseDefined_Textarea_Value2}

Does Not Contain User Defined Numeric Multi Select
##########################################Does Not Contain User Defined Numeric Multi Select#################################################
  Click Element   ${DoesNotContain_UseDefined_Numeric_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_UserDefined_Numeric_Container}  1,2
   Click Element   ${DoesNotContain_UseDefined_Numeric_Value1}
    Click Element   ${DoesNotContain_UseDefined_Numeric_Value2}

Does Not Contain Module Textbox Multi Select
##########################################Does Not Contain Module Textbox  Multi Select#################################################
  Click Element   ${DoesNotContain_Module_Textbox_DropdownControl}
    Element Should Not Contain   ${DoesNotContain_Module_Textbox_Container}    Textbox 1,Textbox 2
  Click Element   ${DoesNotContain_Module_Textbox_Value1}
  Click Element   ${DoesNotContain_Module_Textbox_Value2}

Does Not Contain Module Textarea Multi Select
##########################################Does Not Contain  Module Textarea Multi Select#################################################
  Click Element   ${DoesNotContain_Module_Textarea_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_Module_Textarea_Container}   Textarea 1, Textarea 2
  Click Element   ${DoesNotContain_Module_Textarea_Value1}
  Click Element   ${DoesNotContain_Module_Textarea_Value2}

Does Not Contain Module Numeric Multi Select
##########################################Does Not Contain  Module Numeric Multi Select#################################################
  Click Element   ${DoesNotContain_Module_Numeric_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_Module_Numeric_Container}    1,2
  Click Element   ${DoesNotContain_Module_Numeric_Value1}
  Click Element   ${DoesNotContain_Module_Numeric_Value2}

Does Not Contain System Level Multi Select
##########################################Does Not Contain System Level Multi Select#################################################
  Click Element   ${DoesNotContain_System_Level_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_System_Level_Container}   Metrix, Canada
  Click Element   ${DoesNotContain_System_Level_Value1}
  Click Element   ${DoesNotContain_System_Level_Value2}

Does Not Contain System View Multi Select
##########################################Does Not Contain System View Multi Select#################################################
  Click Element   ${DoesNotContain_System_View_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_System_View_Container}  Human Resources,Management
  Click Element   ${DoesNotContain_System_View_Value1}
  Click Element   ${DoesNotContain_System_View_Value2}

Does Not Contain System User Multi Select
##########################################Does Not Contain  System User Multi Select#################################################
  Click Element   ${DoesNotContain_System_User_DropdownControl}
  Element Should Not Contain  ${DoesNotContain_System_User_Container}  Permissions User, Carla Smith
  Click Element   ${DoesNotContain_System_User_Value1}
  Click Element   ${DoesNotContain_System_User_Value2}

Navigate To All Filters
########################################Navigate To All Filters###########################################################################
   Click Element   ${AllFiltersTab}

Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#######################################Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify##############
  Page Should Contain Element  ${MatchOnTextbox}
  Element Should Contain  ${MatchOnDropdownText}        Test 1
  Element Should Contain  ${MatchOnDropdownSource}      Test 1
  Page Should Contain Element  ${MatchOnSpecify}

Single Select Equals To Textbox
########################################################Single Select Equals To Textbox###############################################################
  Click Element  ${SingleSelectEqualsToTextboxDropdwonControl}
  Click Element  ${SingleSelectEqualsToTextboxValue}

Single Select Equals To Dropdown Text
########################################################Single Select Equals To Dropdown Text####################################
  Click Element  ${SingleSelectEqualsToDropdownTextDropdwonControl}
  Click Element  ${SingleSelectEqualsToDropdownTextValue}
Single Select Equals To Dropdown Source
########################################################Single Select Equals To Dropdown Source####################################
  Click Element  ${SingleSelectEqualsToDropdownSourceDropdwonControl}
  Click Element  ${SingleSelectEqualsToDropdownSourceValue}
Single Select Equals To Specify
########################################################Single Select Equals To Specify############################################
  Click Element  ${SingleSelectEqualsToSpecifyDropdwonControl}
  Click Element  ${SingleSelectEqualsToSpecifyValue}

Single Select Is Not Equals To Textbox
########################################################Single Select Is Not  Equals To Textbox###############################################################
  Click Element  ${SingleSelectIsNotEqualsToTextboxDropdwonControl}
   Element Should Not Contain  ${SingleSelectIsNotEqualsToTextboxContainer}       Test 2
  Click Element  ${SingleSelectIsNotEqualsToTextboxValue}

Single Select Is Not Equals To Dropdown Text
########################################################Single Select Is Not  Equals  To Dropdown Text####################################
  Click Element  ${SingleSelectIsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain  ${SingleSelectIsNotEqualsToDropdownTextContainer}      Test 2
  Click Element  ${SingleSelectIsNotEqualsToDropdownTextValue}

Single Select Is Not Equals To Dropdown Source
########################################################Single Select Is Not  Equals  To Dropdown Source####################################
  Click Element  ${SingleSelectIsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SingleSelectIsNotEqualsToDropdownSourceContainer}       Test 2
  Click Element   ${SingleSelectIsNotEqualsToDropdownSourceValue}

Single Select Is Not Equals To Specify
########################################################Single Select Is Not  Equals  To Specify############################################
  Click Element  ${SingleSelectIsNotEqualsToSpecifyDropdwonControl}
  Element Should Not Contain  ${SingleSelectIsNotEqualsToSpecifyContainer}         Test 1
  Click Element  ${SingleSelectIsNotEqualsToSpecifyValue}

#######################################################################################################################################
Single Select Starts With Textbox
########################################################Single Select Starts With Textbox###############################################################
  Click Element  ${SingleSelectStartsWithTextboxDropdwonControl}
  Click Element  ${SingleSelectEqualsToTextboxValue}

Single Select Starts With Dropdown Text
########################################################Single Select Starts With Textbox####################################
  Click Element  ${SingleSelectStartsWithDropdownTextDropdwonControl}
  Click Element  ${SingleSelectStartsWithDropdownTextValue}

Single Select Starts With Dropdown Source
########################################################Single Select Starts With Textbox####################################
  Click Element  ${SingleSelectStartsWithDropdownSourceDropdwonControl}
  Click Element  ${SingleSelectStartsWithDropdownSourceValue}
Single Select Starts With Specify
########################################################Single Select Starts With Textbox############################################
  Click Element  ${SingleSelectStartsWithSpecifyDropdwonControl}
  Click Element  ${SingleSelectStartsWithSpecifyValue}

#######################################################################################################################################
Single Select Ends With Textbox
########################################################Single Select Ends With Textbox###############################################################
  Click Element  ${SingleSelectEndsWithTextboxDropdwonControl}
  Click Element  ${SingleSelectEndsWithTextboxValue}
Single Select Ends With Dropdown Text
########################################################Single Select Ends With Dropdown Text####################################
  Click Element  ${SingleSelectEndsWithDropdownTextDropdwonControl}
  Click Element  ${SingleSelectEndsWithDropdownTextValue}
Single Select Ends With Dropdown Source
########################################################Single Select Ends With Dropdown Source####################################
  Click Element  ${SingleSelectEndsWithDropdownSourceDropdwonControl}
  Click Element  ${SingleSelectEndsWithDropdownSourceValue}
Single Select Ends With Specify
########################################################Single Select Ends With Specify############################################
   Click Element  ${SingleSelectEndsWithSpecifyDropdwonControl}
  Click Element  ${SingleSelectEndsWithSpecifyValue}

Single Select Between Textbox
########################################################Single Select Between Textbox###############################################################
  Click Element  ${SingleSelectBetweenTextboxDropdwonControl}
  Element Should Contain   ${SingleSelectBetweenTextboxContainer}         1
  Click Element  ${SingleSelectBetweenTextboxValue}
Single Select Between Dropdown Text
########################################################Single Select Between Dropdown Text####################################
  Click Element  ${SingleSelectBetweenDropdownTextDropdwonControl}
   Element Should Contain  ${SingleSelectBetweenDropdownTextContainer}       1
  Click Element  ${SingleSelectBetweenDropdownTextValue}
Single Select Between Dropdown Source
########################################################Single Select Between Dropdown Source####################################
  Click Element  ${SingleSelectBetweenDropdownSourceDropdwonControl}
  Element Should Contain  ${SingleSelectBetweenDropdownSourceContainer}         1
  Click Element  ${SingleSelectBetweenDropdownSourceValue}
Single Select Between Specify
########################################################Single Select Between Specify############################################
  Click Element  ${SingleSelectBetweenSpecifyDropdwonControl}
   Element Should Contain  ${SingleSelectBetweenSpecifyContainer}     2
  Click Element  ${SingleSelectBetweenSpecifyValue}

Single Select Contains Textbox
########################################################Single Select Contains Textbox###############################################################
  Click Element  ${SingleSelectContainsTextboxDropdwonControl}
  Click Element  ${SingleSelectEndsWithTextboxValue}
Single Select Contains Dropdown Text
########################################################Single Select Contains Dropdown Text####################################
  Click Element  ${SingleSelectContainsDropdownTextDropdwonControl}
  Click Element  ${SingleSelectContainsDropdownTextValue}
Single Select Contains Dropdown Source
########################################################Single Select Contains Dropdown Source####################################
  Click Element  ${SingleSelectContainsDropdownSourceDropdwonControl}
  Click Element  ${SingleSelectContainsDropdownSourceValue}
Single Select Contains Specify
########################################################Single Select Contains Specify############################################
  Click Element  ${SingleSelectContainsSpecifyDropdwonControl}
  Click Element  ${SingleSelectContainsSpecifyValue}

Single Select Less than Textbox
########################################################Single Select Less than Textbox###############################################################
  Click Element  ${SingleSelectLessThanTextboxDropdwonControl}
  Element Should Contain  ${SingleSelectLessThanTextboxContainer}       1,2,3
  Click Element  ${SingleSelectLessThanTextboxValue}

Single Select Less than Dropdown Text
########################################################Single Select Less than Dropdown Text####################################
  Click Element  ${SingleSelectLessThanDropdownTextDropdwonControl}
   Element Should Contain  ${SingleSelectLessThanDropdownTextContainer}     1,2,3
  Click Element  ${SingleSelectLessThanDropdownTextValue}

Single Select Less than Dropdown Source
########################################################Single Select Less than Dropdown Source####################################
  Click Element  ${SingleSelectLessThanDropdownSourceDropdwonControl}
   Element Should Contain   ${SingleSelectLessThanDropdownSourceContainer}      1,2,3
  Click Element  ${SingleSelectLessThanDropdownSourceValue}

Single Select Less than Specify
########################################################Single Select Less than Specify############################################
  Click Element  ${SingleSelectLessThanSpecifyDropdwonControl}
   Element Should Contain   ${SingleSelectLessThanSpecifyContainer}     1,2,3
  Click Element  ${SingleSelectLessThanSpecifyValue}

Single Select Between Textbox
########################################################Single Select Between Textbox###############################################################
   Click Element  ${SingleSelectBetweenTextboxDropdwonControl}
   Element Should Contain  ${SingleSelectBetweenTextboxContainer}     Test 2,Test 3,Test 4
   Click Element  ${SingleSelectBetweenTextboxValue}

Single Select Between Dropdown Text
########################################################Single Select Between Dropdown Text####################################
  Click Element  ${SingleSelectBetweenDropdownTextDropdwonControl}
  Element Should Contain  ${SingleSelectBetweenDropdownTextContainer}        Test 2,Test 3,Test 4
  Click Element  ${SingleSelectBetweenDropdownTextValue}

Single Select Between Dropdown Source
########################################################Single Select Between Dropdown Source####################################
   Click Element  ${SingleSelectBetweenDropdownSourceDropdwonControl}
  Element Should Contain  ${SingleSelectBetweenDropdownSourceContainer}   Test 2,Test 3,Test 4
  Click Element  ${SingleSelectBetweenDropdownSourceValue}

Single Select Between Specify
########################################################Single Select Between Specify############################################
  Click Element  ${SingleSelectBetweenSpecifyDropdwonControl}
  Element Should Contain  ${SingleSelectBetweenSpecifyContainer}         Test 1,Test 3,Test 4
  Click Element  ${SingleSelectBetweenSpecifyValue}


################################################Single Select Greator Than######################################################################################
Single Select Greator Than Textbox
############################################Single Select Greator Than Textbox###################################################
   Click Element  ${SingleSelectGreatorThanTextboxDropdwonControl}
   Element Should Contain  ${SingleSelectGreatorThanTextboxContainer}      5
   Click Element  ${SingleSelectGreatorThanTextboxValue}

Single Select Greator Than Dropdown Text
########################################################Single Select Greator Than Dropdown Text####################################
    Click Element  ${SingleSelectGreatorThanDropdownTextDropdwonControl}
    Element Should Contain  ${SingleSelectGreatorThanDropdownTextContainer}      5
   Click Element  ${SingleSelectGreatorThanDropdownTextValue}

Single Select Greator Than Dropdown Source
########################################################Single Select Greator Than Dropdown Source####################################
   Click Element  ${SingleSelectGreatorThanDropdownSourceDropdwonControl}
  Element Should Contain  ${SingleSelectGreatorThanDropdownSourceContainer}       5
    Click Element  ${SingleSelectGreatorThanDropdownSourceValue}

Single Select Greator Than Specify
########################################################Single Select Greator Than Specify############################################
   Click Element  ${SingleSelectGreatorThanSpecifyDropdwonControl}
   Element Should Contain  ${SingleSelectGreatorThanSpecifyContainer}          5
   Click Element  ${SingleSelectGreatorThanSpecifyValue}


################################################Single Select Greator Than and Equals To######################################################################################
Single Select Greator Than and Equals To Textbox
############################################Single Select Greator Than and Equals To Textbox###################################################
  Click Element  ${SingleSelectGreatorThanAndEqualsToTextboxDropdwonControl}
   Element Should Contain  ${SingleSelectGreatorThanAndEqualsToTextboxContainer}        4,5
   Click Element  ${SingleSelectGreatorThanTextboxValue}

Single Select Greator Than and Equals To Dropdown Text
########################################################Single Select Greator Than and Equals To Dropdown Text####################################
   Click Element  ${SingleSelectGreatorThanAndEqualsToDropdownTextDropdwonControl}
   Element Should Contain  ${SingleSelectGreatorThanAndEqualsToDropdownTextContainer}        4,5
  Click Element  ${SingleSelectGreatorThanAndEqualsToDropdownTextValue}

Single Select Greator Than and Equals To Dropdown Source
########################################################Single Select Greator Than and Equals To Dropdown Source####################################
   Click Element  ${SingleSelectGreatorThanAndEqualsToDropdownSourceDropdwonControl}
  Element Should Contain  ${SingleSelectGreatorThanAndEqualsToDropdownSourceContainer}        4,5
  Click Element  ${SingleSelectGreatorThanAndEqualsToDropdownSourceValue}

Single Select Greator Than and Equals To Specify
########################################################Single Select Greator Than and Equals To Specify############################################
  Click Element  ${SingleSelectGreatorThanAndEqualsToSpecifyDropdwonControl}
   Element Should Contain   ${SingleSelectGreatorThanAndEqualsToSpecifyContainer}              4,5
  Click Element  ${SingleSelectGreatorThanAndEqualsToSpecifyValue}


################################################Single Select Less Than and Equals To######################################################################################
Single Select Less Than and Equals To Textbox
############################################Single Select Less Than and Equals To Textbox###################################################
  Click Element  ${SingleSelectLessThanAndEqualsToTextboxDropdwonControl}
   Element Should Contain   ${SingleSelectLessThanAndEqualsToTextboxContainer}        1,2,3,4
  Click Element  ${SingleSelectLessThanTextboxValue}

Single Select Less Than and Equals To Dropdown Text
########################################################Single Select Less Than and Equals To Dropdown Text####################################
  Click Element  ${SingleSelectLessThanAndEqualsToDropdownTextDropdwonControl}
  Element Should Contain   ${SingleSelectLessThanAndEqualsToDropdownTextContainer}            1,2,3,4
  Click Element  ${SingleSelectLessThanAndEqualsToDropdownTextValue}

Single Select Less Than and Equals To Dropdown Source
########################################################Single Select Less Than and Equals To Dropdown Source####################################
  Click Element  ${SingleSelectLessThanAndEqualsToDropdownSourceDropdwonControl}
   Element Should Contain  ${SingleSelectLessThanAndEqualsToDropdownSourceContainer}            1,2,3,4
  Click Element  ${SingleSelectLessThanAndEqualsToDropdownSourceValue}

Single Select Less Than and Equals To Specify
########################################################Single Select Less Than and Equals To Specify############################################
  Click Element   ${SingleSelectLessThanAndEqualsToSpecifyDropdwonControl}
   Element Should Contain  ${SingleSelectLessThanAndEqualsToSpecifyContainer}                   1,2,3,4
   Click Element   ${SingleSelectLessThanAndEqualsToSpecifyValue}

Update User Defined Multi Select-Update match on fields
################################################Update User Defined Multi Select-Update match on fields ######################################################################
  Click Element  ${UserDefined_MultiSelect_Matchon_Dropdown_Text_DropdownControl}
  Click Element  ${UserDefined_MultiSelect_Matchon_Dropdown_Text_Value}
  Click Element  ${UserDefined_MultiSelect_Matchon_DropdownSource_DropdownControl}
  Click Element  ${UserDefined_MultiSelect_MatchOn-DropdownSource_Value}
##################################################3User Defined Multi Select#########################################################################
User Defined Multi Select -Equals To Dropdown Text
########################################################User Defined Multi Select -Equals  To Dropdown Text####################################
  Click Element   ${UserDefined_MultiSelect_EqualsToDropdownTextDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_EqualsToDropdownText_Value1}
  Click Element  ${UserDefined_MultiSelect_EqualsToDropdownTextValue2}

User Defined Multi Select -Equals To Dropdown Source
########################################################User Defined Multi Select -Equals  To Dropdown Source####################################
  Click Element  ${UserDefined_MultiSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_EqualsToDropdownSourceValue1}
  Click Element  ${UserDefined_MultiSelect_EqualsToDropdownSourceValue2}

######################################################################################################################################
User Defined Multi-Select Is Not Equals To Dropdown Text
#####################################################User Defined Multi Select-Is Not  Equals  To Dropdown Text####################################
   Click Element  ${UserDefined_MultiSelect_IsNotEqualsToDropdownTextDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_IsNotEqualsToDropdownTextValue1}
  Click Element  ${UserDefined_MultiSelect_IsNotEqualsToDropdownTextValue}
User Defined Multi Select-Is Not Equals To Dropdown Source
########################################################User Defined Multi Select-Is Not  Equals  To Dropdown Source####################################
  Click Element  ${UserDefined_MultiSelect_IsNotEqualsToDropdownSourceDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_IsNotEqualsToDropdownSourceValue1}
  Click Element  ${UserDefined_MultiSelect_IsNotEqualsToDropdownSourceValue2}
############################################################################################################################################

User Defined Multi Select Starts With Dropdown Text
########################################################User Defined Multi Select Starts With Dropdown Text####################################
  Click Element   ${UserDefined_MultiSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_StartsWithDropdownTextValue1}
  Click Element  ${UserDefined_MultiSelect_StartsWithDropdownTextValue2}
User Defined Multi Select Starts With Dropdown Source
########################################################User Defined Multi Select Starts With Dropdown Source####################################
  Click Element  ${UserDefined_MultiSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_StartsWithDropdownSourceValue1}
  Click Element   ${UserDefined_MultiSelect_StartsWithDropdownSourceValue2}
####################################################################################################################################
User Defined Multi Select Ends With Dropdown Text
#######################################################User Defined Multi Select Ends With Dropdown Text####################################
  Click Element  ${UserDefined_MultiSelect_EndsWithDropdownTextDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_EndsWithDropdownTextValue1}
  Click Element  ${UserDefined_MultiSelect_EndsWithDropdownTextValue2}
User Defined Multi Select Ends With Dropdown Source
########################################################User Defined Multi Ends With Dropdown Source####################################
   Click Element  ${UserDefined_MultiSelect_EndsWithDropdownSourceDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_EndsWithDropdownSourceValue1}
  Click Element  ${UserDefined_MultiSelect_EndsWithDropdownSourceValue2}
########################################################################################################################################
User Defined Multi Select Contains Dropdown Text
########################################################User Defined Multi Select Contains Dropdown Text####################################
  Click Element  ${UserDefined_MultiSelect_ContainsDropdownTextDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_ContainsDropdownTextValue1}
  Click Element  ${UserDefined_MultiSelect_ContainsDropdownTextValue1}
User Defined Multi Select Contains Dropdown Source
########################################################User Defined Multi Select Contains Dropdown Source####################################
  Click Element  ${UserDefined_MultiSelect_ContainsDropdownSourceDropdwonControl}
  Click Element  ${UserDefined_MultiSelect_ContainsDropdownSourceValue1}
  Click Element  ${UserDefined_MultiSelect_ContainsDropdownSourceValue2}

################################################# User Defined multi Select Does Not Contain######################################################################################
User Defined Multi Select Does Not Contain Dropdown Text
######################################################## User Defined Multi  Select Does Not Contain  Dropdown Text####################################
   Click Element  ${UserDefined_MultiSelect_DoesNotContainDropdownTextDropdwonControl}
  Element Should Not Contain  ${UserDefined_MultiSelect_DoesNotContainDropdownTextContainer}
   Click Element  ${UserDefined_MultiSelect_DoesNotContainDropdownTextValue1}
   Click Element  ${UserDefined_MultiSelect_DoesNotContainDropdownTextValue2}
User Defined Multi Select Does Not Contain Dropdown Source
########################################################User Defined Multi  Select Does Not Contain Dropdown Source#########################################################################################
   Click Element  ${UserDefined_MultiSelect_DoesNotContainDropdownSourceDropdwonControl}
  Element Should Not Contain  ${UserDefined_MultiSelect_DoesNotContainDropdownSourceContainer}
    Click Element  ${UserDefined_MultiSelect_DoesNotContainDropdownSourceValue1}
   Click Element  ${UserDefined_MultiSelect_DoesNotContainDropdownSourceValue2}

Navigate to All Filters Module Sources Tab
###################################SOURCE FILTER_MODULE_SOURCES#######################################################################
  Click Element  ${Module_SourcesTab}

Verify Module Match on Default Values
###############################Verify Module Match on Default Values ###############################################################################
  Page Should Contain Element   ${Module_MatchOnTextbox}
  Page Should Contain Element  ${Module_MatchOnDropdownText}
  Page Should Contain Element  ${Module_MatchOnDropdownSource}
  Page Should Contain Element  ${Module_MatchOnSpecify}

Update Module Match on Dropdown Text and dropdown Source Default Values
###############################Update Module Match on Dropdown Text and dropdown Source Default Values ###############################################################################
   Click Element  ${Module_MatchOn_DropdownText_DropdownControl}
   Click Element  ${Module_MatchOn_DropdownText_Value}
   Click Element  ${Module_MatchOn_DropdownSource_DropdownControl}
   Click Element  ${Module_MatchOn_DropdownSource_Value}


Module Single Select Equals To Textbox
########################################################Module Single Select Equals To Textbox###############################################################
  Click Element  ${Module_SingleSelect_EqualsToTextboxDropdwonControl}
  Click Element  ${Module_SingleSelect_EqualsToTextboxValue}

Module Single Select Equals To Dropdown Text
########################################################Module Single Select Equals To Dropdown Text####################################
  Click Element  ${Module_SingleSelect_EqualsToDropdownTextDropdwonControl}
  Click Element  ${Module_SingleSelect_EqualsToDropdownTextValue}

Module Single Select Equals To Dropdown Source
########################################################Module Single Select Equals To Dropdown Source####################################
  Click Element  ${Module_SingleSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element  ${Module_SingleSelect_EqualsToDropdownSourceValue}

Module Single Select Equals To Specify
######################################################## Module Single Select Equals To Specify############################################
  Click Element   ${Module_SingleSelect_EqualsToSpecifyDropdwonControl}
  Click Element  ${Module_SingleSelect_EqualsToSpecifyValue}

Module Single Select Is Not Equals To Textbox
########################################################Module Single Select Is Not  Equals To Textbox###############################################################
  Click Element  ${Module_SingleSelectIsNotEqualsToTextboxDropdwonControl}
  Element Should Not Contain  ${Module_SingleSelectIsNotEqualsToTextboxContainer}    Textbox 1
  Click Element  ${Module_SingleSelectIsNotEqualsToTextboxValue}

Module Single Select Is Not Equals To Dropdown Text
########################################################Module Single Select Is Not  Equals  To Dropdown Text####################################
  Click Element  ${Module_SingleSelectIsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain  ${Module_SingleSelectIsNotEqualsToDropdownTextContainer}       Textbox 1
  Click Element  ${Module_SingleSelectIsNotEqualsToDropdownTextValue}

Module Single Select Is Not Equals To Dropdown Source
########################################################Module Single Select Is Not  Equals  To Dropdown Source####################################
  Click Element  ${Module_SingleSelectIsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${Module_SingleSelectIsNotEqualsToDropdownSourceContainer}         Textbox 1
  Click Element  ${SingleSelectIsNotEqualsToDropdownSourceValue}

Module Single Select Is Not Equals To Specify
########################################################Module Single Select Is Not  Equals  To Specify############################################
  Click Element  ${Module_SingleSelectIsNotEqualsToSpecifyDropdwonControl}
   Element Should Not Contain  ${Module_SingleSelectIsNotEqualsToSpecifyContainer}               Textbox 2
  Click Element  ${Module_SingleSelectIsNotEqualsToSpecifyValue}

####################################################Module Single  Select Starts With#######################################
Module Single Select Starts With Textbox
########################################################Module Single Select Starts With Textbox###############################################################
  Click Element   ${Module_SingleSelect_StartsWithTextboxDropdwonControl}
  Click Element  ${Module_SingleSelect_EqualsToTextboxValue}

Module Single Select Starts With Dropdown Text
########################################################Module Single  Select Starts With Dropdown Text####################################
  Click Element  ${Module_SingleSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${Module_SingleSelect_StartsWithDropdownTextValue}

Module Single Select Starts With Dropdown Source
########################################################Module Single  Select Starts With Dropdown Source####################################
  Click Element  ${Module_SingleSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${Module_SingleSelect_StartsWithDropdownSourceValue}

Module Single Select Starts With Specify
########################################################Module Single  Select Starts With Specify############################################
  Click Element  ${Module_SingleSelect_StartsWithSpecifyDropdwonControl}
  Click Element  ${ModuleS_SingleSelect_StartsWithSpecifyValue}

Module Single Select Ends With Textbox
 ########################################################Module Single Select Ends With Textbox###############################################################
   Click Element  ${Module_SingleSelectEndsWithTextboxDropdwonControl}
   Click Element  ${Module_SingleSelectEndsWithTextboxValue}

Module Single Select Ends With Dropdown Text
 ########################################################Module Single Select Ends With Dropdown Text####################################
   Click Element  ${Module_SingleSelectEndsWithDropdownTextDropdwonControl}
   Click Element  ${Module_SingleSelectEndsWithDropdownTextValue}
Module Single Select Ends With Dropdown Source
 ########################################################Module Single Select Ends With Dropdown Source####################################
  Click Element  ${Module_SingleSelectEndsWithDropdownSourceDropdwonControl}
  Click Element  ${Module_SingleSelectEndsWithDropdownSourceValue}
Module Single Select Ends With Specify
 ########################################################Module Single Select Ends With Specify############################################
  Click Element   ${Module_SingleSelectEndsWithSpecifyDropdwonControl}
   Click Element   ${Module_SingleSelectEndsWithSpecifyValue}

Module Single Select Contains Textbox
########################################################Module Single  Select Contains Textbox###############################################################
  Click Element  ${Module_SingleSelectContainsTextboxDropdwonControl}
  Click Element  ${Module_SingleSelectEndsWithTextboxValue}

Module Single Select Contains Dropdown Text
######################################################## Module Single Select Contains Dropdown Text####################################
  Click Element  ${Module_SingleSelectContainsDropdownTextDropdwonControl}
  Click Element  ${Module_SingleSelectContainsDropdownTextValue}

Module Single Select Contains Dropdown Source
########################################################Module Single Select Contains Dropdown Source####################################
  Click Element  ${Module_SingleSelectContainsDropdownSourceDropdwonControl}
  Click Element  ${Module_SingleSelectContainsDropdownSourceValue}

Module Single Select Contains Specify
########################################################Module Single Select Contains Specify############################################
  Click Element  ${Module_SingleSelectContainsSpecifyDropdwonControl}
  Click Element  ${Module_SingleSelectContainsSpecifyValue}

Module Single Select Does Not Contain Textbox
############################################ Module Single Select Does Not Contain Textbox###################################################
   Click Element   ${Module_SingleSelectDoesNotContainTextboxDropdwonControl}
  Element Should Not Contain  ${Module_SingleSelectDoesNotContainTextboxContainer}    Textarea 1
  Click Element   ${Module_SingleSelectDoesNotContainTextboxValue}

Module Single Select Does Not Contain Dropdown Text
########################################################Module Single Select Does Not Contain  Dropdown Text####################################
  Click Element   ${Module_SingleSelectDoesNotContainDropdownTextDropdwonControl}
   Element Should Not Contain   ${Module_SingleSelectDoesNotContainDropdownTextContainer}     Textarea 1
  Click Element   ${Module_SingleSelectDoesNotContainDropdownTextValue}
Module Single Select Does Not Contain Dropdown Source
########################################################Module Single Select Does Not Contain Dropdown Source####################################
   Click Element   ${Module_SingleSelectDoesNotContainDropdownSourceDropdwonControl}
  Element Should Not Contain   ${Module_SingleSelectDoesNotContainDropdownSourceContainer}      Textarea 1
  Click Element   ${Module_SingleSelectDoesNotContainDropdownSourceValue}
Module Single Select Does Not Contain Specify
########################################################Module Single Select Does Not Contain Specify############################################
  Click Element   ${Module_SingleSelectDoesNotContainSpecifyDropdwonControl}
  Element Should Not Contain  ${Module_SingleSelectDoesNotContainSpecifyContainer}          Textarea 1
  Click Element   ${Module_SingleSelectDoesNotContainSpecifyValue}

########################################################################################################################################
Module Single Select Between Textbox
########################################################Module Single Select Between Textbox###############################################################
  Click Element   ${Module_SingleSelectBetweenTextboxDropdwonControl}
  Element Should Contain   ${Module_SingleSelectBetweenTextboxContainer}       2,3,4
  Click Element  ${Module_SingleSelectBetweenTextboxValue}

Module Single Select Between Dropdown Text
########################################################Module Single Select Between Dropdown Text####################################
  Click Element  ${Module_SingleSelectBetweenDropdownTextDropdwonControl}
  Element Should Contain  ${Module_SingleSelectBetweenDropdownTextContainer}         2,3,4
  Click Element   ${Module_SingleSelectBetweenDropdownTextValue}

Module Single Select Between Dropdown Source
########################################################Module Single Select Between Dropdown Source####################################
  Click Element    ${Module_SingleSelectBetweenDropdownSourceDropdwonControl}
  Element Should Contain  ${Module_SingleSelectBetweenDropdownSourceContainer}        1,2,3,4
  Click Element  ${Module_SingleSelectBetweenDropdownSourceValue}

Module Single Select Between Specify
########################################################Module Single Select Between Specify############################################
  Click Element  ${Module_SingleSelectBetweenSpecifyDropdwonControl}
  Element Should Contain  ${Module_SingleSelectBetweenSpecifyContainer}          2,3,4
  Click Element  ${Module_SingleSelectBetweenSpecifyValue}

Module Single Select Less than Textbox
  ########################################################Module Single Select Less than Textbox###############################################################
   Click Element  ${Module_SingleSelectLessThanTextboxDropdwonControl}
   Element Should Contain  ${Module_SingleSelectLessThanTextboxContainer}      1,2,3
  Click Element  ${Module_SingleSelectLessThanTextboxValue}
Module Single Select Less than Dropdown Text
  ########################################################Module Single Select Less than Dropdown Text####################################
  Click Element  ${Module_SingleSelectLessThanDropdownTextDropdwonControl}
  Element Should Contain  ${Module_SingleSelectLessThanDropdownTextContainer}        1,2,3
  Click Element  ${Module_SingleSelectLessThanDropdownTextValue}
Module Single Select Less than Dropdown Source
  ########################################################Module Single Select Less than Dropdown Source####################################
  Click Element  ${Module_SingleSelectLessThanDropdownSourceDropdwonControl}
  Element Should Contain  ${Module_SingleSelectLessThanDropdownSourceContainer}        1,2,3
  Click Element  ${Module_SingleSelectLessThanDropdownSourceValue}
Module Single Select Less than Specify
  ########################################################Module Single Select Less than Specify############################################
  Click Element   ${Module_SingleSelectLessThanSpecifyDropdwonControl}
  Element Should Contain  ${Module_SingleSelectLessThanSpecifyContainer}          1,2,3
  Click Element  ${Module_SingleSelectLessThanSpecifyValue}

Module Single Select Greator Than Textbox
############################################Module Single Select Greator Than Textbox###################################################
  Click Element  ${Module_SingleSelectGreatorThanTextboxDropdwonControl}
  Element Should Contain  ${Module_SingleSelectGreatorThanTextboxContainer}    4
  Click Element  ${Module_SingleSelectGreatorThanTextboxValue}
Module Single Select Greator Than Dropdown Text
########################################################Module Single Select Greator Than Dropdown Text####################################
   Click Element  ${Module_SingleSelectGreatorThanDropdownTextDropdwonControl}
  Element Should Contain   ${Module_SingleSelectGreatorThanDropdownTextContainer}      4
  Click Element  ${Module_SingleSelectGreatorThanDropdownTextValue}
Module Single Select Greator Than Dropdown Source
########################################################Module Single Select Greator Than Dropdown Source####################################
  Click Element   ${Module_SingleSelectGreatorThanDropdownSourceDropdwonControl}
  Element Should Contain   ${Module_SingleSelectGreatorThanDropdownSourceContainer}     4
  Click Element  ${Module_SingleSelectGreatorThanDropdownSourceValue}
Module Single Select Greator Than Specify
########################################################Module Single Select Greator Than Specify############################################
  Click Element  ${Module_SingleSelectGreatorThanSpecifyDropdwonControl}
  Element Should Contain  ${Module_SingleSelectGreatorThanSpecifyContainer}         4
  Click Element  ${Module_SingleSelectGreatorThanSpecifyValue}

################################################Module Single Select Greator Than and Equals To######################################################################################
Module Single Select Greator Than and Equals To Textbox
############################################ Module Single Select Greator Than and Equals To Textbox###################################################
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToTextboxDropdwonControl}
  Element Should Contain  ${Module_SingleSelectGreatorThanAndEqualsToTextboxContainer}       3,4,5
  Click Element  ${Module_SingleSelectGreatorThanTextboxValue}
Module Single Select Greator Than and Equals To Dropdown Text
########################################################Module Single Select Greator Than and Equals To Dropdown Text####################################
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToDropdownTextDropdwonControl}
   Element Should Contain  ${Module_SingleSelectGreatorThanAndEqualsToDropdownTextContainer}      3,4,5
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToDropdownTextValue}
Module Single Select Greator Than and Equals To Dropdown Source
########################################################Module Single Select Greator Than and Equals To Dropdown Source####################################
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToDropdownSourceDropdwonControl}
  Element Should Contain  ${Module_SingleSelectGreatorThanAndEqualsToDropdownSourceContainer}       3,4,5
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToDropdownSourceValue}
Module Single Select Greator Than and Equals To Specify
########################################################Module Single Select Greator Than and Equals To Specify############################################
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToSpecifyDropdwonControl}
  Element Should Contain  ${Module_SingleSelectGreatorThanAndEqualsToSpecifyContainer}           3,4,5
  Click Element  ${Module_SingleSelectGreatorThanAndEqualsToSpecifyValue}


Module Multi Select -Equals To Dropdown Text
########################################################Module Multi Select -Equals  To Dropdown Text####################################
  Click Element  ${Module_MultiSelect_EqualsToDropdownTextDropdwonControl}   xpath=/html/body/div[1]/div[3]/div/div[2]/div[2]/div[4]/div[7]/div[9]/div[2]/div[2]/div/div[10]/div[1]/a/span[2]/b[1]
  Click Element  ${Module_MultiSelect_EqualsToDropdownText_Value1}         xpath=/html/body/div[1]/div[3]/div/div[2]/div[66]/ul[1]/ul/li[1]/a/i[1]
  Click Element  ${Module_MultiSelect_EqualsToDropdownTextValue2}             xpath=/html/body/div[1]/div[3]/div/div[2]/div[66]/ul[1]/ul/li[2]/a/i[1]

Module Multi Select -Equals To Dropdown Source
########################################################Module Multi Select -Equals  To Dropdown Source####################################
  Click Element  ${Module_MultiSelect_EqualsToDropdownSourceDropdwonControl}     xpath=/html/body/div[1]/div[3]/div/div[2]/div[2]/div[4]/div[7]/div[9]/div[2]/div[2]/div/div[11]/div[1]/a/span[2]/b[1]
  Click Element  ${Module_MultiSelect_EqualsToDropdownSourceValue1}           xpath=/html/body/div[1]/div[3]/div/div[2]/div[67]/ul[1]/ul/li[1]/a/i[1]
  Click Element  ${Module_MultiSelect_EqualsToDropdownSourceValue2}                xpath=/html/body/div[1]/div[3]/div/div[2]/div[67]/ul[1]/ul/li[2]/a/i[1]
#################################################################################################################################################
Module Multi Select-Is Not Equals To Dropdown Text
########################################################Module Multi Select-Is Not  Equals  To Dropdown Text####################################
  Click Element  ${Module_MultiSelect_IsNotEqualsToDropdownTextDropdwonControl}   xpath=/html/body/div[1]/div[3]/div/div[2]/div[2]/div[4]/div[7]/div[9]/div[2]/div[2]/div/div[15]/div[1]/a/span[2]/b[1]
  Click Element  ${Module_MultiSelect_IsNotEqualsToDropdownTextValue1}         xpath=/html/body/div[1]/div[3]/div/div[2]/div[70]/ul[1]/ul/li[1]/a/i[1]
  Click Element  ${Module_MultiSelect_IsNotEqualsToDropdownTextValue}             xpath=/html/body/div[1]/div[3]/div/div[2]/div[70]/ul[1]/ul/li[2]/a/i[1]
Module Multi Select-Is Not Equals To Dropdown Source
########################################################Module Multi Select-Is Not  Equals  To Dropdown Source####################################
  Click Element  ${Module_MultiSelect_IsNotEqualsToDropdownSourceDropdwonControl}     xpath=/html/body/div[1]/div[3]/div/div[2]/div[2]/div[4]/div[7]/div[9]/div[2]/div[2]/div/div[16]/div[1]/a/span[2]/b[1]
  Click Element  ${Module_MultiSelect_IsNotEqualsToDropdownSourceValue1}           xpath=/html/body/div[1]/div[3]/div/div[2]/div[71]/ul[1]/ul/li[1]/a/i[1]
  Click Element  ${Module_MultiSelect_IsNotEqualsToDropdownSourceValue2}                xpath=/html/body/div[1]/div[3]/div/div[2]/div[71]/ul[1]/ul/li[2]/a/i[1]
#######################################################################################################################################
Module Multi Select Starts With Dropdown Text
########################################################Module Multi Select Starts With Dropdown Text####################################
  Click Element  ${Module_MultiSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${Module_MultiSelect_StartsWithDropdownTextValue1}
  Click Element  ${Module_MultiSelect_StartsWithDropdownTextValue2}
Module Multi Select Starts With Dropdown Source
########################################################Module Multi Select Starts With Dropdown Source####################################
  Click Element  ${Module_MultiSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${Module_MultiSelect_StartsWithDropdownSourceValue1}
  Click Element  ${Module_MultiSelect_StartsWithDropdownSourceValue2}
####################################################################################################################################
Module Multi Select Ends With Dropdown Text
#######################################################Module Multi Select Ends With Dropdown Text####################################
  Click Element  ${Module_MultiSelect_EndsWithDropdownTextDropdwonControl}
  Click Element  ${Module_MultiSelect_EndsWithDropdownTextValue1}
  Click Element  ${Module_MultiSelect_EndsWithDropdownTextValue2}
Module Multi Select Starts With Dropdown Source
########################################################Module Multi Select Starts  With Dropdown Source####################################
  Click Element  ${Module_MultiSelect_EndsWithDropdownSourceDropdwonControl}
  Click Element  ${Module_MultiSelect_EndsWithDropdownSourceValue1}
  Click Element  ${Module_MultiSelect_EndsWithDropdownSourceValue2}

########################################################################################################################################
Module Multi Select Contains Dropdown Text
########################################################Module Multi Select Contains Dropdown Text####################################
  Click Element  ${Module_MultiSelect_ContainsDropdownTextDropdwonControl}
   Click Element  ${Module_MultiSelect_ContainsDropdownTextValue1}
  Click Element  ${Module_MultiSelect_ContainsDropdownTextValue1}
Module Multi Select Contains Dropdown Source
########################################################Module Multi Select Contains Dropdown Source####################################
  Click Element  ${Module_MultiSelect_ContainsDropdownSourceDropdwonControl}
   Click Element  ${Module_MultiSelect_ContainsDropdownSourceValue1}
  Click Element  ${Module_MultiSelect_ContainsDropdownSourceValue2}

###############################################################################################################################################
################################################# Module multi Select Does Not Contain######################################################################################
Module Multi Select Does Not Contain Dropdown Text
########################################################Module Multi  Select Does Not Contain  Dropdown Text####################################
  Click Element  ${Module_MultiSelect_DoesNotContainDropdownTextDropdwonControl}
  Element Should Not Contain  ${Module_MultiSelect_DoesNotContainDropdownTextContainer}
  Click Element  ${Module_MultiSelect_DoesNotContainDropdownTextValue1}
  Click Element  ${Module_MultiSelect_DoesNotContainDropdownTextValue2}

Module Multi Select Does Not Contain Dropdown Source
########################################################Module  Multi  Select Does Not Contain Dropdown Source####################################
  Click Element  ${Module_MultiSelect_DoesNotContainDropdownSourceDropdwonControl}
  Element Should Not Contain  ${Module_MultiSelect_DoesNotContainDropdownSourceContainer}
  Click Element  ${Module_MultiSelect_DoesNotContainDropdownSourceValue1}
  Click Element  ${Module_MultiSelect_DoesNotContainDropdownSourceValue2}


Navigate to All Filters System
###################################SOURCE FILTER_System_SOURCES#######################################################################
  Click Element  ${System_SourcesTab}

Verify System Match on Default Values
###############################Verify System Match on Default Values ###############################################################################
  Page Should Contain Element  ${System_MatchOnTextbox}
  Page Should Contain Element  ${System_MatchOnDropdownText}
  Page Should Contain Element  ${System_MatchOnDropdownSource}
  Page Should Contain Element  ${System_MatchOnSpecify}

Update System Levels Match on values
#######################################Update System Level  Match on Default Values#######################################################
  Click Element  ${SystemLevel_MatchOnDropdownTextDropdownControl}
  Click Element  ${SystemLevel_MatchOnDropdownTextValue}
  Click Element  ${SystemLevel_MatchOnDropdownSourceDropdownControl}
  Click Element  ${SystemLevel_MatchOnDropdownSourceValue}
Update System Views Match on Values
#######################################Update System Views  Match on Default Values#######################################################
   Click Element   ${SystemViews_MatchOnDropdownTextDropdownControl}
   Click Element  ${SystemViews_MatchOnDropdownTextValue}
  Click Element   ${SystemViews_MatchOnDropdownSourceDropdownControl}
   Click Element  ${SystemViews_MatchOnDropdownSourceValue}

System Single Select Equals To Textbox
  ########################################################System Single Select Equals To Textbox###############################################################
  Click Element  ${System_SingleSelect_EqualsToTextboxDropdwonControl}
  Click Element   ${System_SingleSelect_EqualsToTextboxValue}
System Single Select Equals To Dropdown Text
  ########################################################System Single Select Equals To Dropdown Text####################################
   Click Element   ${System_SingleSelect_EqualsToDropdownTextDropdwonControl}
   Click Element   ${System_SingleSelect_EqualsToDropdownTextValue}
System Single Select Equals To Dropdown Source
  ########################################################System Single Select Equals To Dropdown Source####################################
  Click Element   ${System_SingleSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element   ${Module_SingleSelect_EqualsToDropdownSourceValue}
System Single Select Equals To Specify
  ########################################################System Single Select Equals To Specify############################################
  Click Element   ${System_SingleSelect_EqualsToSpecifyDropdwonControl}
  Click Element   ${System_SingleSelect_EqualsToSpecifyValue}

System Single Select Is Not Equals To Textbox
########################################################System Single Select Is Not  Equals To Textbox###############################################################
  Click Element  ${System_SingleSelectIsNotEqualsToTextboxDropdwonControl}
  Element Should Not Contain  ${System_SingleSelectIsNotEqualsToTextboxContainer}       Metrix
  Click Element  ${System_SingleSelectIsNotEqualsToTextboxValue}

System Single Select Is Not Equals To Dropdown Text
########################################################System Single Select Is Not  Equals  To Dropdown Text####################################
  Click Element  ${System_SingleSelectIsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain  ${System_SingleSelectIsNotEqualsToDropdownTextContainer}       Metrix
  Click Element  ${System_SingleSelectIsNotEqualsToDropdownTextValue}

System Single Select Is Not Equals To Dropdown Source
########################################################System Single Select Is Not  Equals  To Dropdown Source####################################
  Click Element  ${System_SingleSelectIsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${System_SingleSelectIsNotEqualsToDropdownSourceContainer}         Metrix
  Click Element  ${System_SingleSelectIsNotEqualsToDropdownSourceValue}

Module Single Select Is Not Equals To Specify
########################################################Module Single Select Is Not  Equals  To Specify############################################
  Click Element  ${System_SingleSelectIsNotEqualsToSpecifyDropdwonControl}
  Element Should Not Contain  ${System_SingleSelectIsNotEqualsToSpecifyContainer}               Metrix
  Click Element  ${System_SingleSelectIsNotEqualsToSpecifyValue}

#######################################################################################################################################
System Single Select Starts With Textbox
########################################################System Single Select Starts With Textbox###############################################################
  Click Element  ${System_SingleSelect_StartsWithTextboxDropdwonControl}
  Click Element  ${System_SingleSelect_EqualsToTextboxValue}
System Single Select Starts With Dropdown Text
########################################################System Single  Select Starts With Dropdown Text####################################
  Click Element  ${System_SingleSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${System_SingleSelect_StartsWithDropdownTextValue}
System Single Select Starts With Dropdown Source
########################################################System Single  Select Starts With Dropdown Source####################################
  Click Element  ${System_SingleSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${System_SingleSelect_StartsWithDropdownSourceValue}
System Single Select Starts With Specify
########################################################System Single  Select Starts With Specify############################################
  Click Element  ${System_SingleSelect_StartsWithSpecifyDropdwonControl}
  Click Element  ${System_SingleSelect_StartsWithSpecifyValue}


########################################################################################################################################
System Single Select Ends With Textbox
########################################################System Single Select Ends With Textbox###############################################################
   Click Element  ${System_SingleSelectEndsWithTextboxDropdwonControl}
  Click Element  ${System_SingleSelectEndsWithTextboxValue}
System Single Select Ends With Dropdown Text
########################################################System Single Select Ends With Dropdown Text####################################
   Click Element  ${System_SingleSelectEndsWithDropdownTextDropdwonControl}
   Click Element  ${System_SingleSelectEndsWithDropdownTextValue}
System Single Select Ends With Dropdown Source
########################################################System Single Select Ends With Dropdown Source####################################
  Click Element  ${System_SingleSelectEndsWithDropdownSourceDropdwonControl}
  Click Element  ${System_SingleSelectEndsWithDropdownSourceValue}
System Single Select Ends With Specify
########################################################System Single Select Ends With Specify############################################
  Click Element  ${System_SingleSelectEndsWithSpecifyDropdwonControl}
  Click Element  ${System_SingleSelectEndsWithSpecifyValue}


System Single Select Contains Textbox
#################################################System Single  Select Contains Textbox###############################################################
  Click Element  ${System_SingleSelectContainsTextboxDropdwonControl}
  Click Element  ${System_SingleSelectEndsWithTextboxValue}
System Single Select Contains Dropdown Text
########################################################System Single Select Contains Dropdown Text####################################
  Click Element  ${System_SingleSelectContainsDropdownTextDropdwonControl}
  Click Element  ${System_SingleSelectContainsDropdownTextValue}
System Single Select Contains Dropdown Source
########################################################System Single Select Contains Dropdown Source####################################
  Click Element  ${System_SingleSelectContainsDropdownSourceDropdwonControl}
  Click Element  ${System_SingleSelectContainsDropdownSourceValue}
System Single Select Contains Specify
########################################################System Single Select Contains Specify############################################
  Click Element  ${System_SingleSelectContainsSpecifyDropdwonControl}
  Click Element  ${System_SingleSelectContainsSpecifyValue}

  ################################################System Single Select Does Not Contain######################################################################################
System Single Select Does Not Contain Textbox
  ############################################System Single Select Does Not Contain Textbox###################################################
  Click Element  ${System_SingleSelectDoesNotContainTextboxDropdwonControl}
    Element Should Not Contain  ${System_SingleSelectDoesNotContainTextboxContainer}           Metrix
    Click Element  ${System_SingleSelectDoesNotContainTextboxValue}
System Single Select Does Not Contain Dropdown Text
  ########################################################System Single Select Does Not Contain  Dropdown Text####################################
    Click Element  ${System_SingleSelectDoesNotContainDropdownTextDropdwonControl}
     Element Should Not Contain   ${System_SingleSelectDoesNotContainDropdownTextContainer}             Metrix
  Click Element  ${System_SingleSelectDoesNotContainDropdownTextValue}
System Single Select Does Not Contain Dropdown Source
  ########################################################System Single Select Does Not Contain Dropdown Source####################################
  Click Element  ${System_SingleSelectDoesNotContainDropdownSourceDropdwonControl}
   Element Should Not Contain   ${System_SingleSelectDoesNotContainDropdownSourceContainer}         Metrix
  Click Element  ${System_SingleSelectDoesNotContainDropdownSourceValue}
System Single Select Does Not Contain Specify
  ########################################################System Single Select Does Not Contain Specify############################################
  Click Element  ${System_SingleSelectDoesNotContainSpecifyDropdwonControl}
   Element Should Not Contain   ${System_SingleSelectDoesNotContainSpecifyContainer}              Metrix
  Click Element   ${System_SingleSelectDoesNotContainSpecifyValue}


##################################################################################################################################################
System Multi Select -Equals To Dropdown Text
########################################################System Multi Select -Equals  To Dropdown Text####################################
  Click Element   ${System_MultiSelect_EqualsToDropdownTextDropdwonControl}
  Click Element   ${System_MultiSelect_EqualsToDropdownText_Value1}
  Click Element  ${System_MultiSelect_EqualsToDropdownTextValue2}
System Multi Select -Equals To Dropdown Source
########################################################System Multi Select -Equals  To Dropdown Source####################################
  Click Element  ${System_MultiSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element  ${System_MultiSelect_EqualsToDropdownSourceValue1}
  Click Element  ${System_MultiSelect_EqualsToDropdownSourceValue2}
#################################################################################################################################################
System Multi Select-Is Not Equals To Dropdown Text
########################################################System Multi Select-Is Not  Equals  To Dropdown Text####################################
  Click Element  ${System_MultiSelect_IsNotEqualsToDropdownTextDropdwonControl}
  Element Should Contain  ${System_MultiSelect_IsNotEqualsToDropdownTextContainer}          Canada, Metrix
  Click Element  ${System_MultiSelect_IsNotEqualsToDropdownTextValue1}
  Click Element  ${System_MultiSelect_IsNotEqualsToDropdownTextValue}
System Multi Select-Is Not Equals To Dropdown Source
########################################################System Multi Select-Is Not  Equals  To Dropdown Source####################################
  Click Element  ${System_MultiSelect_IsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Contain  ${System_MultiSelect_IsNotEqualsToDropdownSourceConatiners}               Canada, Metrix
  Click Element  ${System_MultiSelect_IsNotEqualsToDropdownSourceValue1}
  Click Element  ${System_MultiSelect_IsNotEqualsToDropdownSourceValue2}

System Multi Select Starts With Dropdown Text
########################################################System Multi Select Starts With Dropdown Text####################################
  Click Element  ${System_MultiSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${System_MultiSelect_StartsWithDropdownTextValue1}
  Click Element  ${System_MultiSelect_StartsWithDropdownTextValue2}
System Multi Select Starts With Dropdown Source
########################################################System Multi Select Starts With Dropdown Source####################################
  Click Element  ${System_MultiSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${System_MultiSelect_StartsWithDropdownSourceValue1}
  Click Element  ${System_MultiSelect_StartsWithDropdownSourceValue2}
####################################################################################################################################
System Multi Select Ends With Dropdown Text
#######################################################System Multi Select Ends With Dropdown Text####################################
  Click Element  ${System_MultiSelect_EndsWithDropdownTextDropdwonControl}
  Click Element  ${System_MultiSelect_EndsWithDropdownTextValue1}
  Click Element  ${System_MultiSelect_EndsWithDropdownTextValue2}
System Multi Select Ends With Dropdown Source
########################################################System Multi Select Starts  With Dropdown Source####################################
  Click Element  ${System_MultiSelect_EndsWithDropdownSourceDropdwonControl}
  Click Element  ${System_MultiSelect_EndsWithDropdownSourceValue1}
  Click Element  ${System_MultiSelect_EndsWithDropdownSourceValue2}

System Multi Select Contains Dropdown Text
########################################################System Multi Select Contains Dropdown Text####################################
  Click Element  ${System_MultiSelect_ContainsDropdownTextDropdwonControl}
  Click Element  ${System_MultiSelect_ContainsDropdownTextValue1}
  Click Element  ${System_MultiSelect_ContainsDropdownTextValue1}
System Multi Select Contains Dropdown Source
########################################################System Multi Select Contains Dropdown Source####################################
  Click Element  ${System_MultiSelect_ContainsDropdownSourceDropdwonControl}
  Click Element  ${System_MultiSelect_ContainsDropdownSourceValue1}
  Click Element  ${System_MultiSelect_ContainsDropdownSourceValue2}

###############################################################################################################################################
################################################# System multi Select Does Not Contain######################################################################################
System Multi Select Does Not Contain Dropdown Text
########################################################System Multi  Select Does Not Contain  Dropdown Text####################################
  Click Element  ${System_MultiSelect_DoesNotContainDropdownTextDropdwonControl}
  Element Should Not Contains  ${System_MultiSelect_DoesNotContainDropdownTextContainer}       Metrix,Canada
  Click Element  ${System_MultiSelect_DoesNotContainDropdownTextValue1}
  Click Element  ${System_MultiSelect_DoesNotContainDropdownTextValue2}

System Multi Select Does Not Contain Dropdown Source
########################################################System  Multi  Select Does Not Contain Dropdown Source####################################
  Click Element  ${System_MultiSelect_DoesNotContainDropdownSourceDropdwonControl}
   Element Should Not Contains  ${System_MultiSelect_DoesNotContainDropdownSourceContainer}     Metrix,Canada
  Click Element  ${System_MultiSelect_DoesNotContainDropdownSourceValue1}
  Click Element  ${System_MultiSelect_DoesNotContainDropdownSourceValue2}

System Views Single Select Equals To Textbox
########################################################System Views Single Select Equals To Textbox###############################################################
  Click Element  ${SystemViews_SingleSelect_EqualsToTextboxDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_EqualsToTextboxValue}

System Views Single Select Equals To Dropdown Text
########################################################System Views Single Select Equals To Dropdown Text####################################
  Click Element  ${SystemViews_SingleSelect_EqualsToDropdownTextDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_EqualsToDropdownTextValue}
System Views Single Select Equals To Dropdown Source
########################################################System Views Single Select Equals To Dropdown Source####################################
  Click Element  ${SystemViews_SingleSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_EqualsToDropdownSourceValue}
System ViewsSingle Select Equals To Specify
########################################################System ViewsSingle Select Equals To Specify############################################
  Click Element  ${SystemViews_SingleSelect_EqualsToSpecifyDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_EqualsToSpecifyValue}

System Views Single Select Is Not Equals To Textbox
########################################################System Views Single Select Is Not  Equals To Textbox###############################################################
  Click Element  ${SystemViews_SingleSelectIsNotEqualsToTextboxDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectIsNotEqualsToTextboxContainer}        Quality
  Click Element  ${SystemViews_SingleSelectIsNotEqualsToTextboxValue}

System ViewsSingle Select Is Not Equals To Dropdown Text
########################################################System ViewsSingle Select Is Not  Equals  To Dropdown Text####################################
  Click Element  ${SystemViews_SingleSelectIsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectIsNotEqualsToDropdownTextContainer}     Quality
  Click Element   ${SystemViews_SingleSelectIsNotEqualsToDropdownTextValue}

System Views Single Select Is Not Equals To Dropdown Source
########################################################System Views Single Select Is Not  Equals  To Dropdown Source####################################
  Click Element  ${SystemViews_SingleSelectIsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectIsNotEqualsToDropdownSourceContainer}       Quality
  Click Element  ${SystemViews_SingleSelectIsNotEqualsToDropdownSourceValue}

System Views Single Select Is Not Equals To Specify
########################################################System  Views Single Select Is Not  Equals  To Specify############################################
  Click Element   ${SystemViews_SingleSelectIsNotEqualsToSpecifyDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectIsNotEqualsToSpecifyContainer}       Quality
   Click Element  ${SystemViews_SingleSelectIsNotEqualsToSpecifyValue}


System Views Single Select Starts With Textbox
########################################################System Single Select Starts With Textbox###############################################################
   Click Element  ${SystemViews_SingleSelect_StartsWithTextboxDropdwonControl}
   Click Element  ${SystemViews_SingleSelect_EqualsToTextboxValue}
System Views Single Select Starts With Dropdown Text
########################################################System Single  Select Starts With Dropdown Text####################################
  Click Element  ${SystemViews_SingleSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_StartsWithDropdownTextValue}
System Views Single Select Starts With Dropdown Source
########################################################System Single  Select Starts With Dropdown Source####################################
  Click Element  ${SystemViews_SingleSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_StartsWithDropdownSourceValue}
System Views Single Select Starts With Specify
########################################################System Single  Select Starts With Specify############################################
  Click Element  ${SystemViews_SingleSelect_StartsWithSpecifyDropdwonControl}
  Click Element  ${SystemViews_SingleSelect_StartsWithSpecifyValue}


########################################################################################################################################
System Views Single Select Ends With Textbox
########################################################System Single Select Ends With Textbox###############################################################
  Click Element  ${SystemViews_SingleSelectEndsWithTextboxDropdwonControl}
  Click Element  ${SystemViews_SingleSelectEndsWithTextboxValue1}
  Click Element  ${SystemViews_SingleSelectEndsWithTextboxValue2}

System Views Single Select Ends With Dropdown Text
########################################################System Single Select Ends With Dropdown Text####################################
  Click Element  ${SystemViews_SingleSelectEndsWithDropdownTextDropdwonControl}
  Click Element  ${SystemViews_SingleSelectEndsWithDropdownTextValue}
System Views Single Select Ends With Dropdown Source
########################################################System Single Select Ends With Dropdown Source####################################
  Click Element   ${SystemViews_SingleSelectEndsWithDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_SingleSelectEndsWithDropdownSourceValue}
System Views Single Select Ends With Specify
########################################################System Single Select Ends With Specify############################################
  Click Element  ${SystemViews_SingleSelectEndsWithSpecifyDropdwonControl}
  Click Element  ${SystemViews_SingleSelectEndsWithSpecifyValue1}
  Click Element  ${SystemViews_SingleSelectEndsWithSpecifyValue2}


#######################################################################################################################################
System Views Single Select Contains Textbox
########################################################System Views Single  Select Contains Textbox###############################################################
  Click Element  ${SystemViews_SingleSelectContainsTextboxDropdwonControl}
  Click Element  ${SystemViews_SingleSelectEndsWithTextboxValue}

System Views Single Select Contains Dropdown Text
########################################################System Views Single Select Contains Dropdown Text####################################
  Click Element  ${SystemViews_SingleSelectContainsDropdownTextDropdwonControl}
  Click Element  ${SystemViews_SingleSelectContainsDropdownTextValue}
System Views Single Select Contains Dropdown Source
########################################################System Views Single Select Contains Dropdown Source####################################
  Click Element  ${SystemViews_SingleSelectContainsDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_SingleSelectContainsDropdownSourceValue}

System Views Single Select Contains Specify
########################################################System Views Single Select Contains Specify############################################
  Click Element  ${SystemViews_SingleSelectContainsSpecifyDropdwonControl}
  Click Element  ${SystemViews_SingleSelectContainsSpecifyValue}

################################################System Views Single Select Does Not Contain######################################################################################
System Views Single Select Does Not Contain Textbox
############################################System Views Single Select Does Not Contain Textbox###################################################
  Click Element  ${SystemViews_SingleSelectDoesNotContainTextboxDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectDoesNotContainTextboxContainer}           Quality
   Click Element  ${SystemViews_SingleSelectDoesNotContainTextboxValue}
System Views Single Select Does Not Contain Dropdown Text
########################################################System Views Single Select Does Not Contain  Dropdown Text####################################
   Click Element  ${SystemViews_SingleSelectDoesNotContainDropdownTextDropdwonControl}
   Element Should Not Contain  ${SystemViews_SingleSelectDoesNotContainDropdownTextContainer}             Quality
   Click Element  ${SystemViews_SingleSelectDoesNotContainDropdownTextValue}
System Views Single Select Does Not Contain Dropdown Source
########################################################System Views Single Select Does Not Contain Dropdown Source####################################
  Click Element  ${SystemViews_SingleSelectDoesNotContainDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectDoesNotContainDropdownSourceContainer}        Quality
  Click Element  ${SystemViews_SingleSelectDoesNotContainDropdownSourceValue}
System Views Single Select Does Not Contain Specify
########################################################System Views Single Select Does Not Contain Specify############################################
  Click Element  ${SystemViews_SingleSelectDoesNotContainSpecifyDropdwonControl}
  Element Should Not Contain  ${SystemViews_SingleSelectDoesNotContainSpecifyContainer}            Quality
  Click Element  ${SystemViews_SingleSelectDoesNotContainSpecifyValue}

System Views Multi Select -Equals To Dropdown Text
########################################################System Views Multi Select -Equals  To Dropdown Text####################################
  Click Element  ${SystemViews_MultiSelect_EqualsToDropdownTextDropdwonControl}
  Click Element  ${SystemViews_MultiSelect_EqualsToDropdownText_Value1}
   Click Element  ${SystemViews_MultiSelect_EqualsToDropdownTextValue2}
System Views Multi Select -Equals To Dropdown Source
########################################################System Views  Multi Select -Equals  To Dropdown Source####################################
  Click Element  ${SystemViews_MultiSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_MultiSelect_EqualsToDropdownSourceValue1}
  Click Element  ${SystemViews_MultiSelect_EqualsToDropdownSourceValue2}
#################################################################################################################################################
System Views Multi Select-Is Not Equals To Dropdown Text
########################################################System Views  Multi Select-Is Not  Equals  To Dropdown Text####################################
  Click Element  ${SystemViews_MultiSelect_IsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain   ${SystemViews_MultiSelect_IsNotEqualsToDropdownTextContainer}    Quality,Safety
  Click Element  ${SystemViews_MultiSelect_IsNotEqualsToDropdownTextValue1}
  Click Element  ${SystemViews_MultiSelect_IsNotEqualsToDropdownTextValue}

System Views Multi Select-Is Not Equals To Dropdown Source
########################################################System Views  Multi Select-Is Not  Equals  To Dropdown Source####################################
  Click Element  ${SystemViews_MultiSelect_IsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemViews_MultiSelect_IsNotEqualsToDropdownSourceConatiners}    Quality,Safety
  Click Element  ${SystemViews_MultiSelect_IsNotEqualsToDropdownSourceValue1}
  Click Element  ${SystemViews_MultiSelect_IsNotEqualsToDropdownSourceValue2}


########################################################################################################################################
System Views Multi Select Starts With Dropdown Text
########################################################System Views Multi Select Starts With Dropdown Text####################################
   Click Element  ${SystemViews_MultiSelect_StartsWithDropdownTextDropdwonControl}
    Click Element  ${SystemViews_MultiSelect_StartsWithDropdownTextValue1}
   Click Element   ${SystemViews_MultiSelect_StartsWithDropdownTextValue2}
System Views Multi Select Starts With Dropdown Source
########################################################System Views Multi Select Starts With Dropdown Source####################################
  Click Element  ${SystemViews_MultiSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_MultiSelect_StartsWithDropdownSourceValue1}
   Click Element  ${SystemViews_MultiSelect_StartsWithDropdownSourceValue2}
####################################################################################################################################
System Views Multi Select Ends With Dropdown Text
#######################################################System Views Multi Select Ends With Dropdown Text####################################
   Click Element  ${SystemViews_MultiSelect_EndsWithDropdownTextDropdwonControl}
   Click Element  ${SystemViews_MultiSelect_EndsWithDropdownTextValue1}
   Click Element  ${SystemViews_MultiSelect_EndsWithDropdownTextValue2}
System Views Multi Select Ends With Dropdown Source
########################################################System Views Multi Select Ends  With Dropdown Source####################################
   Click Element  ${SystemViews_MultiSelect_EndsWithDropdownSourceDropdwonControl}
   Click Element  ${SystemViews_MultiSelect_EndsWithDropdownSourceValue1}
   Click Element  ${SystemViews_MultiSelect_EndsWithDropdownSourceValue2}

System Views Multi Select Contains Dropdown Text
########################################################System Views Multi Select Contains Dropdown Text####################################
  Click Element  ${SystemViews_MultiSelect_ContainsDropdownTextDropdwonControl}
  Click Element  ${SystemViews_MultiSelect_ContainsDropdownTextValue1}
  Click Element  ${SystemViews_MultiSelect_ContainsDropdownTextValue2}

System Views Multi Select Contains Dropdown Source
########################################################System Views Multi Select Contains Dropdown Source####################################
  Click Element  ${SystemViews_MultiSelect_ContainsDropdownSourceDropdwonControl}
  Click Element  ${SystemViews_MultiSelect_ContainsDropdownSourceValue1}
  Click Element  ${SystemViews_MultiSelect_ContainsDropdownSourceValue2}

###############################################################################################################################################
################################################# System multi Select Does Not Contain######################################################################################
System Views Multi Select Does Not Contain Dropdown Text
########################################################System Views Multi  Select Does Not Contain  Dropdown Text####################################
  Click Element  ${SystemViews_MultiSelect_DoesNotContainDropdownTextDropdwonControl}
  Element Should Not Contain  ${SystemViews_MultiSelect_DoesNotContainDropdownTextContainer}
  Click Element  ${SystemViews_MultiSelect_DoesNotContainDropdownTextValue1}
  Click Element  ${SystemViews_MultiSelect_DoesNotContainDropdownTextValue2}

System Views Multi Select Does Not Contain Dropdown Source
########################################################System Views Multi  Select Does Not Contain Dropdown Source####################################
  Click Element  ${SystemViews_MultiSelect_DoesNotContainDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemViews_MultiSelect_DoesNotContainDropdownSourceContainer}
  Click Element  ${SystemViews_MultiSelect_DoesNotContainDropdownSourceValue1}
  Click Element  ${SystemViews_MultiSelect_DoesNotContainDropdownSourceValue2}


###############################################System user Source Filters###################################################
Update System Users Match Values
###################################Update System Users Match Values##########################################################################
  Click Element  ${SystemUser_MatchOn_DropdownText_DropdownControl}
  Click Element  ${SystemUser_MatchOn_DropdownText_Value}
  Click Element  ${SystemUser_MatchOn_DropdownSource_DropdownControl}
  Click Element  ${SystemUser_MatchOn_DropdownSource_Value}

#####################SYSTEM USER SOURCE FILTERS##################################################################
Verify System User Match on Values
##############################################Verify System User Match on Values################################################
  Page Should Contain  ${SystemUser_Matchon_DefaultValue_Textbox}
  Page Should Contain  ${SystemUser_Matchon_DefaultValue_DropdownText}
  Page Should Contain  ${SystemUser_Matchon_DefaultValue_DropdownSource}
  Page Should Contain  ${SystemUser_Matchon_DefaultValue_Specify}

System User Single Select Equals To Textbox
########################################################System User Single Select Equals To Textbox###############################################################
  Click Element  ${SystemUser_SingleSelect_EqualsToTextboxDropdwonControl}
  Click Element  ${SystemUser_SingleSelect_EqualsToTextboxValue}

System User Single Select Equals To Dropdown Text
########################################################System User Single Select Equals To Dropdown Text####################################
  Click Element  ${SystemUser_SingleSelect_EqualsToDropdownTextDropdwonControl}
  Click Element  ${SystemUser_SingleSelect_EqualsToDropdownTextValue}
System User Single Select Equals To Dropdown Source
########################################################System User Single Select Equals To Dropdown Source####################################
   Click Element  ${SystemUser_SingleSelect_EqualsToDropdownSourceDropdwonControl}
  Click Element  ${SystemUser_SingleSelect_EqualsToDropdownSourceValue}
System User Single Select Equals To Specify
########################################################System User Single Select Equals To Specify############################################
  Click Element  ${SystemUser_SingleSelect_EqualsToSpecifyDropdwonControl}
  Click Element  ${SystemUser_SingleSelect_EqualsToSpecifyValue}

System User Single Select Is Not Equals To Textbox
########################################################System User Single Select Is Not  Equals To Textbox###############################################################
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToTextboxDropdwonControl}
   Element Should Not Contain  ${SystemUser_SingleSelectIsNotEqualsToTextboxContainer}        Permisions User
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToTextboxValue}
System User Single Select Is Not Equals To Dropdown Text
########################################################System User Single Select Is Not  Equals  To Dropdown Text####################################
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain  ${SystemUser_SingleSelectIsNotEqualsToDropdownTextContainer}             Permisions User
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToDropdownTextValue}
System User Single Select Is Not Equals To Dropdown Source
########################################################System User Single Select Is Not  Equals  To Dropdown Source####################################
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemUser_SingleSelectIsNotEqualsToDropdownSourceContainer}          Permisions User
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToDropdownSourceValue}
System User Single Select Is Not Equals To Specify
########################################################System User Single Select Is Not  Equals  To Specify############################################
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToSpecifyDropdwonControl}
  Element Should Not Contain  ${SystemUser_SingleSelectIsNotEqualsToSpecifyContainer}         Permisions User
  Click Element  ${SystemUser_SingleSelectIsNotEqualsToSpecifyValue}


System User Single Select Starts With Textbox
########################################################System User Single Select Starts With Textbox###############################################################
  Click Element  ${SystemUsers_SingleSelect_StartsWithTextboxDropdwonControl}
  Click Element  ${SystemUsers_SingleSelect_EqualsToTextboxValue}
System User Single Select Starts With Dropdown Text
########################################################System User Single  Select Starts With Dropdown Text####################################
  Click Element  ${SystemUsers_SingleSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${SystemUsers_SingleSelect_StartsWithDropdownTextValue}
System User Single Select Starts With Dropdown Source
########################################################System User Single  Select Starts With Dropdown Source####################################
  Click Element  ${SystemUsers_SingleSelect_StartsWithDropdownSourceDropdwonControl}
  Click Element  ${SystemUsers_SingleSelect_StartsWithDropdownSourceValue}
System User Single Select Starts With Specify
########################################################System User Single  Select Starts With Specify############################################
  Click Element  ${SystemUsers_SingleSelect_StartsWithSpecifyDropdwonControl}
  Click Element   ${SystemUsers_SingleSelect_StartsWithSpecifyValue}


System User Single Select Ends With Textbox
########################################################System User Single Select Ends With Textbox###############################################################
   Click Element  ${SystemUser_SingleSelectEndsWithTextboxDropdwonControl}
   Click Element  ${SystemUser_SingleSelectEndsWithTextboxValue1}
System User Single Select Ends With Dropdown Text
########################################################System User Single Select Ends With Dropdown Text####################################
   Click Element  ${SystemUser_SingleSelectEndsWithDropdownTextDropdwonControl}
   Click Element  ${SystemUser_SingleSelectEndsWithDropdownTextValue}
System User Single Select Ends With Dropdown Source
########################################################System User Single Select Ends With Dropdown Source####################################
  Click Element  ${SystemUser_SingleSelectEndsWithDropdownSourceDropdwonControl}
   Click Element  ${SystemUser_SingleSelectEndsWithDropdownSourceValue}
System User Single Select Ends With Specify
########################################################System User Single Select Ends With Specify############################################
   Click Element  ${SystemUser_SingleSelectEndsWithSpecifyDropdwonControl}
   Click Element  ${SystemUser_SingleSelectEndsWithSpecifyValue1}

########################################################################################################################################
System User Single Select Contains Textbox
########################################################System User Single  Select Contains Textbox###############################################################
    Click Element   ${SystemUsers_SingleSelectContainsTextboxDropdwonControl}
    Click Element  ${SystemUsers_SingleSelectEndsWithTextboxValue}
System User Single Select Contains Dropdown Text
########################################################System User Single Select Contains Dropdown Text####################################
    Click Element  ${SystemUsers_SingleSelectContainsDropdownTextDropdwonControl}
   Click Element  ${SystemUsers_SingleSelectContainsDropdownTextValue}
System User Single Select Contains Dropdown Source
########################################################System User Single Select Contains Dropdown Source####################################
  Click Element  ${SystemUsers_SingleSelectContainsDropdownSourceDropdwonControl}
  Click Element  ${SystemUsers_SingleSelectContainsDropdownSourceValue}
System User Single Select Contains Specify
########################################################System User Single Select Contains Specify############################################
   Click Element  ${SystemUsers_SingleSelectContainsSpecifyDropdwonControl}
   Click Element  ${SystemUsers_SingleSelectContainsSpecifyValue}

System Users Single Select Does Not Contain Textbox
############################################System Users Single Select Does Not Contain Textbox###################################################
  Click Element  ${SystemUsers_SingleSelectDoesNotContainTextboxDropdwonControl}
  Element Should Not Contain   ${SystemUsers_SingleSelectDoesNotContainTextboxContainer}     Persmissions User
  Click Element  ${SystemUsers_SingleSelectDoesNotContainTextboxValue}

System Users Single Select Does Not Contain Dropdown Text
########################################################System Users Single Select Does Not Contain  Dropdown Text####################################
  Click Element  ${SystemUsers_SingleSelectDoesNotContainDropdownTextDropdwonControl}
  Element Should Not Contain  ${SystemUsers_SingleSelectDoesNotContainDropdownTextContainer}            Persmissions User
  Click Element  ${SystemUsers_SingleSelectDoesNotContainDropdownTextValue}
System Users Single Select Does Not Contain Dropdown Source
########################################################System Users Single Select Does Not Contain Dropdown Source####################################
  Click Element  ${SystemUsers_SingleSelectDoesNotContainDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemUsers_SingleSelectDoesNotContainDropdownSourceContainer}                 Persmissions User
  Click Element  ${SystemUsers_SingleSelectDoesNotContainDropdownSourceValue}
System Users Single Select Does Not Contain Specify
########################################################System Users Single Select Does Not Contain Specify############################################
   Click Element  ${SystemUsers_SingleSelectDoesNotContainSpecifyDropdwonControl}
   Element Should Not Contain  ${SystemUsers_SingleSelectDoesNotContainSpecifyContainer}               Persmissions User
  Click Element  ${SystemUsers_SingleSelectDoesNotContainSpecifyValue}

Update System User Match Default Values
######################################Update System User Match Default Values###########################################
  Click Element   ${Update_SystemUsers_Matchon_DropdownText_DropdownControl}
   Click Element  ${Update_SystemUsers_Matchon_DropdownText_Value}
  Click Element  ${Update_SystemUsers_Matchon_DropdownSource_DropdownControl}
  Click Element  ${Update_SystemUsers_Matchon_DropdownSource_Value}


###################################################################################################################################################
System Users Multi Select -Equals To Dropdown Text
########################################################System Users Multi Select -Equals  To Dropdown Text####################################
  Click Element  ${SystemUsers_MultiSelect_EqualsToDropdownTextDropdwonControl}
  Click Element  ${SystemUsers_MultiSelect_EqualsToDropdownText_Value1}
  Click Element  ${SystemUsers_MultiSelect_EqualsToDropdownTextValue2}

System Users Multi Select -Equals To Dropdown Source
########################################################System Users Multi Select -Equals  To Dropdown Source####################################
   Click Element  ${SystemUsers_MultiSelect_EqualsToDropdownSourceDropdwonControl}
   Click Element  ${SystemUsers_MultiSelect_EqualsToDropdownSourceValue1}
  Click Element   ${SystemUsers_MultiSelect_EqualsToDropdownSourceValue2}

##################################################################################################################################################
System Users Multi Select-Is Not Equals To Dropdown Text
########################################################System Users Multi Select-Is Not  Equals  To Dropdown Text####################################
  Click Element  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownTextDropdwonControl}
  Element Should Not Contain  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownTextContainer}     Permissions User, Carlo Rosslee
  Click Element  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownTextValue1}
  Click Element  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownTextValue}
System Users Multi Select-Is Not Equals To Dropdown Source
########################################################System Users Multi Select-Is Not  Equals  To Dropdown Source####################################
  Click Element  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownSourceDropdwonControl}
  Element Should Not Contain  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownSourceConatiners}       Permissions User, Carlo Rosslee
  Click Element  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownSourceValue1}
  Click Element  ${SystemUsers_MultiSelect_IsNotEqualsToDropdownSourceValue2}

System User Multi Select Starts With Dropdown Text
########################################################System User Multi Select Starts With Dropdown Text####################################
  Click Element  ${SystemUser_MultiSelect_StartsWithDropdownTextDropdwonControl}
  Click Element  ${SystemUser_MultiSelect_StartsWithDropdownTextValue1}
  Click Element  ${SystemUser_MultiSelect_StartsWithDropdownTextValue2}
System User Multi Select Starts With Dropdown Source
########################################################System User Multi Select Starts With Dropdown Source####################################
   Click Element  ${SystemUser_MultiSelect_StartsWithDropdownSourceDropdwonControl}
   Click Element  ${SystemUser_MultiSelect_StartsWithDropdownSourceValue1}
   Click Element   ${SystemUser_MultiSelect_StartsWithDropdownSourceValue2}
####################################################################################################################################
System User Multi Select Ends With Dropdown Text
#######################################################System User Multi Select Ends With Dropdown Text####################################
  Click Element  ${SystemUser_MultiSelect_EndsWithDropdownTextDropdwonControl}
  Click Element  ${SystemUser_MultiSelect_EndsWithDropdownTextValue1}
  Click Element  ${SystemUser_MultiSelect_EndsWithDropdownTextValue2}
System User Multi Select Ends With Dropdown Source
########################################################System User Multi Select Ends  With Dropdown Source####################################
  Click Element  ${SystemUser_MultiSelect_EndsWithDropdownSourceDropdwonControl}
  Click Element  ${SystemUser_MultiSelect_EndsWithDropdownSourceValue1}
  Click Element  ${SystemUser_MultiSelect_EndsWithDropdownSourceValue2}

########################################################################################################################################
System User Multi Select Contains Dropdown Text
########################################################System User Multi Select Contains Dropdown Text####################################
  Click Element  ${SystemUser_MultiSelect_ContainsDropdownTextDropdwonControl}
  Click Element  ${SystemUser_MultiSelect_ContainsDropdownTextValue1}
  Click Element  ${SystemUser_MultiSelect_ContainsDropdownTextValue2}
System User Multi Select Contains Dropdown Source
########################################################System User Multi Select Contains Dropdown Source####################################
  Click Element  ${SystemUser_MultiSelect_ContainsDropdownSourceDropdwonControl}
  Click Element  ${SystemUser_MultiSelect_ContainsDropdownSourceValue1}
  Click Element  ${SystemUser_MultiSelect_ContainsDropdownSourceValue2}

System Users Multi Select Does Not Contain Dropdown Text
########################################################System Users Multi  Select Does Not Contain  Dropdown Text####################################
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownTextDropdwonControl}
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownTextContainer}
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownTextValue1}
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownTextValue2}
System Users Multi Select Does Not Contain Dropdown Source
########################################################System Users Multi  Select Does Not Contain Dropdown Source####################################
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownSourceDropdwonControl}
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownSourceContainer}
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownSourceValue1}
  Click Element  ${SystemUsers_MultiSelect_DoesNotContainDropdownSourceValue2}

Navigate To Grouped Data Sources
#########################################GROUPED DATA SOURCES CONTROL PROPERTIES####################################################
  Click Element   ${Grouped_Data_Sources_Tab}
##########################################################################################################################

Verify Grouped Data Sources Control Properties values
############################################Grouped Data Sources Control Properties values
  Element Should Contain       ${DefaultLevel1Title}   Mr
  Element Should Contain      ${DefalutLevel2Title}     External User
   Element Should Contain     ${DefalutLevel1_UserProfiles}   Project User
  Element Should Contain       ${DefalutLevel2_UserProfiles}    Record Ownership 5 (Project User)

Load on Demand Title
#####################################################Load on Demand Title ################################################################
   Click Element  ${LoadOnDemand_Tittle_DropdownControl}
   Input Text  ${LoadOnDemand_Tittle_SearchTextField}       Mr
   Click Element   ${SearchIcon}
    Click Element  ${LoadOnDemand_Tittle_DropdownControl}
      Input Text  ${LoadOnDemand_Tittle_SearchTextField}       Carlo Rosslee
      Click Element   ${SearchIcon}
   Click Element   ${LoadOnDemand_UserProfile_DropdownControl}
   Input Text   ${LoadOnDemand_UserProfile_SearchTextField}      Project Super User
   Click Element    ${LoadOnDemand_UserProfile_SearchIcon}
   Click Element   ${SaveGroupedDataSource}

Expand By Default Tittle
  Click Element  ${ExpandByDefault}
  Element Should Contain    ${ExpandByDefaultChildValue}    Carlo Rosslee
  Click Element    ${ExpandByDefaultChildValue}

Expand By Default Internal
  Click Element  ${ExpandByDefault_Internal}
  Click Element   ${ExpandByDefault_InternalValue}
  Click Element   ${SaveGroupedDataSource}


Show Selected Item Tittle
  Click Element    ${ShowSelectedItem_Tittle}
  Click Element   ${ShowSelectedItem_Tittle_Expand}
  Click Element   ${ShowSelectedItemValue}
   Element Should Contain    ${VerifyCarlaSmith}    Carla Smith
  Click Element   ${SaveGroupedDataSource}
Show Selected Item Internal
  Click Element   ${ShowSelectedItem_Internal}
   Click Element  ${ShowSelectedItem_Internal_Expand}
  Click Element   ${ShowSelectedItem_Internal_Value}
  Element Should Contain   ${VerifyCarloRoss}    Carlo Ross
   Click Element   ${SaveGroupedDataSource}

Refresh Data Source
   Click Element   ${RefreshDataSourceTittle}
   Input Text  ${RefreshDataSourceSearchField}    Spanish User
   Click Element   ${RefreshDataSourceSearchIcon}
   Element Should Contain   ${RefreshDatasearchResults}   Uncategorised
      Click Element    ${ExpandUncatogrised}
       Element Should Contain     ${Uncatagorizedvalue}   Spanish User
      Click Element    ${Uncatagorizedvalue}


      Click Element  ${RefreshDataSourceTittle}
      Click Element   ${RefreshItemlist}
      Click Element   ${RefreshDataSourceTittle}
      Input Text  ${RefreshDataSourceSearchField}    Spanish User
      Click Element   ${RefreshDataSourceSearchIcon}
      Click Element    ${Uncatagorizedvalue}
        Click Element   ${SaveGroupedDataSource}
Refresh Data Duplicate Browser
#   Click Element    ${ExpandUncatogrised}
#    Element Should Contain     ${Uncatagorizedvalue}   Spanish User
#   Click Element    ${Uncatagorizedvalue}
#  Click Element   ${UpdateTittleDropdown}
#    Click Element    ${UpdateTittleValue}
#   Click Element   ${SaveGroupedDataSource}
   Click Element  ${RefreshDataSourceTittle}
   Click Element   ${RefreshItemlist}
   Click Element   ${RefreshDataSourceTittle}
   Input Text  ${RefreshDataSourceSearchField}    Spanish User
   Click Element   ${RefreshDataSourceSearchIcon}
   Click Element    ${Uncatagorizedvalue}

Select and Display
  Click Element   ${Select1to2Display1to2_tittle_Dropdwn}
  Click Element   ${Select1to2Display1to2_tittle_ExpandMr}
  Click Element   ${Select1to2Display1to2_tittle_ExpandMr_Value}
    Click Element  ${Select2to2Display1to2_tittle_Dropdwn}
   Click Element  ${Select2to2Display1to2_tittle_ExpandMr}
    Click Element  ${Select2to2Display1to2_tittle_ExpandMr_Value}
    Click Element  ${UserProfilesSelect1to2Display1to2}
   Click Element   ${UserProfilesSelect1to2Display1to2Value}
   Click Element   ${UserProfilesSelect2to2Display1to2}
   Click Element  ${UserProfilesSelect2to2Display1to2Value}
   Click Element   ${Select1to2Display1to2_Internal_Dropdown}
   Click Element   ${Select1to2Display1to2_Internal_Expand_External}
   Click Element   ${Select1to2Display1to2_Internal_Value}
   Click Element  ${Select2to2Display1to2_Internal_Dropdown}
   Click Element  ${Select2to2Display1to2_Internal_Expand_External}
   Click Element  ${Select2to2Display1to2_Internal_Value}
     Click Element   ${SaveGroupedDataSource}
Display Min Max
    Click Element  ${SelectMaxDrodown_Title}
    Click Element   ${SelectMaxDrodown_Title_Expand_Mr}
   Click Element   ${SelectMaxDrodown_Title_Expand_Mr_Value}

   Click Element   ${DisplayMaxDrodown_Title}
   Click Element   ${DisplayMaxDrodown_Title_Expand_Mr}
    Click Element   ${DisplayMaxDrodown_Title_Expand_Mr_Value}

   Click Element   ${SelectMaxDrodown_Internal}
    Click Element   ${SelectMaxDrodown_Internal_Expand_External}
    Click Element   ${SelectMaxDrodown_Internal_Expand_Mr_External}

   Click Element  ${DisplayMaxDrodown_Internal}
   Click Element  ${DisplayMaxDrodown_Internal_Expand_External}
   Click Element   ${DisplayMaxDrodown_Internal_Expand_Mr_External}
      Click Element   ${SaveGroupedDataSource}

Filter Grouped Sources Module Template Based
   Click Element   ${SpecifyMr}
    Click Element   ${ExpandSpecifyMr}
    Click Element   ${SpecifyMrValue}

   Click Element  ${ControlSelectedItems}
  Click Element  ${ControlSelectedItems_Mrs}
  Click Element  ${ControlSelectedItems_Mrs_Value}
  Click Element  ${SpecifyUserProfile}
  Click Element   ${Expand_SpecifyUserProfile}
  Click Element    ${Expand_SpecifyUserProfile_Value}
   Click Element   ${SaveGroupedDataSource}

Filter Grouped Sources Instance Based
    Click Element   ${SpecifyMr2}
    Click Element   ${ExpandSpecifyMr2}
    Click Element   ${SpecifyMrValue2}

   Click Element  ${ControlSelectedItems2}
  Click Element  ${ControlSelectedItems_Mrs2}
  Click Element  ${ControlSelectedItems_Mrs_Value2}
  Click Element  ${SpecifyUserProfile2}
  Click Element   ${Expand_SpecifyUserProfile2}
  Click Element    ${Expand_SpecifyUserProfile_Value2}
   Click Element   ${SaveGroupedDataSource2}

Navigate to Email Notification Tab
   Click Element  ${EmailNotificationTab}

Email Notification On Add
  Click Element   ${Title_Ascending_Single_Select_Dropdown}
  Click Element   ${Title_Ascending_Single_Select_Mr}
  Click Element    ${Title_Ascending_MultiSelect_Select_Dropdown}
  Click Element    ${Title_Ascending_MultiSelect_Select_Mrs}
  Click Element     ${Inter_External_SingleSelect_Checkbox}
  Click Element    ${Save_Email_Triggers}

Email Notification On View
  Click Element   ${Expand_UserProfile_SingleSelectDropdown}
  Element Should Contain     ${Expand_UserProfile_SingleSelectContainer}             Project Super User,Project User,System Administrator,Veiwer,Uncategorized
  Element Should Contain    ${Expand_UserProfile_SingleSelectDropdownContainer}       Project Super User
   Click Element     ${Expand_UserProfile_MultiSelectDropdown}
  Element Should Contain    ${Expand_UserProfile_MultiSelectContainer}                 Project Super User,Project User,System Administrator,Veiwer,Uncategorized
  Element Should Contain    ${VerifyDefaultValue_UserProfile_MultiSelectContainer}          Project User
  Element Should Contain   ${VerifyDefaultValue_Userprofile_MultiSelect_Checkbox_Container}         Record Ownership 7 (Internal)
   Element Should Contain   ${VerifyDefaultValue_Userprofile_SingleSelect_Container}             Viewer (read only/data consumer)
   Click Element    ${Save_Email_Triggers}

On Edit
  Click Element  ${Title_Descending_Single_Select_Dropdown}
  Click Element  ${Title_Descending_Single_Select_Mrs}
  Click Element   ${Title_Descending_MultiSelect_Select_Dropdown}
  Click Element   ${Title_Descending_MultiSelect_Select_Mr}
  Click Element  ${Title_Descending_SingleSelect_Checkbox_Mrs}
  Click Element  ${Tittle_Descending_MultiSelect_Checkbox_Mr}
   Click Element    ${Save_Email_Triggers}

On Delete
    Click Element   ${Internal_External_Single_Select_Dropdown}
    Click Element  ${Internal_External_Single_Select_External}
    Click Element  ${Internal_External_MultiSelect_Select_Dropdown}
    Click Element  ${Internal_External_MultiSelect_Select_Internal}
   Click Element   ${Internal_External_SingleSelect_Checkbox_External}
    Click Element   ${Internal_External_MultiSelect_Checkbox_Internal}
      Click Element    ${Save_Email_Triggers}

On Condition 1
   Click Element   ${Condition_Checkboxlist_Multi_Select_Dropdown}
  Click Element     ${Condition_Internal_External_DropdownValue}
   Click Element    ${Save_Email_Triggers}
  Click Element   ${SendEmail_When_CheckboxisequaltoSelected}
  Click Element    ${Save_Email_Triggers}

On Condition 2
   Click Element    ${Condition_User_Profile_Dropdown}
   Click Element   ${Condition_User_Profile_DropdownValue}
   Click Element    ${Save_Email_Triggers}
   Click Element    ${SendEmail_When_CheckboxChangetoSelected}
   Click Element    ${Save_Email_Triggers}


On Condition 3.1
  Click Element  ${Title_CheckboxList_MultiSelect_Value_Mr}
    Click Element    ${Save_Email_Triggers}
    Click Element    ${Title_CheckboxList_MultiSelect_Checkbox}
    Click Element    ${Save_Email_Triggers}

On Condition 3.2
     Click Element    ${Title_CheckboxList_MultiSelect_Checkbox}
     Click Element    ${SendEmail_Yes_Dropdown}
     Click Element    ${SendEmailDropdownValueYes}
     Click Element    ${Save_Email_Triggers}

On Condition 4.1
    Click Element   ${TittleSingleSelectCheckbox_value_Mrs}
     Click Element    ${Save_Email_Triggers}
     Click Element    ${TittleSingleSelectCheckbox_External_Internal_SendEmailCheckbox}
     Click Element    ${Save_Email_Triggers}

On Condition 4.2
       Click Element    ${Title_CheckboxList_MultiSelect_Checkbox}
       Click Element    ${SendEmail_Yes_Dropdown}
       Click Element    ${SendEmailDropdownValueYes}
       Click Element    ${Save_Email_Triggers}



