# Specify the file containing the profiles
$file = "C:\Users\test\.aws\config"

# Get all lines from the file
$lines = Get-Content -Path $file

# Initialize list to store profile names
$profiles = @()

# Loop over all lines
foreach ($line in $lines) {
    # Check if it's a profile line
    if ($line -match '\[profile (.*)\]') {
        $profiles += $Matches[1]
    }
}

# Print all profile names
Write-Output "Profiles found:"
$profiles

# Ask the user if they want to update the SSO profile
$updateSsoProfile = Read-Host -Prompt "Do you want to update the SSO profile? (yes/no)"

if ($updateSsoProfile -eq "yes") {
    # Ask the user for which profile they want to login to AWS SSO
    $selectedProfile = Read-Host -Prompt "Enter the profile you want to login to AWS SSO with (leave empty to update all profiles)"

    if ($selectedProfile) {
        if ($profiles -contains $selectedProfile) {
            # Run aws sso login command for the selected profile
            Write-Output "Logging in to AWS SSO with profile $selectedProfile"
            Start-Process -Wait -NoNewWindow -FilePath "aws" -ArgumentList "sso login --profile $selectedProfile"
        } else {
            Write-Output "Profile $selectedProfile not found"
        }
    } else {
        # Run aws sso login command for all profiles
        $profiles | ForEach-Object {
            Write-Output "Logging in to AWS SSO with profile $_"
            Start-Process -Wait -NoNewWindow -FilePath "aws" -ArgumentList "sso login --profile $_"
        }
    }
}
# Specify the directory containing the repos
$dir = "C:\Users\test\REPO"

# Get all subdirectories
$directories = Get-ChildItem -Path $dir -Directory

# Loop over all subdirectories in parallel
$directories | ForEach-Object -Parallel {
    # Change to the directory
    Set-Location -Path $_.FullName
    
    # Check if it's a git repository
    if (Test-Path .git) {
        Write-Output "Updating $($_.FullName)"
        
        # Checkout main branch and pull
        git checkout main
        git pull
    }
}