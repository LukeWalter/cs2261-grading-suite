#!/bin/bash

# Absolute path to base folder
basefolder="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/Lab_04_Submissions/"

# Absolute path to tasks.json
mytasks="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/tasks.json"

./bulkunzipper.sh $basefolder
./taskreplacer.sh $basefolder $mytasks