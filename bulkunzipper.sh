#!/bin/bash

# sudo apt-get install zip unzip

basefolder="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/HW01_Submissions/"

shopt -s nullglob
cd $basefolder

for f in *.zip ; do
    unzip -d "${f%*.zip}" "$f"

done