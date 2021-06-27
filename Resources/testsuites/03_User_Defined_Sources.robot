*** Settings ***
Documentation   Suite description
Library         Selenium2Library
#Resource        ${CURDIR}${/}..${/}Resources${/}keywords.robot
#Resource        ${CURDIR}${/}..${/}Resources${/}vars.robot
Resource        ${CURDIR}${/}..${/}keywords.robot
Resource        ${CURDIR}${/}..${/}vars.robot
Force Tags      behavior-driven
#Suite Teardown  Close Browser

*** Test Cases ***
#User Defined Sources Single Select
#  [Tags]    Flatlist
#  Launch IsoMetrix Application
#  Login with Valid Credentials
#  Switch to Iframe
#  Navigate to Sources
#  Navigate to Module C1
#  Add a New Record
#  User Defined Sources Single Select
#  Save Record
#User Defined Sources Multi Select
#  Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C1
#    Add a New Record
#    User Defined Sources Multi Select
#    Save Record
#User Defined Sources Hierarchy Single Select
#       Launch IsoMetrix Application
#       Login with Valid Credentials
#       Switch to Iframe
#       Navigate to Sources
#       Navigate to Module C1
#       Add a New Record
#       User Defined Sources Hierarchy Single Select
#       Save Record
##
#User Defined Sources Hierarchy Multi Select
#    Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C1
#    Add a New Record
#    User Defined Sources Hierarchy Multi Select
#Display and Select -Min/Max
#    Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C1
#    Add a New Record
#    Display and Select -Min/Max
#
#Filtered (Lite)
#      Launch IsoMetrix Application
#      Login with Valid Credentials
#      Switch to Iframe
#      Navigate to Sources
#      Navigate to Module C1
#      Add a New Record
#      Filtered (Lite)

#*** Keywords ***