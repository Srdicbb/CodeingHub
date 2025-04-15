#!/bin/bash

#################################################################################################################
#                                                                                                               #
#   This script lists all SSH keys associated with GitHub accounts and displays their corresponding emails.     #

# To run this script, follow these steps:                                                                   #
#                                                                                                             #
#   1. Make the script executable:                                                                            #
#      chmod +x get-ssh-keys-for-git.sh                                                                           #
#                                                                                                             #
#   2. Run the script:                                                                                        #
#      ./get-ssh-keys-for-git.sh   
#                                                                                                               #
#################################################################################################################

# Check if the .ssh directory exists
if [ ! -d "$HOME/.ssh" ]; then
  echo "No SSH directory found. No SSH keys to display."
  exit 1
fi

# Find all SSH public keys in the .ssh directory
ssh_keys=$(find $HOME/.ssh -name "*.pub" 2>/dev/null)

if [ -z "$ssh_keys" ]; then
  echo "No SSH keys found."
  exit 1
fi

echo "\nSSH Keys Associated with Your GitHub Accounts:"
echo "----------------------------------------------"

for key in $ssh_keys; do
  email=$(grep -oE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+' "$key")
  echo "Email: $email"
  echo "SSH Public Key:"
  cat "$key"
  echo "----------------------------------------------"
done

echo "\nMake sure to add these SSH keys to your GitHub account(s) if necessary."
