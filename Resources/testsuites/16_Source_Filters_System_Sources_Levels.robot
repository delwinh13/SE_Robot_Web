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
#System Source Level Single Select - Equals to
#
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters
#            Add a New Record
#            Navigate to All Filters System
#            Verify Default Values on Level and View Fields
#            Verify System Match on Default Values
#           System Single Select Equals To Textbox
#           System Single Select Equals To Dropdown Text
#           System Single Select Equals To Dropdown Source
#           System Single Select Equals To Specify
#           Save Record
#System Source Level Single Select - Is not equals to
#             Launch IsoMetrix Application
#             Login with Valid Credentials
#             Switch to Iframe
#             Navigate to Sources
#             Navigate To All Filters
#             Add a New Record
#             Navigate to All Filters System
#             Verify Default Values on Level and View Fields
#             Verify System Match on Default Values
#             System Single Select Is Not Equals To Textbox
#             System Single Select Is Not Equals To Dropdown Text
#             System Single Select Is Not Equals To Dropdown Source
#             Module Single Select Is Not Equals To Specify
#             Save Record
#
#System Source Level Single Select - Starts with
#              Launch IsoMetrix Application
#              Login with Valid Credentials
#              Switch to Iframe
#              Navigate to Sources
#              Navigate To All Filters
#              Add a New Record
#              Navigate to All Filters System
#              Verify Default Values on Level and View Fields
#              Verify System Match on Default Values
#              System Single Select Starts With Textbox
#              System Single Select Starts With Dropdown Text
#              System Single Select Starts With Dropdown Source
#              System Single Select Starts With Specify
#              Save Record
#System Source Level Single Select - Ends with
#               Launch IsoMetrix Application
#               Login with Valid Credentials
#               Switch to Iframe
#               Navigate to Sources
#               Navigate To All Filters
#               Add a New Record
#               Navigate to All Filters System
#               Verify Default Values on Level and View Fields
#               Verify System Match on Default Values
#              System Single Select Ends With Textbox
#              System Single Select Ends With Dropdown Text
#              System Single Select Ends With Dropdown Source
#              System Single Select Ends With Specify
#              Save Record
#
#System Source Level Single Select - Contains
#                Launch IsoMetrix Application
#                Login with Valid Credentials
#                Switch to Iframe
#                Navigate to Sources
#                Navigate To All Filters
#                Add a New Record
#                Navigate to All Filters System
#                Verify Default Values on Level and View Fields
#                Verify System Match on Default Values
#                System Single Select Contains Textbox
#                System Single Select Contains Dropdown Text
#                System Single Select Contains Dropdown Source
#                System Single Select Contains Specify
#                Save Record
#
#System Source Level Single Select - Does not contain
#                  Launch IsoMetrix Application
#                  Login with Valid Credentials
#                  Switch to Iframe
#                  Navigate to Sources
#                  Navigate To All Filters
#                  Add a New Record
#                  Navigate to All Filters System
#                  Verify Default Values on Level and View Fields
#                  Verify System Match on Default Values
#                  System Single Select Does Not Contain Textbox
#                  System Single Select Does Not Contain Dropdown Text
#                  System Single Select Does Not Contain Dropdown Source
#                  System Single Select Does Not Contain Specify
#                  Save Record
#
#System Source Level Multi Select - Equals to
#                   Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate To All Filters
#                   Add a New Record
#                   Navigate to All Filters System
#                   Verify Default Values on Level and View Fields
#                  Update System Levels Match on values
#                   System Multi Select -Equals To Dropdown Text
#                   System Multi Select -Equals To Dropdown Source
#                   Save Record
#
#System Source Level Multi Select - Is not equals to
#                     Launch IsoMetrix Application
#                     Login with Valid Credentials
#                     Switch to Iframe
#                     Navigate to Sources
#                     Navigate To All Filters
#                     Add a New Record
#                     Navigate to All Filters System
#                     Verify Default Values on Level and View Fields
#                     Update System Levels Match on values
#                     System Multi Select-Is Not Equals To Dropdown Text
#                     System Multi Select-Is Not Equals To Dropdown Source
#                     Save Record
#
#System Source Level Multi Select - Starts with
#                      Launch IsoMetrix Application
#                      Login with Valid Credentials
#                      Switch to Iframe
#                      Navigate to Sources
#                      Navigate To All Filters
#                      Add a New Record
#                      Navigate to All Filters System
#                      Verify Default Values on Level and View Fields
#                      Update System Levels Match on values
#                      System Multi Select Starts With Dropdown Text
#                      System Multi Select Starts With Dropdown Source
#                      Save Record
#
#System Source Level Multi Select - Ends with
#                        Launch IsoMetrix Application
#                        Login with Valid Credentials
#                        Switch to Iframe
#                        Navigate to Sources
#                        Navigate To All Filters
#                        Add a New Record
#                        Navigate to All Filters System
#                        Verify Default Values on Level and View Fields
#                        Update System Levels Match on values
#                        System Multi Select Ends With Dropdown Text
#                        System Multi Select Ends With Dropdown Source
#                        Save Records
#System Source Level Multi Select - Contains
#                           Launch IsoMetrix Application
#                           Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate To All Filters
#                           Add a New Record
#                           Navigate to All Filters System
#                           Verify Default Values on Level and View Fields
#                           Update System Levels Match on values
#                           System Multi Select Contains Dropdown Text
#                           System Multi Select Contains Dropdown Source
#                           Save Record
#
#System Source Level Multi Select - Does not contain
#                             Launch IsoMetrix Application
#                             Login with Valid Credentials
#                             Switch to Iframe
#                             Navigate to Sources
#                             Navigate To All Filters
#                             Add a New Record
#                             Navigate to All Filters System
#                             Verify Default Values on Level and View Fields
#                             Update System Levels Match on values
#                             System Multi Select Does Not Contain Dropdown Text
#                             System Multi Select Does Not Contain Dropdown Source
#                             Save Record
