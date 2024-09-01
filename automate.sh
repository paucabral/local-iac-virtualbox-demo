#!/bin/bash

echo -e '\033[1mLoad Environment Variables...\033[0m'
ENV_FILE=".env"

# Check if the .env file exists
if [ -f "$ENV_FILE" ]; then
    # Source the .env file to export variables
    export $(grep -v '^#' "$ENV_FILE" | xargs)
    echo ".env file found and variables exported."
else
    echo ".env file not found."
fi
echo "-----------------------------------"

echo -e '\033[1mTerraform Init...\033[0m'
terraform init
echo "-----------------------------------"

echo -e '\033[1mTerraform Plan...\033[0m'
terraform plan
echo "-----------------------------------"

echo -e '\033[1mTerraform Apply...\033[0m'
terraform apply -auto-approve
echo "-----------------------------------"

echo -e '\033[1mGenerate Ansible Inventory...\033[0m'
bash tf_output_to_ansible_inventory.sh
echo "-----------------------------------"

echo -e '\033[1mRun Ansible Playbook...\033[0m'
ansible-playbook playbook.yaml
echo "-----------------------------------"