#!/bin/bash

# Load environment variables
source config/config.env

# Display startup message
echo "Starting the Submission Reminder App..."

# Check if required files exist
if [[ ! -f "app/reminder.sh" || ! -f "modules/functions.sh" || ! -f "assets/submissions.txt" ]]; then
    echo "Error: Required files are missing. Please check the directory structure."
    exit 1
fi

# Run the main reminder script
bash app/reminder.sh

# Source functions script (if needed)
source modules/functions.sh

# Completion message
echo "Submission Reminder App has started successfully."
