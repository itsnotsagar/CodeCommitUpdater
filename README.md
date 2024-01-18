# Introduction
This PowerShell script automates the update process for repositories cloned from AWS CodeCommit using AWS SSO/git-remote-codecommit. It reads and prints AWS SSO profiles configured in the `/.aws/config folder`, running `aws sso login --profile` for all profiles (or a specified one based on user input) or skipping it if already logged in. The script then checks out the main branch and performs `git pull` for fetching updated changes. Leveraging the `PowerShell ForEach-Object Parallel` Feature, it ensures a swift process, requiring `PowerShell version 7`.

# Pre-requisites
1. `PowerShell v7`
2. `AWS SSO Configured`
3. `aws-cli`

# Steps
1. Edit the `$file = "C:\Users\test\.aws\config"` aws sso config files path
2. Edit the `$dir = "C:\Users\test\REPO"` folder's path where all the repos are stored
3. Run the script in PowerShell v7

# Screenshots
![Group 1](https://github.com/itsnotsagar/CodeCommitUpdater/assets/56265949/b098e4bf-f70a-40b2-b899-fe6a55b5b562)
![Group 2](https://github.com/itsnotsagar/CodeCommitUpdater/assets/56265949/a2877925-366c-44eb-b86c-efce4f4ec79f)
![Group 3](https://github.com/itsnotsagar/CodeCommitUpdater/assets/56265949/0709357e-63c0-4ab2-b16f-59e78664e598)

