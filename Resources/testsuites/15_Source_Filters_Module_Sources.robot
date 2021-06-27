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
#Module Single Select - Equals to
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters
#            Add a New Record
#            Navigate to All Filters Module Sources Tab
#            Verify Default Values on Level and View Fields
#            Verify Module Match on Default Values
#            Module Single Select Equals To Textbox
#            Module Single Select Equals To Dropdown Text
#            Module Single Select Equals To Dropdown Source
#            Module Single Select Equals To Specify
#           Save Record
#
#Module Single Select - Is not equals to
#       Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate To All Filters
#                   Add a New Record
#                   Navigate to All Filters Module Sources Tab
#                   Verify Default Values on Level and View Fields
#                   Verify Module Match on Default Values
#                   Module Single Select Is Not Equals To Textbox
#                   Module Single Select Is Not Equals To Dropdown Text
#                   Module Single Select Is Not Equals To Dropdown Source
#                   Module Single Select Is Not Equals To Specify
#                   Save Record
#Module Single Select - Starts with
#   Launch IsoMetrix Application
#                     Login with Valid Credentials
#                     Switch to Iframe
#                     Navigate to Sources
#                     Navigate To All Filters
#                     Add a New Record
#                     Navigate to All Filters Module Sources Tab
#                     Verify Default Values on Level and View Fields
#                     Verify Module Match on Default Values
#                     Module Single Select Starts With Textbox
#                     Module Single Select Starts With Dropdown Text
#                     Module Single Select Starts With Dropdown Source
#                     Module Single Select Starts With Specify
#                     Save Recordsss
#
#Module Single Select - Ends with
#     Launch IsoMetrix Application
#                      Login with Valid Credentials
#                      Switch to Iframe
#                      Navigate to Sources
#                      Navigate To All Filters
#                      Add a New Record
#                      Navigate to All Filters Module Sources Tab
#                      Verify Default Values on Level and View Fields
#                      Verify Module Match on Default Values
#                      Module Single Select Ends With Textbox
#                      Module Single Select Ends With Dropdown Text
#                      Module Single Select Ends With Dropdown Source
#                      Module Single Select Ends With Specify
#                      Save Record
#
#Module Single Select - Contains
#      Launch IsoMetrix Application
#                      Login with Valid Credentials
#                      Switch to Iframe
#                      Navigate to Sources
#                      Navigate To All Filters
#                      Add a New Record
#                      Navigate to All Filters Module Sources Tab
#                      Verify Default Values on Level and View Fields
#                      Verify Module Match on Default Values
#                       Module Single Select Contains Textbox
#                       Module Single Select Contains Dropdown Text
#                       Module Single Select Contains Dropdown Source
#                       Module Single Select Contains Specify
#                       Save Record
#
#Module Single Select - Does not contain
#     Launch IsoMetrix Application
#                          Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate To All Filters
#                           Add a New Record
#                           Navigate to All Filters Module Sources Tab
#                           Verify Default Values on Level and View Fields
#                           Verify Module Match on Default Values
#                           Module Single Select Does Not Contain Textbox
#                           Module Single Select Does Not Contain Dropdown Text
#                           Module Single Select Does Not Contain Dropdown Source
#                           Module Single Select Does Not Contain Specify
#                           Save Record
#Module Single Select - Between
#        Launch IsoMetrix Application
#                            Login with Valid Credentials
#                            Switch to Iframe
#                            Navigate to Sources
#                            Navigate To All Filters
#                            Add a New Record
#                            Navigate to All Filters Module Sources Tab
#                            Verify Default Values on Level and View Fields
#                            Verify Module Match on Default Values
#                            Module Single Select Between Textbox
#                            Module Single Select Between Dropdown Text
#                            Module Single Select Between Dropdown Source
#                            Module Single Select Between Specify
#                            Save Record
#Module Single Select - Less than
#        Launch IsoMetrix Application
#                             Login with Valid Credentials
#                             Switch to Iframe
#                             Navigate to Sources
#                             Navigate To All Filters
#                             Add a New Record
#                             Navigate to All Filters Module Sources Tab
#                             Verify Default Values on Level and View Fields
#                             Verify Module Match on Default Values
#                             Module Single Select Less than Textbox
#                             Module Single Select Less than Dropdown Text
#                             Module Single Select Less than Dropdown Source
#                             Module Single Select Less than Specify
#                             Save Record
#Module Single Select - Less than and equals to
#                                 Launch IsoMetrix Application
#                                 Login with Valid Credentials
#                                 Switch to Iframe
#                                 Navigate to Sources
#                                 Navigate To All Filters
#                                 Add a New Record
#                                 Navigate to All Filters Module Sources Tab
#                                 Verify Default Values on Level and View Fields
#                                 Verify Module Match on Default Values
#                                 Module Single Select Less than Textbox
#                                 Module Single Select Less than Dropdown Text
#                                 Module Single Select Less than Dropdown Source
#                                 Module Single Select Less than Specify
#                                 Save Record
#Module Single Select - Greater than
#                                  Launch IsoMetrix Application
#                                  Login with Valid Credentials
#                                  Switch to Iframe
#                                  Navigate to Sources
#                                  Navigate To All Filters
#                                  Add a New Record
#                                  Navigate to All Filters Module Sources Tab
#                                  Verify Default Values on Level and View Fields
#                                  Verify Module Match on Default Values
#                                 Module Single Select Greator Than Textbox
#                                 Module Single Select Greator Than Dropdown Text
#                                 Module Single Select Greator Than Dropdown Source
#                                 Module Single Select Greator Than Specify
#                                 Save Record
#Module Single Select Greater than and equals to
#                                   Launch IsoMetrix Application
#                                   Login with Valid Credentials
#                                   Switch to Iframe
#                                   Navigate to Sources
#                                   Navigate To All Filters
#                                   Add a New Record
#                                   Navigate to All Filters Module Sources Tab
#                                   Verify Default Values on Level and View Fields
#                                   Verify Module Match on Default Values
#                                   Module Single Select Greator Than and Equals To Textbox
#                                   Module Single Select Greator Than and Equals To Dropdown Text
#                                   Module Single Select Greator Than and Equals To Dropdown Source
#                                   Module Single Select Greator Than and Equals To Specify
#                                   Save Record
#
#Module Multi Select - Equals to
#                                    Launch IsoMetrix Application
#                                    Login with Valid Credentials
#                                    Switch to Iframe
#                                    Navigate to Sources
#                                    Navigate To All Filters
#                                    Add a New Record
#                                    Navigate to All Filters Module Sources Tab
#                                    Verify Default Values on Level and View Fields
#                                    Update Module Match on Dropdown Text and dropdown Source Default Values
#                                    Module Multi Select -Equals To Dropdown Text
#                                    Module Multi Select -Equals To Dropdown Source
#                                    Save Record
#
#Module Multi Select - Is not equals to
#                                    Launch IsoMetrix Application
#                                     Login with Valid Credentials
#                                     Switch to Iframe
#                                     Navigate to Sources
#                                     Navigate To All Filters
#                                     Add a New Record
#                                     Navigate to All Filters Module Sources Tab
#                                     Verify Default Values on Level and View Fields
#                                     Update Module Match on Dropdown Text and dropdown Source Default Values
#                                     Module Multi Select-Is Not Equals To Dropdown Text
#                                     Module Multi Select-Is Not Equals To Dropdown Source
#                                     Save Record
#Module Multi Select - Starts with
#                                      Launch IsoMetrix Application
#                                      Login with Valid Credentials
#                                      Switch to Iframe
#                                      Navigate to Sources
#                                      Navigate To All Filters
#                                      Add a New Record
#                                      Navigate to All Filters Module Sources Tab
#                                      Verify Default Values on Level and View Fields
#                                      Update Module Match on Dropdown Text and dropdown Source Default Values
#                                      Module Multi Select Starts With Dropdown Text
#                                      Module Multi Select Starts With Dropdown Source
#                                      Save Record
#Module Multi Select - Ends with
#                                       Launch IsoMetrix Application
#                                       Login with Valid Credentials
#                                       Switch to Iframe
#                                       Navigate to Sources
#                                       Navigate To All Filters
#                                       Add a New Record
#                                       Navigate to All Filters Module Sources Tab
#                                       Verify Default Values on Level and View Fields
#                                       Update Module Match on Dropdown Text and dropdown Source Default Values
#                                       Module Multi Select Ends With Dropdown Text
#                                       Module Multi Select Starts With Dropdown Source
#                                       Save Record
#Module Multi Select - Contains
#                                         Launch IsoMetrix Application
#                                         Login with Valid Credentials
#                                         Switch to Iframe
#                                         Navigate to Sources
#                                         Navigate To All Filters
#                                         Add a New Record
#                                         Navigate to All Filters Module Sources Tab
#                                         Verify Default Values on Level and View Fields
#                                         Update Module Match on Dropdown Text and dropdown Source Default Values
#                                         Module Multi Select Contains Dropdown Text
#                                         Module Multi Select Contains Dropdown Source
#                                         Save Record
#Module Multi Select - Does not contain
#                                           Launch IsoMetrix Application
#                                           Login with Valid Credentials
#                                           Switch to Iframe
#                                           Navigate to Sources
#                                           Navigate To All Filters
#                                           Add a New Record
#                                           Navigate to All Filters Module Sources Tab
#                                           Verify Default Values on Level and View Fields
#                                           Update Module Match on Dropdown Text and dropdown Source Default Values
#                                           Module Multi Select Does Not Contain Dropdown Text
#                                           Module Multi Select Does Not Contain Dropdown Source
#                                           Save Record