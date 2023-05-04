#!/bin/bash

# Define the source directory
src_dir="./"

# Loop through each file in the source directory
for file in "$src_dir"/*
do
    # Get the filename without the path
    filename=$(basename -- "$file")

    # Extract the prefix to remove
    prefix=$(echo "$filename" | grep -o 'Part [[:digit:]]\+ of [[:digit:]]\+.*\.' | sed 's/\.$//')

    # Remove the prefix and extra spaces, and rename the file
    if [ -n "$prefix" ]; then
        new_filename=$(echo "$filename" | sed "s/$prefix//;s/[[:space:]]*\(\.[^.]*$\)/\1/")
        mv "$src_dir/$filename" "$src_dir/$new_filename"
        echo "Renamed $filename to $new_filename"
    fi
done
