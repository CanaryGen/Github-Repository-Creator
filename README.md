# GitHub Repository Creator

This Ruby script automates the creation of a GitHub repository and the upload of files from a local folder named `repository`. It also provides options to save the GitHub access token in a configuration file and to clear the folder after uploading the files.

## Features

- **Token Management**: Saves the GitHub access token in a `config.yml` file for future use.
- **Repository Creation**: Creates a new GitHub repository with the specified name.
- **File Upload**: Uploads all files from the `repository` folder to the newly created GitHub repository.
- **Folder Clearing**: Optionally clears the `repository` folder after uploading the files.

## Prerequisites

- Ruby installed on your machine.
- `octokit` gem installed. You can install it using:
  ```bash
  gem install octokit
  ```
## Usage

1.  **Run the Script**: Execute the script by running:
   
    
    ```bash
    ruby uploader.rb
    ```
    
    
2.  **Enter GitHub Token**: When prompted, enter your GitHub access token. This token will be saved in  `config.yml`  for future use.
    
3.  **Enter Repository Name**: Enter the name of the repository you want to create. The name must only contain letters, numbers, dots, dashes, and underscores.
    
4.  **Upload Files**: The script will upload all files from the  `repository`  folder to the newly created GitHub repository.
    
5.  **Clear Folder**: After uploading the files, you will be asked if you want to clear the  `repository`  folder. Enter  `yes`  to clear the folder or  `no`  to keep the files.
    

## Configuration

The script uses a  `config.yml`  file to store the GitHub access token. This file is created automatically if it does not exist.

## Security Note

**Token Security**: Your GitHub access token is sensitive information. Ensure that you do not share your  `config.yml`  file or commit it to a public repository. Keep your token secure and do not expose it in any public forums or websites.

## Creating a GitHub Token

To create a GitHub access token, follow these steps:

1.  Go to your GitHub account settings.
    
2.  Navigate to "Developer settings" -> "Personal access tokens".
    
3.  Click on "Generate new token".
    
4.  Provide a note for the token to remember its purpose.
    
5.  Select the scopes (permissions) you want to grant to the token. For this script, you will need at least  `repo`  scope.
    
6.  Click "Generate token" and copy the generated token.
    

## Notes

-   Ensure that the  `repository`  folder exists in the same directory as the script. If it does not exist, the script will create it.
