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
#Single Select - Equals to
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters
#            Add a New Record
#            Verify Default Values on Level and View Fields
#           Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#           Single Select Equals To Textbox
#           Single Select Equals To Dropdown Text
#           Single Select Equals To Dropdown Source
#           Single Select Equals To Specify
#           Save Record
#
#Single Select - Is not equals to
#                        Launch IsoMetrix Application
#                         Login with Valid Credentials
#                         Switch to Iframe
#                         Navigate to Sources
#                         Navigate To All Filters
#                         Add a New Record
#                         Verify Default Values on Level and View Fields
#                        Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                        Single Select Is Not Equals To Textbox
#                        Single Select Is Not Equals To Dropdown Text
#                        Single Select Is Not Equals To Dropdown Source
#                        Single Select Is Not Equals To Specify
#                        Save Record
#
#Single Select - Starts with
#                        Launch IsoMetrix Application
#                         Login with Valid Credentials
#                         Switch to Iframe
#                         Navigate to Sources
#                         Navigate To All Filters
#                         Add a New Record
#                         Verify Default Values on Level and View Fields
#                        Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                        Single Select Starts With Textbox
#                        Single Select Starts With Dropdown Text
#                        Single Select Starts With Dropdown Source
#                        Single Select Starts With Specify
#                         Save Record
#Single Select - Ends with
#                             Launch IsoMetrix Application
#                             Login with Valid Credentials
#                             Switch to Iframe
#                             Navigate to Sources
#                             Navigate To All Filters
#                             Add a New Record
#                             Verify Default Values on Level and View Fields
#                            Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                            Single Select Ends With Textbox
#                            Single Select Ends With Dropdown Text
#                            Single Select Ends With Dropdown Source
#                            Single Select Ends With Specify
#                            Save Record
#Between
#                                Launch IsoMetrix Application
#                                 Login with Valid Credentials
#                                 Switch to Iframe
#                                 Navigate to Sources
#                                 Navigate To All Filters
#                                 Add a New Record
#                                 Verify Default Values on Level and View Fields
#                                Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                                Single Select Between Textbox
#                                Single Select Between Dropdown Text
#                                Single Select Between Dropdown Source
#                                Single Select Between Specify
#                                Save Record
#Single Select - Contains
#                                   Launch IsoMetrix Application
#                                    Login with Valid Credentials
#                                    Switch to Iframe
#                                    Navigate to Sources
#                                    Navigate To All Filters
#                                    Add a New Record
#                                    Verify Default Values on Level and View Fields
#                                   Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                                   Single Select Contains Textbox
#                                   Single Select Contains Dropdown Text
#                                   Single Select Contains Dropdown Source
#                                   Single Select Contains Specify
#                                    Save Record
#Less than
#                       Launch IsoMetrix Application
#                       Login with Valid Credentials
#                       Switch to Iframe
#                       Navigate to Sources
#                       Navigate To All Filters
#                       Add a New Record
#                      Verify Default Values on Level and View Fields
#                      Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                       Single Select Less than Textbox
#                       Single Select Less than Dropdown Text
#                       Single Select Less than Dropdown Source
#                       Single Select Less than Specify
#                       Save Record
#
#Single Select - Does not contain
#                       Launch IsoMetrix Application
#                       Login with Valid Credentials
#                       Switch to Iframe
#                       Navigate to Sources
#                       Navigate To All Filters
#                       Add a New Record
#                      Verify Default Values on Level and View Fields
#                      Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                       Single Select Between Textbox
#                      Single Select Between Dropdown Text
#                    Single Select Between Dropdown Source
#                    Single Select Between Specify
#                     Save Record
#Greater than
#                            Launch IsoMetrix Application
#                           Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate To All Filters
#                           Add a New Record
#                          Verify Default Values on Level and View Fields
#                          Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                          Single Select Greator Than Textbox
#                          Single Select Greator Than Dropdown Text
#                          Single Select Greator Than Dropdown Source
#                          Single Select Greator Than Specify
#                          Save Record
#
#
#Greater than and equals to
#     Launch IsoMetrix Application
#                         Login with Valid Credentials
#                         Switch to Iframe
#                         Navigate to Sources
#                         Navigate To All Filters
#                         Add a New Record
#                        Verify Default Values on Level and View Fields
#                        Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                       Single Select Greator Than and Equals To Textbox
#                       Single Select Greator Than and Equals To Dropdown Text
#                       Single Select Greator Than and Equals To Dropdown Source
#                       Single Select Greator Than and Equals To Specify
#                        Save Record
#Less than and equals to
#                            Launch IsoMetrix Application
#                             Login with Valid Credentials
#                             Switch to Iframe
#                             Navigate to Sources
#                             Navigate To All Filters
#                             Add a New Record
#                              Verify Default Values on Level and View Fields
#                              Verify Default Values on Match on Textbox,Dropdown Textbox,Dropdown Source,Specify
#                              Single Select Less Than and Equals To Textbox
#                              Single Select Less Than and Equals To Dropdown Text
#                              Single Select Less Than and Equals To Dropdown Source
#                              Single Select Less Than and Equals To Specify
#                              Save Record
#Multi Select - Equals to
#                              Launch IsoMetrix Application
#                              Login with Valid Credentials
#                              Switch to Iframe
#                              Navigate to Sources
#                              Navigate To All Filters
#                              Add a New Record
#                               Verify Default Values on Level and View Fields
#                            Update User Defined Multi Select-Update match on fields
#                            User Defined Multi Select -Equals To Dropdown Text
#                            User Defined Multi Select -Equals To Dropdown Source
#                            Save Record
#Multi Select - Is not Equals to
#                                Launch IsoMetrix Application
#                                Login with Valid Credentials
#                                Switch to Iframe
#                                Navigate to Sources
#                                Navigate To All Filters
#                                Add a New Record
#                                 Verify Default Values on Level and View Fields
#                              Update User Defined Multi Select-Update match on fields
#                              User Defined Multi-Select Is Not Equals To Dropdown Text
#                              User Defined Multi Select-Is Not Equals To Dropdown Source
#                              Save Record
#Multi Select - Starts with
#                                   Launch IsoMetrix Application
#                                    Login with Valid Credentials
#                                    Switch to Iframe
#                                    Navigate to Sources
#                                    Navigate To All Filters
#                                    Add a New Record
#                                     Verify Default Values on Level and View Fields
#                                  Update User Defined Multi Select-Update match on fields
#                                  User Defined Multi Select Starts With Dropdown Text
#                                  User Defined Multi Select Starts With Dropdown Source
#                                  Save Record
#
#Multi Select - Ends With
#                                      Launch IsoMetrix Application
#                                      Login with Valid Credentials
#                                      Switch to Iframe
#                                      Navigate to Sources
#                                      Navigate To All Filters
#                                      Add a New Record
#                                       Verify Default Values on Level and View Fields
#                                    Update User Defined Multi Select-Update match on fields
#                                    User Defined Multi Select Ends With Dropdown Text
#                                    User Defined Multi Select Ends With Dropdown Source
#                                     Save Record
#
#Multi Select - Contains
#                                            Launch IsoMetrix Application
#                                            Login with Valid Credentials
#                                            Switch to Iframe
#                                            Navigate to Sources
#                                            Navigate To All Filters
#                                            Add a New Record
#                                             Verify Default Values on Level and View Fields
#                                          Update User Defined Multi Select-Update match on fields
#                                           User Defined Multi Select Contains Dropdown Text
#                                           User Defined Multi Select Contains Dropdown Source
#                                           Save Record
#Multi Select - Does not contain
#                                             Launch IsoMetrix Application
#                                             Login with Valid Credentials
#                                             Switch to Iframe
#                                             Navigate to Sources
#                                             Navigate To All Filters
#                                             Add a New Record
#                                              Verify Default Values on Level and View Fields
#                                           Update User Defined Multi Select-Update match on fields
#                                           User Defined Multi Select Does Not Contain Dropdown Text
#                                            User Defined Multi Select Does Not Contain Dropdown Source
#                                            Save Record