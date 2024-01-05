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
