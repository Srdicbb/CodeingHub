#!/bin/bash

# ls -al ~/.ssh proveri ssh kljuceve

###############################################################################################################
#                                                                                                             #
#   This script will set up Git configuration and generate SSH keys for multiple GitHub accounts on your Mac. #
#   It will create SSH keys for each email/GitHub account and configure Git to use them.                      #
#   Use this script to easily manage multiple GitHub accounts with different SSH keys.                        #
#                                                                                                             #
#   To run this script, follow these steps:                                                                   #
#                                                                                                             #
#   1. Make the script executable:                                                                            #
#      chmod +x setup-git-config.sh                                                                           #
#                                                                                                             #
#   2. Run the script:                                                                                        #
#      ./setup-git-config.sh                                                                                  #
#                                                                                                             #
###############################################################################################################

# Function to generate SSH key for a given email
generate_ssh_key() {
  local email=$1
  local key_name=$2

  echo "Generating SSH key for $email..."
  ssh-keygen -t rsa -b 4096 -C "$email" -f "$HOME/.ssh/$key_name" -N ""
  echo "SSH key generated for $email and saved to $HOME/.ssh/$key_name"
}

# Function to configure Git for a given email
configure_git() {
  local email=$1
  local name=$2

  echo "Configuring Git for $email..."
  git config --global user.name "$name"
  git config --global user.email "$email"
  echo "Git configured for $email with name: $name"
}

# Function to add SSH key to SSH agent
add_ssh_key_to_agent() {
  local key_name=$1

  echo "Adding SSH key $key_name to the SSH agent..."
  ssh-add $HOME/.ssh/$key_name
  echo "SSH key $key_name added to SSH agent."
}

# Function to configure SSH for multiple accounts with separate keys
configure_ssh() {
  echo "Configuring SSH for multiple GitHub accounts..."

  # Start by creating or clearing the SSH config file
  touch $HOME/.ssh/config
  echo "" > $HOME/.ssh/config

  while true; do
    # Ask for Git account details
    read -p "Enter the email for your GitHub account: " email
    read -p "Enter the name for your GitHub account: " name
    read -p "Enter a unique key name for the SSH key (e.g., 'id_rsa_account1'): " key_name

    # Generate SSH key and configure Git for the given email
    generate_ssh_key "$email" "$key_name"
    configure_git "$email" "$name"
    add_ssh_key_to_agent "$key_name"

    # Ask for the GitHub repository URL (this will be used for all repositories of this account)
    read -p "Enter the GitHub remote URL (e.g., git@github.com:user/repo.git): " git_url

    # Append SSH configuration for this GitHub account
    echo "Host $git_url" >> $HOME/.ssh/config
    echo "  HostName github.com" >> $HOME/.ssh/config
    echo "  User git" >> $HOME/.ssh/config
    echo "  IdentityFile $HOME/.ssh/$key_name" >> $HOME/.ssh/config
    echo "SSH configuration added for repository $git_url using key $key_name."

    # Ask if the user wants to configure another GitHub account
    read -p "Do you want to configure another GitHub account? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      break
    fi
  done

  chmod 600 $HOME/.ssh/config
  echo "SSH configuration complete for all GitHub accounts and repositories."
}

# Start the process of configuring Git and SSH for multiple accounts
configure_ssh

echo "Git and SSH setup complete for your multiple GitHub accounts!"
