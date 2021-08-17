#! /bin/bash

# Using a HereDoc as comment that will also appear in the terminal
cat << inputHereDoc

============================
||   Script Input File    ||
============================

Commonly a WHILE loop is used to read a file line by line

SYNTAX: 
    while read line
    do
        # Process
    done < "${1:-/dev/stdin}"

EXAMPLE: 
    1. We user STDIN for input. in the example bellow, if no file path is specified, the script will create
        A text input and print whatever we input

        while read line
        do
            echo "\$line"
        done < "\${1:-/dev/stdin}"

inputHereDoc

# Example 1
cat << example1
Exemple 1 outputs: 
example1
while read line
do
    echo "$line"
done < "${1:-/dev/stdin}"