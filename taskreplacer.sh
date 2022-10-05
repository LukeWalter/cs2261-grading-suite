#!/bin/bash

mytasks="/mnt/c/Users/lwalt/Desktop/External/CS2261/Grading/tasks.json"
basefolder=$1

findTasks () {

    cd "$1"
    pwd

    if [[ -d "./.vscode/" ]]
    then
        
        cd ./.vscode/

        if [[ -f "./tasks.json" ]]
        then
            
            echo $mytasks
            echo "Replacing tasks!"

            cp -f $mytasks ./tasks.json
            
        fi
        
        cd ..

    else
        
        OIFS="$IFS"
        IFS=$'\n'
        for d in */ ; do
            findTasks $d

        done  
        IFS="$OIFS"
            
    fi
    
    cd ..

} # findVscode

shopt -s nullglob

cd $basefolder

if [[ -f $mytasks ]]
then

    OIFS="$IFS"
    IFS=$'\n'
    for d in */ ; do
        findTasks $d

    done
    IFS="$OIFS"

else
    echo "Cannot find replacement tasks.json"

fi
