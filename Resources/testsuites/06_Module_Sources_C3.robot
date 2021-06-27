#*** Settings ***
#Documentation   Suite description
#Library         Selenium2Library
#Resource        ${CURDIR}${/}..${/}keywords.robot
#Resource        ${CURDIR}${/}..${/}vars.robot
#Force Tags      behavior-driven
##Suite Teardown  Close Browser
#
#*** Test Cases ***
#Module A1 All Levels and Views Textbox B1 All (Module C3)
#  Launch IsoMetrix Application
#        Login with Valid Credentials
#        Switch to Iframe
#        Navigate to Sources
#        Navigate to Module C3
#        Add a New Record
#        Navigate to Module A1 All Levels And Views
#        Module A1 All Levels and Views Textbox B1 All
#
#Module A1 ALL Levels and Views Textbox B2 Specific (Module C3)
#    Launch IsoMetrix Application
#           Login with Valid Credentials
#           Switch to Iframe
#           Navigate to Sources
#           Navigate to Module C3
#           Add a New Record
#           Navigate to Module A1 All Levels And Views
#           Module A1 ALL Levels and Views Textbox B2 Specific
#Module A1 ALL Levels and Views Textbox B3 Module (Module C3)
#             Launch IsoMetrix Application
#             Login with Valid Credentials
#             Switch to Iframe
#             Navigate to Sources
#             Navigate to Module C2
#             Add a New Record
#             Navigate to Module A1 All Levels And Views
#             Module A1 ALL Levels and Views Textbox B3 Module
#Module A1 ALL Levels and Views Textbox B4 Enherit (Module C3)
#     Launch IsoMetrix Application
#                  Login with Valid Credentials
#                  Switch to Iframe
#                  Navigate to Sources
#                  Navigate to Module C3
#                  Add a New Record
#                  Navigate to Module A1 All Levels And Views
#                  Module A1 ALL Levels and Views Textbox B4 Enherit
#
#
#Module A1-All Levels and Views Numeric Textbox B1 All (Module C3)
#        Launch IsoMetrix Application
#        Login with Valid Credentials
#        Switch to Iframe
#        Navigate to Sources
#        Navigate to Module C3
#        Add a New Record
#        Navigate to Module A1 All Levels And Views
#        Module A1-All Levels and Views Numeric Textbox B1 All
#Module A1-All Levels and Views Numeric Textbox B2 Specific (Module C3)
#  Launch IsoMetrix Application
#         Login with Valid Credentials
#         Switch to Iframe
#         Navigate to Sources
#         Navigate to Module C3
#         Add a New Record
#         Navigate to Module A1 All Levels And Views
#  Module A1-All Levels and Views Numeric Textbox B2 Specific
#
#Module A1-All Levels and Views Numeric Textbox B3 Module (Module C3)
#  Launch IsoMetrix Application
#          Login with Valid Credentials
#          Switch to Iframe
#          Navigate to Sources
#          Navigate to Module C3
#          Add a New Record
#          Navigate to Module A1 All Levels And Views
#          Module A1-All Levels and Views Numeric Textbox B3 Module
#Module A1-All Levels and Views Numeric Textbox B4 Enherit (Module C3)
#      Launch IsoMetrix Application
#                    Login with Valid Credentials
#                    Switch to Iframe
#                    Navigate to Sources
#                    Navigate to Module C2
#                    Add a New Record
#                    Navigate to Module A1 All Levels And Views
#                    Module A1-All Levels and Views Numeric Textbox B4 Enherit
#Module A1 -All Levels and Views Text Area B1 All (Module C3)
#     Launch IsoMetrix Application
#              Login with Valid Credentials
#              Switch to Iframe
#              Navigate to Sources
#              Navigate to Module C2
#              Add a New Record
#              Navigate to Module A1 All Levels And Views
#             Module A1 -All Levels and Views Text Area B1 All
#
#Module A1 -All Levels and Views Text Area B2 Specific (Module C3)
#       Launch IsoMetrix Application
#                Login with Valid Credentials
#                Switch to Iframe
#                Navigate to Sources
#                Navigate to Module C3
#                Add a New Record
#                Navigate to Module A1 All Levels And Views
#               Module A1 -All Levels and Views Text Area B2 Specific
#Module A1 -All Levels and Views Text Area B3 Module (Module C3)
#  Launch IsoMetrix Application
#                 Login with Valid Credentials
#                 Switch to Iframe
#                 Navigate to Sources
#                 Navigate to Module C3
#                 Add a New Record
#                 Navigate to Module A1 All Levels And Views
#                 Module A1 -All Levels and Views Text Area B3 Module
#Module A1 -All Levels and Views Text Area B4 Enherit (Module C3)
#          Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate to Module C3
#                   Add a New Record
#                   Navigate to Module A1 All Levels And Views
#                   Module A1 -All Levels and Views Text Area B4 Enherit
#
#Module A2 - Specifc Textbox B1 All (Module C3)
#         Launch IsoMetrix Application
#                Login with Valid Credentials
#                Switch to Iframe
#                Navigate to Sources
#                Navigate to Module C3
#                Add a New Record
#                Navigate to Module A2 Specific
#                Module A2 - Specifc Textbox B1 All
#
#Module A2 - Specifc Textbox B2 Specific (Module C3)
#   Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate to Module C3
#                   Add a New Record
#                   Navigate to Module A2 Specific
#                   Module A2 - Specifc Textbox B2 Specific
#Module A2 - Specifc Textbox B3 Module (Module C3)
#    Launch IsoMetrix Application
#                    Login with Valid Credentials
#                    Switch to Iframe
#                    Navigate to Sources
#                    Navigate to Module C3
#                    Add a New Record
#                    Navigate to Module A2 Specific
#                    Module A2 - Specifc Textbox B3 Module
#Module A2 - Specifc Textbox B4 Enherit (Module C3)
#        Launch IsoMetrix Application
#                           Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate to Module C3
#                           Add a New Record
#                           Navigate to Module A2 Specific
#                           Module A2 - Specifc Textbox B4 Enherit
#
#Module A2 - Specific Numeric B1 All (Module C3)
#  Launch IsoMetrix Application
#  Login with Valid Credentials
#  Switch to Iframe
#  Navigate to Sources
#  Navigate to Module C3
#  Add a New Record
#  Navigate to Module A2 Specific
#  Module A2 - Specific Numeric B1 All
#Module A2 - Specific Numeric B2 Specific (Module C3)
#  Launch IsoMetrix Application
#   Login with Valid Credentials
#   Switch to Iframe
#   Navigate to Sources
#   Navigate to Module C3
#   Add a New Record
#   Navigate to Module A2 Specific
#   Module A2 - Specific Numeric B2 Specific
#Module A2 - Specific Numeric B3 Module (Module C3)
#  Launch IsoMetrix Application
#   Login with Valid Credentials
#   Switch to Iframe
#   Navigate to Sources
#   Navigate to Module C3
#   Add a New Record
#   Navigate to Module A2 Specific
#   Module A2 - Specific Numeric B3 Module
#Module A2 - Specific Numeric B4 Enherit (Module C3)
#  Launch IsoMetrix Application
#   Login with Valid Credentials
#   Switch to Iframe
#   Navigate to Sources
#   Navigate to Module C3
#   Add a New Record
#   Navigate to Module A2 Specific
#   Module A2 - Specific Numeric B4 Enherit
#Module A2 - Specific Text Area B1 All (Module C3)
#  Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C3
#    Add a New Record
#    Navigate to Module A2 Specific
#    Module A2 - Specific Text Area B1 All
#
#Module A2 - Specific Text Area B2 Specific (Module C3)
#  Launch IsoMetrix Application
#     Login with Valid Credentials
#     Switch to Iframe
#     Navigate to Sources
#     Navigate to Module C3
#     Add a New Record
#     Navigate to Module A2 Specific
#     Module A2 - Specific Text Area B2 Specific
#
#Module A2 - Specific Text Area B3 Module (Module C3)
#       Launch IsoMetrix Application
#       Login with Valid Credentials
#       Switch to Iframe
#       Navigate to Sources
#       Navigate to Module C3
#       Add a New Record
#       Navigate to Module A2 Specific
#       Module A2 - Specific Text Area B3 Module
#
#Module A2 - Specific Text Area B4 Enherit (Module C3)
#  Launch IsoMetrix Application
#        Login with Valid Credentials
#        Switch to Iframe
#        Navigate to Sources
#        Navigate to Module C3
#        Add a New Record
#        Navigate to Module A2 Specific
#        Module A2 - Specific Text Area B4 Enherit
#
#Module A3 - Module Control Textbox B1 All (Module C3)
#            Launch IsoMetrix Application
#                    Login with Valid Credentials
#                    Switch to Iframe
#                    Navigate to Sources
#                    Navigate to Module C3
#                    Add a New Record
#                    Navigate to Module A3
#                    Module A3 - Module Control Textbox B1 All
#Module A3 - Module Control Textbox B2 Specific (Module C2)
#  Launch IsoMetrix Application
#   Login with Valid Credentials
#   Switch to Iframe
#   Navigate to Sources
#   Navigate to Module C3
#   Add a New Record
#   Navigate to Module A3
#   Module A3 - Module Control Textbox B2 Specific
#Module A3 - Module Control Textbox B3 Module (Module C3)
#  Launch IsoMetrix Application
#   Login with Valid Credentials
#   Switch to Iframe
#   Navigate to Sources
#   Navigate to Module C3
#   Add a New Record
#   Navigate to Module A3
#   Module A3 - Module Control Textbox B3 Module
#Module A3 - Module Control Textbox B4 Enherit (Module C3)
#   Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C3
#    Add a New Record
#    Navigate to Module A3
#    Module A3 - Module Control Textbox B4 Enherit
#
#Module A3 - Module Control Numeric B1 All (Module C3)
#  Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C3
#    Add a New Record
#    Navigate to Module A3
#    Module A3 - Module Control Numeric B1 All
#Module A3 - Module Control Numeric B2 Specific (Module C3)
#  Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C3
#    Add a New Record
#    Navigate to Module A3
#    Module A3 - Module Control Numeric B2 Specific
#Module A3 - Module Control Numeric B3 Module (Module C3)
#   Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C3
#    Add a New Record
#    Navigate to Module A3
#    Module A3 - Module Control Numeric B3 Module
#Module A3 - Module Control Numeric B4 Enherit (Module C3)
#  Launch IsoMetrix Application
#    Login with Valid Credentials
#    Switch to Iframe
#    Navigate to Sources
#    Navigate to Module C3
#    Add a New Record
#    Navigate to Module A3
#    Module A3 - Module Control Numeric B4 Enherit
#Module A3 - Module Control Text Area B1 All (Module C3)
#  Launch IsoMetrix Application
#     Login with Valid Credentials
#     Switch to Iframe
#     Navigate to Sources
#     Navigate to Module C3
#     Add a New Record
#     Navigate to Module A3
#     Module A3 - Module Control Text Area B1 All
#Module A3 - Module Control Text Area B2 Specific (Module C3)
#        Launch IsoMetrix Application
#        Login with Valid Credentials
#        Switch to Iframe
#        Navigate to Sources
#        Navigate to Module C3
#        Add a New Record
#        Navigate to Module A3
#        Module A3 - Module Control Text Area B2 Specific
#Module A3 - Module Control Text Area B3 Module (Module C3)
#         Launch IsoMetrix Application
#         Login with Valid Credentials
#         Switch to Iframe
#         Navigate to Sources
#         Navigate to Module C3
#         Add a New Record
#         Navigate to Module A3
#         Module A3 - Module Control Text Area B3 Module
#Module A3 - Module Control Text Area B4 Enherit (Module C3)
#       Launch IsoMetrix Application
#          Login with Valid Credentials
#          Switch to Iframe
#          Navigate to Sources
#          Navigate to Module C3
#          Add a New Record
#          Navigate to Module A3
#          Module A3 - Module Control Text Area B4 Enherit