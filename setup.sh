#!/bin/sh

# NOTE: must be in scripts/ directory to setup
#       links because of 'pwd'

# Binary dir (should be in PATH)
bin_dir=$HOME/.local/bin

# Create binary dir if not exist
if [ ! -d $bin_dir ]
then
    mkdir -p $bin_dir
fi

# List of files to NOT link
ignore="README.md LICENSE setup.sh st-urlhandler lowbattery-check"

# Link scripts into binary dir
for file in ./*
do 
    # Remove './' from filename
    file=$(echo "$file" | cut -c 3-)

    # Check if file should be ignored
    if echo "$ignore" | grep -q "$file" &>/dev/null
    then
        continue
    fi
    
    # Create link
    ln -sf $(pwd)/$file $bin_dir/$file
done

