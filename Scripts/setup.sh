#!/usr/bin/bash

# Relative path to base folder
basefolder="../Example_Submissions/"

# IMPORTANT: Make sure to switch out the tasks.json file here with your own!
# Relative path to tasks.json
mytasks="./tasks.json"

./bulkunzipper.sh $basefolder
./taskreplacer.sh $basefolder $mytasks

# To run: ./setup.sh

# Troubleshooting scripts:
# NOTE: Make sure you're in the Scripts folder when running these commands (And that you're using a WSL terminal!)

# chmod 777 taskreplacer.sh bulkunzipper.sh setup.sh           | (Permissions denied)
# sudo apt-get install zip unzip                               | (Unzip script not found)
# sed -i -e 's/\r$//' taskreplacer.sh bulkunzipper.sh setup.sh | (Bad interpreter)