#!/bin/bash

backup() {
  # Prompt for the backup destination folder
  read -p "Enter the backup destination folder: " backup_folder

  # Create a timestamp for the backup file
  timestamp=$(date +"%Y%m%d%H%M%S")

  # Specify the files and directories to be backed up
  files=(
    "$HOME/Documents"
    "$HOME/.bash_profile"
    "$HOME/.zshrc"
    "$HOME/.ssh"
    "$HOME/.ssh/config"  # Include the SSH aliases file
    "$HOME/.ssh/id_rsa"  # Include the SSH private key
    "$HOME/Library/Application Support/Sublime Text 3/Packages/User" # Include Sublime Text config
    "$HOME/Library/Application Support/Sequel Pro/Data/Preferences/sequelpro.plist" # Include Sequel Pro passwords
  )

  # Create a unique backup file name
  backup_file="$backup_folder/backup_$timestamp.zip"

  # Create the backup using zip
  zip -r "$backup_file" "${files[@]}"

  # Check if the backup was successful
  if [ $? -eq 0 ]; then
    echo "Backup created successfully: $backup_file"
  else
    echo "Backup creation failed!"
  fi
}

restore() {
  # Prompt for the backup file to restore
  read -p "Enter the backup file to restore: " backup_file

  # Specify the restore destination folder
  restore_folder="$HOME"

  # Extract the backup file to the restore destination folder
  unzip -o "$backup_file" -d "$restore_folder"

  # Check if the restore was successful
  if [ $? -eq 0 ]; then
    echo "Restore completed successfully."
  else
    echo "Restore failed!"
  fi
}

# Check the script argument to determine backup or restore
if [ "$1" == "backup" ]; then
  backup
elif [ "$1" == "restore" ]; then
  restore
else
  echo "Invalid argument. Usage: ./backup_restore.sh [backup|restore]"
fi
