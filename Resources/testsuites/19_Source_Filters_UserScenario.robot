#*** Settings ***
#Documentation   Suite description
#Library         Selenium2Library
##Resource        ${CURDIR}${/}..${/}Resources${/}keywords.robot
##Resource        ${CURDIR}${/}..${/}Resources${/}vars.robot
#Resource        ${CURDIR}${/}..${/}keywords.robot
#Resource        ${CURDIR}${/}..${/}vars.robot
#Force Tags      behavior-driven
##Suite Teardown  Close Browser
#
#*** Test Cases ***
#System Users Scenario Single Select - Equals to
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters
#            Add a New Record
#            Navigate to All Filters System
#            Verify Default Values on Level and View Fields
