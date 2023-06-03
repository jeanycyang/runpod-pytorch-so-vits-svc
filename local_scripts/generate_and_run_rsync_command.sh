#!/bin/bash

# Check if SSH command is provided as an argument
if [ -z "$1" ]; then
  echo "Please provide an SSH command as an argument."
  exit 1
fi

# Extract host, port, and identity file from the SSH command
host=$(echo "$1" | awk '{print $2}')
port=$(echo "$1" | awk '{print $4}')
identity_file=$(echo "$1" | awk '{print $6}')

# Generate the rsync command
rsync_command="rsync -avz --progress -e 'ssh -P $port -i $identity_file' root@$host:/content/so-vits-svc/so-vits-svc\*.zip ./"

echo "Generated rsync command:"
echo "$rsync_command"
eval "$rsync_command"
