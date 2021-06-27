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
#Does not contain - User Defined Textarea
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters Instance Based
#            Add a New Record
#            Navigate To Sub Module tab
#            Verify Default Values on Level and View Fields
#            Verify Default Values on User Defined
#            Verify Default Values on Module
#            Verify Default Values in System
#            Save Record
#            Add New Sub Filters Module
#            Sub Module Does Not Contain Textarea System
#            Save Record
#
#Does not contain - Module Textarea
#  Launch IsoMetrix Application
#              Login with Valid Credentials
#              Switch to Iframe
#              Navigate to Sources
#              Navigate To All Filters Instance Based
#              Add a New Record
#              Navigate To Sub Module tab
#              Verify Default Values on Level and View Fields
#              Verify Default Values on User Defined
#              Verify Default Values on Module
#              Verify Default Values in System
#              Save Record
#              Add New Sub Filters Module
#             Sub Module Does Not Contain Textarea Module
#             Save Record
#
#Does not contain - System Textarea
#   Launch IsoMetrix Application
#               Login with Valid Credentials
#               Switch to Iframe
#               Navigate to Sources
#               Navigate To All Filters Instance Based
#               Add a New Record
#               Navigate To Sub Module tab
#               Verify Default Values on Level and View Fields
#               Verify Default Values on User Defined
#               Verify Default Values on Module
#               Verify Default Values in System
#               Save Record
#               Add New Sub Filters Module
#               Sub Module Does Not Contain Textarea System
#               Save Record
#
#Equals To Textbox User Defined
#    Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate To All Filters Instance Based
#                   Add a New Record
#                   Navigate To Sub Module tab
#                   Verify Default Values on Level and View Fields
#                   Verify Default Values on User Defined
#                   Verify Default Values on Module
#                   Verify Default Values in System
#                   Save Record
#                   Add New Sub Filters Module
#                   Sub Module Equals To User Defined Textbox
#                   Save Record
#
#Equals To Textbox Module
#  Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate To All Filters Instance Based
#                   Add a New Record
#                   Navigate To Sub Module tab
#                   Verify Default Values on Level and View Fields
#                   Verify Default Values on User Defined
#                   Verify Default Values on Module
#                   Verify Default Values in System
#                   Save Record
#                   Add New Sub Filters Module
#                   Sub Module Equals To Module Textbox
#                   Save Record
#
#Equals To Textbox System
#  Launch IsoMetrix Application
#                    Login with Valid Credentials
#                    Switch to Iframe
#                    Navigate to Sources
#                    Navigate To All Filters Instance Based
#                    Add a New Record
#                    Navigate To Sub Module tab
#                    Verify Default Values on Level and View Fields
#                    Verify Default Values on User Defined
#                    Verify Default Values on Module
#                    Verify Default Values in System
#                    Save Record
#                    Add New Sub Filters Module
#                    Sub Module Equals To System Textbox
#                    Save Record
#
#Equals To Textarea User Defined
#  Launch IsoMetrix Application
#                     Login with Valid Credentials
#                     Switch to Iframe
#                     Navigate to Sources
#                     Navigate To All Filters Instance Based
#                     Add a New Record
#                     Navigate To Sub Module tab
#                     Verify Default Values on Level and View Fields
#                     Verify Default Values on User Defined
#                     Verify Default Values on Module
#                     Verify Default Values in System
#                     Save Record
#                     Add New Sub Filters Module
#       Sub Module Equals To User Defined TextArea
#     Save Record
#Equals To Textarea Module
#   Launch IsoMetrix Application
#                     Login with Valid Credentials
#                     Switch to Iframe
#                     Navigate to Sources
#                     Navigate To All Filters Instance Based
#                     Add a New Record
#                     Navigate To Sub Module tab
#                     Verify Default Values on Level and View Fields
#                     Verify Default Values on User Defined
#                     Verify Default Values on Module
#                     Verify Default Values in System
#                     Save Record
#                     Add New Sub Filters Module
#  Sub Module Equals To Module TextArea
#     Save Record
#
#Equals To Textarea System
#   Launch IsoMetrix Application
#                       Login with Valid Credentials
#                       Switch to Iframe
#                       Navigate to Sources
#                       Navigate To All Filters Instance Based
#                       Add a New Record
#                       Navigate To Sub Module tab
#                       Verify Default Values on Level and View Fields
#                       Verify Default Values on User Defined
#                       Verify Default Values on Module
#                       Verify Default Values in System
#                       Save Record
#                       Add New Sub Filters Module
#                       Sub Module Equals To System TextArea
#                        Save Record
#Equals To Numeric User Defined
#                       Launch IsoMetrix Application
#                         Login with Valid Credentials
#                         Switch to Iframe
#                         Navigate to Sources
#                         Navigate To All Filters Instance Based
#                         Add a New Record
#                         Navigate To Sub Module tab
#                         Verify Default Values on Level and View Fields
#                         Verify Default Values on User Defined
#                         Verify Default Values on Module
#                         Verify Default Values in System
#                         Save Record
#                         Add New Sub Filters Module
#                         Sub Module Equals To Numeric User Defined
#                         Save Record
#Equals To Numeric Module
#                         Launch IsoMetrix Application
#                          Login with Valid Credentials
#                          Switch to Iframe
#                          Navigate to Sources
#                          Navigate To All Filters Instance Based
#                          Add a New Record
#                          Navigate To Sub Module tab
#                          Verify Default Values on Level and View Fields
#                          Verify Default Values on User Defined
#                          Verify Default Values on Module
#                          Verify Default Values in System
#                          Save Record
#                          Add New Sub Filters Module
#                          Sub Module Equals To Numeric Module
#                           Save Record
#Equals To Numeric System
#                        Launch IsoMetrix Application
#                         Login with Valid Credentials
#                         Switch to Iframe
#                         Navigate to Sources
#                         Navigate To All Filters Instance Based
#                         Add a New Record
#                         Navigate To Sub Module tab
#                         Verify Default Values on Level and View Fields
#                         Verify Default Values on User Defined
#                         Verify Default Values on Module
#                         Verify Default Values in System
#                         Save Record
#                         Add New Sub Filters Module
#                         Sub Module Equals To Numeric System
#                          Save Record
#
#Is Not Equals To Textbox User Defined
#                       Launch IsoMetrix Application
#                           Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate To All Filters Instance Based
#                           Add a New Record
#                           Navigate To Sub Module tab
#                           Verify Default Values on Level and View Fields
#                           Verify Default Values on User Defined
#                           Verify Default Values on Module
#                           Verify Default Values in System
#                           Save Record
#                           Add New Sub Filters Module
#                           Is Not Equals To Textbox User Defined
#                            Save Record
#Is Not Equals To Textbox Module
#                        Launch IsoMetrix Application
#                            Login with Valid Credentials
#                            Switch to Iframe
#                            Navigate to Sources
#                            Navigate To All Filters Instance Based
#                            Add a New Record
#                            Navigate To Sub Module tab
#                            Verify Default Values on Level and View Fields
#                            Verify Default Values on User Defined
#                            Verify Default Values on Module
#                            Verify Default Values in System
#                            Save Record
#                            Add New Sub Filters Module
#                            Is Not Equals To Textbox Module
#                             Save Record
#Is Not Equals To Textbox System
#                       Launch IsoMetrix Application
#                           Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate To All Filters Instance Based
#                           Add a New Record
#                           Navigate To Sub Module tab
#                           Verify Default Values on Level and View Fields
#                           Verify Default Values on User Defined
#                           Verify Default Values on Module
#                           Verify Default Values in System
#                           Save Record
#                           Add New Sub Filters Module
#                           Is Not Equals To Textbox System
#                            Save Record
#
#Contains Textbox User Defined
#                           Launch IsoMetrix Application
#                               Login with Valid Credentials
#                               Switch to Iframe
#                               Navigate to Sources
#                               Navigate To All Filters Instance Based
#                               Add a New Record
#                               Navigate To Sub Module tab
#                               Verify Default Values on Level and View Fields
#                               Verify Default Values on User Defined
#                               Verify Default Values on Module
#                               Verify Default Values in System
#                               Save Record
#                               Add New Sub Filters Module
#                               Contains Textbox User Defined
#                                Save Record
#Contains Textbox Module
#             Launch IsoMetrix Application
#                                           Login with Valid Credentials
#                                           Switch to Iframe
#                                           Navigate to Sources
#                                           Navigate To All Filters Instance Based
#                                           Add a New Record
#                                           Navigate To Sub Module tab
#                                           Verify Default Values on Level and View Fields
#                                           Verify Default Values on User Defined
#                                           Verify Default Values on Module
#                                           Verify Default Values in System
#                                           Save Record
#                                           Add New Sub Filters Module
#                                           Contains Textbox Module
#                                            Save Record
#Contains Textbox System
#                                               Launch IsoMetrix Application
#                                                Login with Valid Credentials
#                                                Switch to Iframe
#                                                Navigate to Sources
#                                                Navigate To All Filters Instance Based
#                                                Add a New Record
#                                                Navigate To Sub Module tab
#                                                Verify Default Values on Level and View Fields
#                                                Verify Default Values on User Defined
#                                                Verify Default Values on Module
#                                                Verify Default Values in System
#                                                Save Record
#                                                Add New Sub Filters Module
#                                                Contains Textbox System
#                                                 Save Record
#Contains Textarea User Defined
#   Launch IsoMetrix Application
#                                                 Login with Valid Credentials
#                                                 Switch to Iframe
#                                                 Navigate to Sources
#                                                 Navigate To All Filters Instance Based
#                                                 Add a New Record
#                                                 Navigate To Sub Module tab
#                                                 Verify Default Values on Level and View Fields
#                                                 Verify Default Values on User Defined
#                                                 Verify Default Values on Module
#                                                 Verify Default Values in System
#                                                 Save Record
#                                                 Add New Sub Filters Module
#                                                 Contains Textarea User Defined
#                                                  Save Record
#Contains Textarea Module
#                                             Launch IsoMetrix Application
#                                                    Login with Valid Credentials
#                                                    Switch to Iframe
#                                                    Navigate to Sources
#                                                    Navigate To All Filters Instance Based
#                                                    Add a New Record
#                                                    Navigate To Sub Module tab
#                                                    Verify Default Values on Level and View Fields
#                                                    Verify Default Values on User Defined
#                                                    Verify Default Values on Module
#                                                    Verify Default Values in System
#                                                    Save Record
#                                                    Add New Sub Filters Module
#                                                    Contains Textarea Module
#                                                     Save Record
#Contains Textarea System
#
#                                             Launch IsoMetrix Application
#                                                       Login with Valid Credentials
#                                                       Switch to Iframe
#                                                       Navigate to Sources
#                                                       Navigate To All Filters Instance Based
#                                                       Add a New Record
#                                                       Navigate To Sub Module tab
#                                                       Verify Default Values on Level and View Fields
#                                                       Verify Default Values on User Defined
#                                                       Verify Default Values on Module
#                                                       Verify Default Values in System
#                                                       Save Record
#                                                       Add New Sub Filters Module
#                                                       Contains Textarea System
#                                                        Save Record
#Contains Numeric User Defined
#                                               Launch IsoMetrix Application
#                                                            Login with Valid Credentials
#                                                            Switch to Iframe
#                                                            Navigate to Sources
#                                                            Navigate To All Filters Instance Based
#                                                            Add a New Record
#                                                            Navigate To Sub Module tab
#                                                            Verify Default Values on Level and View Fields
#                                                            Verify Default Values on User Defined
#                                                            Verify Default Values on Module
#                                                            Verify Default Values in System
#                                                            Save Record
#                                                            Add New Sub Filters Module
#                                                            Contains Numeric User Defined
#                                                             Save Record
#Contains Numeric Module
#            Launch IsoMetrix Application
#                                                                  Login with Valid Credentials
#                                                                  Switch to Iframe
#                                                                  Navigate to Sources
#                                                                  Navigate To All Filters Instance Based
#                                                                  Add a New Record
#                                                                  Navigate To Sub Module tab
#                                                                  Verify Default Values on Level and View Fields
#                                                                  Verify Default Values on User Defined
#                                                                  Verify Default Values on Module
#                                                                  Verify Default Values in System
#                                                                  Save Record
#                                                                  Add New Sub Filters Module
#                                                                  Contains Numeric Module
#                                                                   Save Record
#Contains Numeric System
#                                                          Launch IsoMetrix Application
#                                                                     Login with Valid Credentials
#                                                                     Switch to Iframe
#                                                                     Navigate to Sources
#                                                                     Navigate To All Filters Instance Based
#                                                                     Add a New Record
#                                                                     Navigate To Sub Module tab
#                                                                     Verify Default Values on Level and View Fields
#                                                                     Verify Default Values on User Defined
#                                                                     Verify Default Values on Module
#                                                                     Verify Default Values in System
#                                                                     Save Record
#                                                                     Add New Sub Filters Module
#                                                                     Contains Numeric System
#                                                                      Save Record
#Does Not Contain Textbox User Defined
#                                                                       Launch IsoMetrix Application
#                                                                          Login with Valid Credentials
#                                                                          Switch to Iframe
#                                                                          Navigate to Sources
#                                                                          Navigate To All Filters Instance Based
#                                                                          Add a New Record
#                                                                          Navigate To Sub Module tab
#                                                                          Verify Default Values on Level and View Fields
#                                                                          Verify Default Values on User Defined
#                                                                          Verify Default Values on Module
#                                                                          Verify Default Values in System
#                                                                          Save Record
#                                                                          Add New Sub Filters Module
#                                                                          Does Not Contain Textbox User Defined
#                                                                           Save Record
#Does Not Contain Textbox Module
#                                                    Launch IsoMetrix Application
#                                                                             Login with Valid Credentials
#                                                                             Switch to Iframe
#                                                                             Navigate to Sources
#                                                                             Navigate To All Filters Instance Based
#                                                                             Add a New Record
#                                                                             Navigate To Sub Module tab
#                                                                             Verify Default Values on Level and View Fields
#                                                                             Verify Default Values on User Defined
#                                                                             Verify Default Values on Module
#                                                                             Verify Default Values in System
#                                                                             Save Record
#                                                                             Add New Sub Filters Module
#                                                                             Does Not Contain Textbox Module
#                                                                              Save Record
#Does Not Contain Textbox System
#                                                                             Launch IsoMetrix Application
#                                                                                             Login with Valid Credentials
#                                                                                             Switch to Iframe
#                                                                                             Navigate to Sources
#                                                                                             Navigate To All Filters Instance Based
#                                                                                             Add a New Record
#                                                                                             Navigate To Sub Module tab
#                                                                                             Verify Default Values on Level and View Fields
#                                                                                             Verify Default Values on User Defined
#                                                                                             Verify Default Values on Module
#                                                                                             Verify Default Values in System
#                                                                                             Save Record
#                                                                                             Add New Sub Filters Module
#                                                                                             Does Not Contain Textbox System
#                                                                                              Save Record
#Does Not Contain Numeric User Defined
#                                                                              Launch IsoMetrix Application
#                                                                                                   Login with Valid Credentials
#                                                                                                   Switch to Iframe
#                                                                                                   Navigate to Sources
#                                                                                                   Navigate To All Filters Instance Based
#                                                                                                   Add a New Record
#                                                                                                   Navigate To Sub Module tab
#                                                                                                   Verify Default Values on Level and View Fields
#                                                                                                   Verify Default Values on User Defined
#                                                                                                   Verify Default Values on Module
#                                                                                                   Verify Default Values in System
#                                                                                                   Save Record
#                                                                                                   Add New Sub Filters Module
#                                                                                                   Does Not Contain Numeric User Defined
#                                                                                                    Save Record
#Does Not Contain Numeric Module
#          Launch IsoMetrix Application
#                                                                                                    Login with Valid Credentials
#                                                                                                    Switch to Iframe
#                                                                                                    Navigate to Sources
#                                                                                                    Navigate To All Filters Instance Based
#                                                                                                    Add a New Record
#                                                                                                    Navigate To Sub Module tab
#                                                                                                    Verify Default Values on Level and View Fields
#                                                                                                    Verify Default Values on User Defined
#                                                                                                    Verify Default Values on Module
#                                                                                                    Verify Default Values in System
#                                                                                                    Save Record
#                                                                                                    Add New Sub Filters Module
#                                                                                                   Does Not Contain Numeric Module
#                                                                                                     Save Record
#Does Not Contain Numeric System
#    Launch IsoMetrix Application
#                                                                                                     Login with Valid Credentials
#                                                                                                     Switch to Iframe
#                                                                                                     Navigate to Sources
#                                                                                                     Navigate To All Filters Instance Based
#                                                                                                     Add a New Record
#                                                                                                     Navigate To Sub Module tab
#                                                                                                     Verify Default Values on Level and View Fields
#                                                                                                     Verify Default Values on User Defined
#                                                                                                     Verify Default Values on Module
#                                                                                                     Verify Default Values in System
#                                                                                                     Save Record
#                                                                                                     Add New Sub Filters Module
#                                                                                                    Does Not Contain Numeric System
#                                                                                                      Save Record
#
