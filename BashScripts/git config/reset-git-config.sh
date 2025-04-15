#!/bin/bash

###############################################################################################################
#                                                                                                             #
#   This script removes all existing Git SSH keys and resets the SSH configuration to the initial state.      #
#   It clears the ~/.ssh directory of all keys and configuration files and removes keys from the ssh-agent.   #
#   Use this script carefully, as it will delete all your current Git SSH configurations.                     #
#                                                                                                             #
#   To run this script, follow these steps:                                                                   #
#                                                                                                             #
#   1. Make the script executable:                                                                            #
#      chmod +x reset-git-config.sh                                                                           #
#                                                                                                             #
#   2. Run the script:                                                                                        #
#      ./reset-git-config.sh                                                                                  #
#                                                                                                             #
###############################################################################################################



# Function to confirm the operation
confirm() {
  read -p "This will delete all Git SSH configurations and reset to the initial state. Are you sure? (y/n): " -n 1 -r
  echo  # Move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 0
  else
    echo "Operation canceled."
    exit 1
  fi
}

# Confirm the operation
confirm

# Remove all SSH keys and config files from the ~/.ssh directory
if [ -d "$HOME/.ssh" ]; then
  echo "Removing all SSH keys and configuration files from ~/.ssh..."
  rm -f $HOME/.ssh/id_rsa* $HOME/.ssh/id_ed25519* $HOME/.ssh/config
  echo "All SSH keys and configuration files have been deleted."
else
  echo "No ~/.ssh directory found. Skipping key removal."
fi

# Remove all keys from the SSH agent
if ssh-add -l >/dev/null 2>&1; then
  echo "Removing all keys from the SSH agent..."
  ssh-add -D >/dev/null 2>&1
  echo "All keys have been removed from the SSH agent."
else
  echo "No keys loaded in the SSH agent. Skipping removal."
fi

# Reset SSH configuration by recreating a blank ~/.ssh directory
mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

echo "Reset complete. Your SSH configuration is now blank. You can generate new keys and configure Git accounts."
