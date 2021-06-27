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
#Module Filters Single Select - Equals to (Instance)
#            Launch IsoMetrix Application
#            Login with Valid Credentials
#            Switch to Iframe
#            Navigate to Sources
#            Navigate To All Filters Instance Based
#            Add a New Record
#            Navigate to Module Filter Tab
#            Verify Default Values on Level and View Fields
#            Module Filters Verify Deafault Values on Match on(Instance Based)
#            Module Filters Single Select - Equals to (Instance)
#
#Module Filter Single Select - Is not equals to (Instance)
#                  Launch IsoMetrix Application
#                Login with Valid Credentials
#                Switch to Iframe
#                Navigate to Sources
#                Navigate To All Filters Instance Based
#                Add a New Record
#                Navigate to Module Filter Tab
#                Verify Default Values on Level and View Fields
#                Module Filters Verify Deafault Values on Match on(Instance Based)
#                Module Filter Single Select - Is not equals to (Instance)
#
#Module Filters Single Select - Starts with (Instance)
#                   Launch IsoMetrix Application
#                   Login with Valid Credentials
#                   Switch to Iframe
#                   Navigate to Sources
#                   Navigate To All Filters Instance Based
#                   Add a New Record
#                   Navigate to Module Filter Tab
#                   Verify Default Values on Level and View Fields
#                   Module Filters Verify Deafault Values on Match on(Instance Based)
#                   Module Filters Single Select - Starts with (Instance)
#
#Module Filters Single Select - Ends with (Instance)
#                         Launch IsoMetrix Application
#                         Login with Valid Credentials
#                         Switch to Iframe
#                         Navigate to Sources
#                         Navigate To All Filters Instance Based
#                         Add a New Record
#                         Navigate to Module Filter Tab
#                         Verify Default Values on Level and View Fields
#                         Module Filters Verify Deafault Values on Match on(Instance Based)
#                         Module Filters Single Select - Ends with (Instance)
#Module Filters Single Select - Contains (Instance)
#                           Launch IsoMetrix Application
#                           Login with Valid Credentials
#                           Switch to Iframe
#                           Navigate to Sources
#                           Navigate To All Filters Instance Based
#                           Add a New Record
#                           Navigate to Module Filter Tab
#                           Verify Default Values on Level and View Fields
#                           Module Filters Verify Deafault Values on Match on(Instance Based)
#                           Module Filters Single Select - Contains (Instance)
#Module Filters Single Select - Does not contain (Instance)
#                                      Launch IsoMetrix Application
#                                      Login with Valid Credentials
#                                      Switch to Iframe
#                                      Navigate to Sources
#                                      Navigate To All Filters Instance Based
#                                      Add a New Record
#                                      Navigate to Module Filter Tab
#                                      Verify Default Values on Level and View Fields
#                                      Module Filters Verify Deafault Values on Match on(Instance Based)
#                                      Module Filters Single Select - Does not contain (Instance)
#Module Filters Between (Instance)
#                                        Launch IsoMetrix Application
#                                        Login with Valid Credentials
#                                        Switch to Iframe
#                                        Navigate to Sources
#                                        Navigate To All Filters Instance Based
#                                        Add a New Record
#                                        Navigate to Module Filter Tab
#                                        Verify Default Values on Level and View Fields
#                                        Module Filters Verify Deafault Values on Match on(Instance Based)
#                                        Module Filters Between (Instance)
#Module Filters Less than (Instance)
#                                             Launch IsoMetrix Application
#                                              Login with Valid Credentials
#                                              Switch to Iframe
#                                              Navigate to Sources
#                                              Navigate To All Filters Instance Based
#                                              Add a New Record
#                                              Navigate to Module Filter Tab
#                                              Verify Default Values on Level and View Fields
#                                              Module Filters Verify Deafault Values on Match on(Instance Based)
#                                              Module Filters Less than (Instance)
#Module Filters Less than and equals to (Instance)
#                                                Launch IsoMetrix Application
#                                                Login with Valid Credentials
#                                                Switch to Iframe
#                                                Navigate to Sources
#                                                Navigate To All Filters Instance Based
#                                                Add a New Record
#                                                Navigate to Module Filter Tab
#                                                Verify Default Values on Level and View Fields
#                                                Module Filters Verify Deafault Values on Match on(Instance Based)
#                                                Module Filters Less than and equals to (Instance)
#Module Filter Greater than (Instance)
#                                                    Launch IsoMetrix Application
#                                                    Login with Valid Credentials
#                                                    Switch to Iframe
#                                                    Navigate to Sources
#                                                    Navigate To All Filters Instance Based
#                                                    Add a New Record
#                                                    Navigate to Module Filter Tab
#                                                    Verify Default Values on Level and View Fields
#                                                    Module Filters Verify Deafault Values on Match on(Instance Based)
#                                                    Module Filter Greater than (Instance)
#Module Filter Greater than and equals to (Instance)
#                                                     Launch IsoMetrix Application
#                                                     Login with Valid Credentials
#                                                     Switch to Iframe
#                                                     Navigate to Sources
#                                                     Navigate To All Filters Instance Based
#                                                     Add a New Record
#                                                     Navigate to Module Filter Tab
#                                                     Verify Default Values on Level and View Fields
#                                                     Module Filters Verify Deafault Values on Match on(Instance Based)
#                                                     Module Filter Greater than and equals to (Instance)
#Module Filter Multi Select - Equals to (Instance)
#                                                               Launch IsoMetrix Application
#                                                                Login with Valid Credentials
#                                                                Switch to Iframe
#                                                                Navigate to Sources
#                                                                Navigate To All Filters Instance Based
#                                                                Add a New Record
#                                                                Navigate to Module Filter Tab
#                                                                Verify Default Values on Level and View Fields
#                                                               Module Filter Update Match on Value
#                                                                Module Filter Multi Select - Equals to (Instance)
#Module Filter Multi Select - Is not Equals to (Instance)
#                                                               Launch IsoMetrix Application
#                                                                  Login with Valid Credentials
#                                                                  Switch to Iframe
#                                                                  Navigate to Sources
#                                                                  Navigate To All Filters Instance Based
#                                                                  Add a New Record
#                                                                  Navigate to Module Filter Tab
#                                                                  Verify Default Values on Level and View Fields
#                                                                 Module Filter Update Match on Value
#                                                                 Module Filter Multi Select - Is not Equals to (Instance)
#Module Filters Multi Select - Starts with (Instance)
#                                                                 Launch IsoMetrix Application
#                                                                  Login with Valid Credentials
#                                                                  Switch to Iframe
#                                                                  Navigate to Sources
#                                                                  Navigate To All Filters Instance Based
#                                                                  Add a New Record
#                                                                  Navigate to Module Filter Tab
#                                                                  Verify Default Values on Level and View Fields
#                                                                 Module Filter Update Match on Value
#                                                                 Module Filters Multi Select - Starts with (Instance)
#Module Filter Multi Select - Ends With (Instance)
#                                                            Launch IsoMetrix Application
#                                                                  Login with Valid Credentials
#                                                                  Switch to Iframe
#                                                                  Navigate to Sources
#                                                                  Navigate To All Filters Instance Based
#                                                                  Add a New Record
#                                                                  Navigate to Module Filter Tab
#                                                                  Verify Default Values on Level and View Fields
#                                                                 Module Filter Update Match on Value
#                                                                 Module Filter Multi Select - Ends With (Instance)
#Module Filter Multi Select - Contians (Instance)
#                                                                     Launch IsoMetrix Application
#                                                                     Login with Valid Credentials
#                                                                     Switch to Iframe
#                                                                     Navigate to Sources
#                                                                     Navigate To All Filters Instance Based
#                                                                     Add a New Record
#                                                                     Navigate to Module Filter Tab
#                                                                     Verify Default Values on Level and View Fields
#                                                                    Module Filter Update Match on Value
#                                                                    Module Filter Multi Select - Contians (Instance)
#Module Filter Multi Select - Does not contain (Instance)
#                                                                     Launch IsoMetrix Application
#                                                                     Login with Valid Credentials
#                                                                     Switch to Iframe
#                                                                     Navigate to Sources
#                                                                     Navigate To All Filters Instance Based
#                                                                     Add a New Record
#                                                                     Navigate to Module Filter Tab
#                                                                     Verify Default Values on Level and View Fields
#                                                                    Module Filter Update Match on Value
##\                                                                    Module Filter Multi Select - Does not contain (Instance)