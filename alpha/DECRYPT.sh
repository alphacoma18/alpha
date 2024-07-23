#!/bin/bash

# Make executable with chmod +x DECRYPT.sh
# Run with ./DECRYPT.sh

# Ensure script exits on any command failure
set -e

# Read user input securely
read -s -p "Enter the password: " userInput
echo

gpg --batch --passphrase "$userInput" --output - --decrypt alpha.tar.xz.gpg | xzcat | tar -xvf -
echo "Removing encrypted file..."
rm -f alpha.tar.xz.gpg

# Clear user input from memory
unset userInput
