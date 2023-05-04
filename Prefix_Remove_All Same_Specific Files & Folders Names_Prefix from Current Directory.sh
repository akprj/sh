#!/bin/bash

# Set the path to the directory
directory="."

# Set the string to remove
string="Y2Mate.is - "

# Loop through each file and folder in the directory
for item in "$directory"/*; do
    # Check if the name contains the string to remove
    if [[ "$item" == "$directory/$string"* ]]; then
        # Remove the string from the name
        new_item="${item/$directory\/$string/}"
        # Rename the file or folder
        mv "$item" "$directory/$new_item"
    fi
done
