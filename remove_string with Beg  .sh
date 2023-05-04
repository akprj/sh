#!/bin/bash

# Set the path to the directory
directory="."

# Set the string to remove
string="[]"

# Loop through each folder in the directory
for folder in "$directory"/*; do
    # Check if the folder name contains the string to remove
    if [[ "$folder" == *"$string"* ]]; then
        # Remove the string from the folder name
        new_folder="${folder//$string/}"
        # Rename the folder
        mv "$folder" "${new_folder//^\[/\\[}"
    fi
done
