#!/bin/bash

# sudo apt-get install zip unzip

basefolder=$1

shopt -s nullglob
cd $basefolder

for f in *.zip ; do
    unzip -d "${f%*.zip}" "$f"

done