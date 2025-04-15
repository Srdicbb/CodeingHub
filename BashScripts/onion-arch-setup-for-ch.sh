#!/bin/bash

###############################################################################################################
#                                                                                                             #
#   This script automates the creation of an Onion Architecture for a .NET project.                           #
#   It creates a solution, sets up projects for each layer (API, Core, Application, Infrastructure),          #
#   establishes references between the projects, and organizes the folder structure.                          #
#                                                                                                             #
#   To run this script:                                                                                       #
#                                                                                                             #
#   1. Save the script as onion-arch-setup-for-ch.sh in the root directory of your solution.                  #
#   2. Make the script executable:                                                                            #
#      chmod +x onion-arch-setup-for-ch.sh                                                                    #
#   3. Run the script:                                                                                        #
#      ./onion-arch-setup-for-ch.sh                                                                           #
#                                                                                                             #
###############################################################################################################


# Set the project name
PROJECT_NAME="CodeingHub"

# Navigate to the parent directory of the current script
# The project will be created here
cd ..
mkdir $PROJECT_NAME
cd $PROJECT_NAME

# Create the solution
echo "Creating solution..."
dotnet new sln -n $PROJECT_NAME

# Create the API project
echo "Creating API project..."
dotnet new webapi -n $PROJECT_NAME.Api
dotnet sln add $PROJECT_NAME.Api

# Create the Core layer
echo "Creating Core layer..."
dotnet new classlib -n $PROJECT_NAME.Core
dotnet sln add $PROJECT_NAME.Core

# Create the Application layer
echo "Creating Application layer..."
dotnet new classlib -n $PROJECT_NAME.Application
dotnet sln add $PROJECT_NAME.Application

# Create the Infrastructure layer
echo "Creating Infrastructure layer..."
dotnet new classlib -n $PROJECT_NAME.Infrastructure
dotnet sln add $PROJECT_NAME.Infrastructure

# Add references between projects
echo "Adding references..."
dotnet add $PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj reference $PROJECT_NAME.Core/$PROJECT_NAME.Core.csproj
dotnet add $PROJECT_NAME.Infrastructure/$PROJECT_NAME.Infrastructure.csproj reference $PROJECT_NAME.Core/$PROJECT_NAME.Core.csproj
dotnet add $PROJECT_NAME.Infrastructure/$PROJECT_NAME.Infrastructure.csproj reference $PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj
dotnet add $PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj reference $PROJECT_NAME.Core/$PROJECT_NAME.Core.csproj
dotnet add $PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj reference $PROJECT_NAME.Application/$PROJECT_NAME.Application.csproj
dotnet add $PROJECT_NAME.Api/$PROJECT_NAME.Api.csproj reference $PROJECT_NAME.Infrastructure/$PROJECT_NAME.Infrastructure.csproj

# Create folder structure for each layer
echo "Creating folder structure for Core layer..."
mkdir -p $PROJECT_NAME.Core/{Entities,Interfaces,ValueObjects,Exceptions}

echo "Creating folder structure for Application layer..."
mkdir -p $PROJECT_NAME.Application/{Services,DTOs,Queries}

echo "Creating folder structure for Infrastructure layer..."
mkdir -p $PROJECT_NAME.Infrastructure/{Repositories,Configurations,Persistence,Services}

# Add EF Core to Infrastructure layer
echo "Adding EF Core to Infrastructure layer..."
dotnet add $PROJECT_NAME.Infrastructure package Microsoft.EntityFrameworkCore
dotnet add $PROJECT_NAME.Infrastructure package Microsoft.EntityFrameworkCore.SqlServer

# Finalize
echo "Restoring packages..."
dotnet restore

echo "Setup complete. Your Onion Architecture project is ready!"
