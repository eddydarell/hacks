#! /bin/bash

# Using a HereDoc as comment that will also appear in the terminal
cat << inputHereDoc

======================
||   Script Input    ||
======================

To input arguments into a script, we add text separated with a blank space to after the script. 
These arguments can be consumed in the script using te syntax bellow.

SYNTAX: 
    1. Finite numbers of arguments
        \$[argument number starting with 1]
        $0 prints the name of the script file itself.

    2. Infinite number of arguments
        \$@

EXAMPLE: 
    1. Finite numer of arguments    
        In terminal
        :~ bash myscript.sh argument1 argument2 

        In script
        #! /bin/bash

        echo \$0 \$1 \$2

        Prints
        myscript.sh argument1 argument2
    
    2. Infinite number of arguments
        In terminal
        :~ bash myscript.sh argument1 argument2 ... argument100

        In script
        #! /bin/bash

        args=("$@")
        for i in $ags
        do
            echo \$i
        done

        Prints
        argument1 
        argument2
        .
        .
        .
        argument100

inputHereDoc

# Example 1
#echo $1 $2 $3

# Example 2
args=("$@")
for i in ${args[@]} 
do
    echo $i
done