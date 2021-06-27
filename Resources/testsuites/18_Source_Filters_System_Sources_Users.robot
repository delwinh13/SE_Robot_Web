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
#System Users Single Select - Equals to
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters
#            Add a New Record
#            Navigate to All Filters System
#            Verify Default Values on Level and View Fields
#            Verify System User Match on Values
#            System User Single Select Equals To Textbox
#            System User Single Select Equals To Dropdown Text
#            System User Single Select Equals To Dropdown Source
#            System User Single Select Equals To Specify
#           Save Record
#
#Single Select - Is not equal to
#              Launch IsoMetrix Application
#              Login with Valid Credentials
#              Switch to Iframe
#              Navigate to Sources
#              Navigate To All Filters
#              Add a New Record
#              Navigate to All Filters System
#              Verify Default Values on Level and View Fields
#              Verify System User Match on Values
#              System User Single Select Is Not Equals To Textbox
#              System User Single Select Is Not Equals To Dropdown Text
#              System User Single Select Is Not Equals To Dropdown Source
#              System User Single Select Is Not Equals To Specify
#              Save Record
#Single Select - Starts with
#             Launch IsoMetrix Application
#             Login with Valid Credentials
#             Switch to Iframe
#             Navigate to Sources
#             Navigate To All Filters
#             Add a New Record
#             Navigate to All Filters System
#             Verify Default Values on Level and View Fields
#             Verify System User Match on Values
#             System User Single Select Starts With Textbox
#             System User Single Select Starts With Dropdown Text
#             System User Single Select Starts With Dropdown Source
#             System User Single Select Starts With Specify
#             Save Record
#
#Single Select - End with
#              Launch IsoMetrix Application
#              Login with Valid Credentials
#              Switch to Iframe
#              Navigate to Sources
#              Navigate To All Filters
#              Add a New Record
#              Navigate to All Filters System
#              Verify Default Values on Level and View Fields
#              Verify System User Match on Values
#              System User Single Select Ends With Textbox
#              System User Single Select Ends With Dropdown Text
#              System User Single Select Ends With Dropdown Source
#              System User Single Select Ends With Specify
#              Save Record
#
#Single Select - Contains
#               Launch IsoMetrix Application
#               Login with Valid Credentials
#               Switch to Iframe
#               Navigate to Sources
#               Navigate To All Filters
#               Add a New Record
#               Navigate to All Filters System
#               Verify Default Values on Level and View Fields
#               Verify System User Match on Values
#               System User Single Select Contains Textbox
#               System User Single Select Contains Dropdown Text
#               System User Single Select Contains Dropdown Source
#               System User Single Select Contains Specify
#               Save Record
#
#Single Select - Does not contain
#                Launch IsoMetrix Application
#                Login with Valid Credentials
#                Switch to Iframe
#                Navigate to Sources
#                Navigate To All Filters
#                Add a New Record
#                Navigate to All Filters System
#                Verify Default Values on Level and View Fields
#                Verify System User Match on Values
#                System Users Single Select Does Not Contain Textbox
#                System Users Single Select Does Not Contain Dropdown Text
#                System Users Single Select Does Not Contain Dropdown Source
#                System Users Single Select Does Not Contain Specify
#                Save Record
#
#Multi Select - Equals to
#                 Launch IsoMetrix Application
#                 Login with Valid Credentials
#                 Switch to Iframe
#                 Navigate to Sources
#                 Navigate To All Filters
#                 Add a New Record
#                 Navigate to All Filters System
#                 Verify Default Values on Level and View Fields
#                 Update System User Match Default Values
#                 System Users Multi Select -Equals To Dropdown Text
#                 System Users Multi Select -Equals To Dropdown Source
#                 Save Record
#Multi Select - Is not equals to
#                  Launch IsoMetrix Application
#                  Login with Valid Credentials
#                  Switch to Iframe
#                  Navigate to Sources
#                  Navigate To All Filters
#                  Add a New Record
#                  Navigate to All Filters System
#                  Verify Default Values on Level and View Fields
#                  Update System User Match Default Values
#                  System Users Multi Select-Is Not Equals To Dropdown Text
#                  System Users Multi Select-Is Not Equals To Dropdown Source
#                  Save Record
#Multi Select - Starts with
#                    Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate To All Filters
#                   Add a New Record
#                   Navigate to All Filters System
#                   Verify Default Values on Level and View Fields
#                   Update System User Match Default Values
#                   System User Multi Select Starts With Dropdown Text
#                   System User Multi Select Starts With Dropdown Source
#                   Save Record
#Multi Select - Ends with
#                     Launch IsoMetrix Application
#                     Login with Valid Credentials
#                     Switch to Iframe
#                     Navigate to Sources
#                     Navigate To All Filters
#                     Add a New Record
#                     Navigate to All Filters System
#                     Verify Default Values on Level and View Fields
#                     Update System User Match Default Values
#                     System User Multi Select Ends With Dropdown Text
#                     System User Multi Select Ends With Dropdown Source
#                     Save Record
#Multi Select - Contains
#                      Launch IsoMetrix Application
#                      Login with Valid Credentials
#                      Switch to Iframe
#                      Navigate to Sources
#                      Navigate To All Filters
#                      Add a New Record
#                      Navigate to All Filters System
#                      Verify Default Values on Level and View Fields
#                      Update System User Match Default Values
#                      System User Multi Select Contains Dropdown Text
#                      System User Multi Select Contains Dropdown Source
#                      Save Record
#Multi Select - Does not contain
#                       Launch IsoMetrix Application
#                       Login with Valid Credentials
#                       Switch to Iframe
#                       Navigate to Sources
#                       Navigate To All Filters
#                       Add a New Record
#                       Navigate to All Filters System
#                       Verify Default Values on Level and View Fields
#                       Update System User Match Default Values
#                       System Users Multi Select Does Not Contain Dropdown Text
#                       System Users Multi Select Does Not Contain Dropdown Source
#                       Save Record
