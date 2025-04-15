#!/bin/bash

###############################################################################################################
#                                                                                                             #
#   This script navigates from the BashScript folder to the CodeingHub folder and runs the CodeingHub.Api     #
#   project using the `dotnet run` command.    
#
#   To run this script, follow these steps:                                                                   #
#                                                                                                             #
#   1. Make the script executable:                                                                            #
#      chmod +x run-backend.sh                                                                           #
#                                                                                                             #
#   2. Run the script:                                                                                        #
#      ./run-backend.sh                                                                   #
#                                                                                                             #
###############################################################################################################

# Navigate one step back from the BashScript folder
cd ..

# Navigate to the CodeingHub folder
cd CodeingHub

# Run the CodeingHub.Api project
echo "Running the CodeingHub.Api project..."
dotnet run --project CodeingHub.Api

