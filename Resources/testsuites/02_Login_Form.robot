#*** Settings ***
#Documentation   Suite description
#Library         Selenium2Library
##Resource        ${CURDIR}${/}..${/}Resources${/}keywords.robot
##Resource        ${CURDIR}${/}..${/}Resources${/}vars.robot
#Resource        ${CURDIR}${/}..${/}keywords.robot
#Resource        ${CURDIR}${/}..${/}vars.robot
#Force Tags      behavior-driven
#Suite Teardown  Close Browser
#
#*** Test Cases ***
#Blank Username and Blank password
#    Launch IsoMetrix Application
#    Blank Username and Blank password
#
#Invalid Username and Blank Password
#    Launch IsoMetrix Application
#    Invalid Username and Blank Password
#
#Invalid Password and Blank Username
#    Launch IsoMetrix Application
#    Invalid Password and Blank Username
#
#Valid Username and Invalid Password
#  Launch IsoMetrix Application
#  Valid Username and Invalid Password
#
#Forgot Password Link
#   Launch IsoMetrix Application
#   Forgot Password Link
##
#Request New Account Link
#    Launch IsoMetrix Application
#    Request New Account Link
#Sucessful Password Reset
#   Launch IsoMetrix Application
#   Sucessful Password Reset
#
#
#
#Successful Login
#  Launch IsoMetrix Application
#  Login with Valid Credentials
#  Log out
#
#
#Request Access With No Data
#
#      Launch IsoMetrix Application
#      Request Access With No Data
#
#Negative Validation Request Access With Surname Only
#   Launch IsoMetrix Application
#    Negative Validation Request Access With Surname Only
#
#Negative Validation Request Access With Surname and Name
#    Launch IsoMetrix Application
#    Negative Validation Request Access With Surname and Name
#
#Negative Validation Request Access With Surname ,Name and Email Address
#   Launch IsoMetrix Application
#   Negative Validation Request Access With Surname ,Name and Email Address
#
#Negative Validation Request Access With Surname ,Name, Email Address and Reason For Request
#    Launch IsoMetrix Application
#    Negative Validation Request Access With Surname ,Name, Email Address and Reason For Request

#Successful Access Request
#    Launch IsoMetrix Application
#    Successful Access Request
#Reset Password With Blank Username and Email Address
#    Launch IsoMetrix Application
#    Reset Password With Blank Username and Email Address


#Reset Password With Invalid Username Only
#    Launch IsoMetrix Application
#   Reset Password With Invalid Username Only

#Reset Pasword With Invalid Email Address
#    Launch IsoMetrix Application
#    Reset Pasword With Invalid Email Address
#Locked Account
#  Launch IsoMetrix Application
#  Locked Account


###*** Keywords ***
