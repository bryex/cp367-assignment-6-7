#!/bin/bash

# Task 1 - listallthings.sh
# -------------------------

echo "Starting listallthings.sh..."
echo

file_arr=( "$@" )

# Loop all the arguments
for file in "${file_arr[@]}"
do
    echo "file: $file"
   
    # Check if file is in current directory or the one below
    if [ -f $file ]
    then 
        file_found=true 
    else 
        cd ../
        if [ -f $file ]
        then
            file_found=true
        fi
    fi
    
    # List the file
    if [ '$file_found = true' ]
    then 
        ls -l $file
    fi

    # Reset flags
    file_found=false
    cd "$OLDPWD" 
    echo

done

echo "...ending listallthings.sh"

