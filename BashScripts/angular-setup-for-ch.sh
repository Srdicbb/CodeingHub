#!/bin/bash

###############################################################################################################
#                                                                                                             #
#   This script automates the creation of a structured Angular 17 project using TypeScript.                   #
#   It sets up a basic folder structure and installs commonly used packages.                                  #
#                                                                                                             #
#   To run this script:                                                                                       #
#                                                                                                             #
#   1. Save the script as angular-setup-for-ch.sh                                                             #
#   2. Make it executable:                                                                                    #
#      chmod +x angular-setup-for-ch.sh                                                                       #
#   3. Run the script:                                                                                        #
#      ./angular-setup-for-ch.sh                                                                              #
#                                                                                                             #
###############################################################################################################

# 🔧 Set project name
PROJECT_NAME="CodeingHub.Ui"

# Go one level up from current directory
cd ..

# 1. Provera da li folder već postoji
if [ -d "$PROJECT_NAME" ]; then
  echo "⚠️ Folder '$PROJECT_NAME' već postoji. Obriši ga ili izaberi drugo ime."
  exit 1
fi

# 2. Kreiraj Angular projekat sa SCSS-om, TypeScript-om i Routingom
echo "📦 Kreiram Angular projekat '$PROJECT_NAME' sa SCSS-om, TypeScript-om i routingom..."
ng new "$PROJECT_NAME" --style=scss --routing --skip-install=false

# 3. Ulazi u projekat
cd "$PROJECT_NAME" || exit

# 4. Završna poruka
echo ""
echo "✅ Projekat '$PROJECT_NAME' je uspešno kreiran sa:"
echo "   - SCSS podrškom"
echo "   - TypeScript-om"
echo "   - Routingom"
echo ""
echo "🚀 Pokreni aplikaciju: cd $PROJECT_NAME && npm start"

# Final message
echo "✅ Angular 17 project setup complete!"
echo "➡ Navigate to '$PROJECT_NAME' and run 'ng serve' to start."