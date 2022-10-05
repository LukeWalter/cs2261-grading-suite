#!/bin/bash

basefolder=$1
mytasks=$2

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
