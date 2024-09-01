#!/bin/bash

# Fetch the Terraform output in JSON format
terraform_output=$(terraform output -json)

# Initialize variables
last_group=""

# Extract and format hostnames and IPs
echo "$terraform_output" | grep -oP '"\K[^"]+: [^"]+' | while IFS=": " read -r host ip; do
    # Determine the group name by removing numerical suffix if present
    if [[ "$host" =~ ^(.*)[_-][0-9]+$ ]]; then
        group="${BASH_REMATCH[1]}"
    else
        # Handle cases where there is no hyphen or underscore
        group=$(echo "$host" | sed 's/[0-9]*$//')
    fi

    # Remove any trailing hyphens or underscores from the group name
    group=$(echo "$group" | sed 's/[-_]$//')

    # Print the group header if it's different from the last one
    if [[ "$group" != "$last_group" ]]; then
        if [[ -n "$last_group" ]]; then
            echo ""  # Print a newline between groups
        fi
        echo "[$group]"
        last_group="$group"
    fi

    # Print the host and IP
    echo "$host ansible_host=$ip"
done > inventory.ini