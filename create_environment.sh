#!/bin/bash

# Ask for the user's name to create a personalized directory
read -p "Enter your name: " userName
dirName="submission_reminder_${userName}"

# Create main project directory
mkdir -p "$dirName"/{app,modules,assets,config}

# Create necessary files
touch "$dirName/app/reminder.sh"
touch "$dirName/modules/functions.sh"
touch "$dirName/assets/submissions.txt"
touch "$dirName/config/config.env"
touch "$dirName/startup.sh"

# Populate startup.sh with script content
cat <<EOL > "$dirName/startup.sh"
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
EOL

# Make the startup.sh script executable
chmod +x "$dirName/startup.sh"

# Final message
echo "Project setup completed! Navigate to '$dirName' and run ./startup.sh to start the app."

