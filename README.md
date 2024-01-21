# Introduction
This PowerShell script streamlines the updating process for repositories cloned from AWS CodeCommit through `AWS SSO/git-remote-codecommit`. It examines and displays `AWS SSO profiles` set up in the `/.aws/config folder`, executing `aws sso login --profile` for all profiles (or a specified one based on user input) unless already logged in. The script proceeds to switch to the `main branch` and execute `git pull` to fetch the latest changes. By making use of the   `PowerShell ForEach-Object Parallel` feature, it ensures a rapid process, necessitating `PowerShell version 7` for Windows and employing `xargs` for Linux.

# Pre-requisites
1. `PowerShell v7 (Windows)`
2. `AWS SSO Configured`
3. `aws-cli`
4. `xargs (Linux)`

# Steps
1. Edit the `$file = "C:\Users\test\.aws\config"` or `file="/Users/test/.aws/config"` aws sso config files path
2. Edit the `$dir = "C:\Users\test\REPO"` or `dir="/Users/test/REPO"` folder's path where all the repos are stored
3. Run the script in PowerShell v7 (Windows) or in bash (Linux)

# Screenshots
![Group 1](https://github.com/itsnotsagar/CodeCommitUpdater/assets/56265949/b098e4bf-f70a-40b2-b899-fe6a55b5b562)
![Group 2](https://github.com/itsnotsagar/CodeCommitUpdater/assets/56265949/a2877925-366c-44eb-b86c-efce4f4ec79f)
![Group 3](https://github.com/itsnotsagar/CodeCommitUpdater/assets/56265949/0709357e-63c0-4ab2-b16f-59e78664e598)

