#!/bin/bash

#################################################################################################################
#                                                                                                               #
#   Ova bash skripta omogućava upravljanje SSH ključevima za više Git naloga.                                   #
#   Automatski generiše SSH ključeve, dodaje ih u ssh-agent, ažurira SSH konfiguracioni fajl (~/.ssh/config),   #
#   i prikazuje javni ključ koji se može dodati na odgovarajući Git nalog (GitHub, GitLab itd.).                #
#   Skripta podržava višestruke naloge i pruža interaktivni način za dodavanje novih konfiguracija.             #
#                                                                                                               #
#################################################################################################################


# Definišemo git naloge kao asocijativni niz (key-value parove)
declare -A accounts
accounts=(
  ["personal"]="personal_email@example.com personal_name"
  ["work"]="work_email@example.com work_name"
)

# Prikaži dostupne opcije
echo "Odaberi nalog:"
for account in "${!accounts[@]}"; do
  echo "- $account"
done

# Unos korisnika
read -p "Unesi naziv naloga: " selected_account

# Provera da li nalog postoji
if [[ -n "${accounts[$selected_account]}" ]]; then
  # Ekstraktuj email i ime
  email=$(echo "${accounts[$selected_account]}" | awk '{print $1}')
  name=$(echo "${accounts[$selected_account]}" | awk '{print $2}')
  
  # Postavljanje git konfiguracije
  git config --global user.email "$email"
  git config --global user.name "$name"
  
  echo "Git nalog promenjen na: $selected_account ($email, $name)"
else
  echo "Nalog \"$selected_account\" ne postoji. Pokušaj ponovo."
fi



# chmod +x switch_git_account.sh
# ./switch_git_account.sh

#
#
#
#
#
#
#
#