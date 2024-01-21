# Specify the file containing the profiles
file="/Users/itsnotsagar/.aws/config"

# Initialize array to store profile names
profiles=()

# Read each line from the file
while IFS= read -r line; do
    # Check if it's a profile line
    if [[ $line =~ \[profile\ (.*)\] ]]; then
        profiles+=("${BASH_REMATCH[1]}")
    fi
done < "$file"

# Print all profile names
echo "Profiles found:"
for profile in "${profiles[@]}"; do
    echo "$profile"
done

# Ask the user if they want to update the SSO profile
read -p "Do you want to update the SSO profile? (yes/no) " updateSsoProfile

if [[ $updateSsoProfile == "yes" ]]; then
    # Ask the user for which profile they want to login to AWS SSO
    read -p "Enter the profile you want to login to AWS SSO with (leave empty to update all profiles): " selectedProfile

    if [[ -n $selectedProfile ]]; then
        if [[ " ${profiles[@]} " =~ " $selectedProfile " ]]; then
            # Run aws sso login command for the selected profile
            echo "Logging in to AWS SSO with profile $selectedProfile"
            aws sso login --profile "$selectedProfile"
        else
            echo "Profile $selectedProfile not found"
        fi
    else
        # Run aws sso login command for all profiles
        for profile in "${profiles[@]}"; do
            echo "Logging in to AWS SSO with profile $profile"
            aws sso login --profile "$profile"
        done
    fi
fi

# Specify the directory containing the repos
dir="/Users/itsnotsagar/REPO"

# Get all subdirectories
directories=$(find "$dir" -type d)

# Function to update a single repo
update_repo() {
    directory="$1"
    cd "$directory"
    
    # Check if it's a git repository
    if [[ -d .git ]]; then
        echo "Updating $directory"
        
        # Checkout main branch and pull
        git checkout main
        git pull
    fi
}

# Export the function to make it available to xargs
export -f update_repo

# Update repos in parallel using xargs
echo "$directories" | xargs -I {} -P 4 bash -c 'update_repo "$@"' _ {}

