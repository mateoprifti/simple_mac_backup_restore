Backup and Restore Script
-------------------------

This script allows you to perform backups of specified files and directories on your Mac, and also provides the option to restore those backups.

### Prerequisites

*   Bash shell environment (typically available by default on macOS)
*   `zip` utility installed (use `brew install zip` if not already installed)
*   `unzip` utility installed (use `brew install unzip` if not already installed)

### Usage

1.  Download the script and save it to a file, e.g., `backup_restore.sh`.
2.  Open a terminal and navigate to the directory where the script is located.
3.  Make the script executable by running the following command:

    chmod +x backup_restore.sh

4.  To create a backup, run the script with the `backup` argument:

    ./backup_restore.sh backup

\- You will be prompted to enter the backup destination folder.  
\- The script will create a timestamped ZIP file in the specified backup folder, including files such as Documents, bash profile, zsh profile, SSH keys, SSH aliases, and Sequel Pro passwords (if applicable).

5.  To restore from a backup, run the script with the `restore` argument:

    ./backup_restore.sh restore

\- You will be prompted to enter the path to the backup file you want to restore.  
\- The script will extract the backup file to the restore destination folder, overwriting existing files with the ones from the backup.

### Important Note

When performing a restore, exercise caution as the existing files in the restore destination folder will be overwritten.