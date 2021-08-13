#! /bin/bash

# Using a HereDoc as comment that will also appear in the terminal
cat << whileHereDoc

=================
||    LOOPS    ||
=================

Loops accept "break" and "continue" statements 

WHILE loop
==========

While loop will run until the condition provided is false.

SYNTAX: 

    while [condition]
    do
        code block to execute...
    done

EXAMPLE: 

    Variable "number" = 1 and we print number and increment it till the condition [ number -le 5 ] is false

whileHereDoc

number=1

while [ $number -le 5 ]
do
    echo "$number"
    number=$(( number+1 ))
done

cat << untilHereDoc

UNTIL loop
==========

Until loop will run until the condition provided is true.

SYNTAX: 

    until [condition]
    do
        code block to execute...
    done

EXAMPLE: 

    Variable "number" = 1 and we print number and increment it till the condition [ number -ge 5 ] is false

untilHereDoc

number=1

until [ $number -ge 5 ]
do
    echo "$number"
    number=$(( number+1 ))
done

cat << forHereDoc

FOR loop
========

For loop will run for every element in the provided list or array

SYNTAX 1: 

    for var in list
    do
        code block to execute...
    done

SYNTAX 2: 

    for var in expanded list
    do
        code block to execute...
    done

SYNTAX 3: 

    for var in expanded list with increment step
    do
        code block to execute...
    done

SYNTAX 4: 

    for (( var=0; var<5; var++))
    do
        code block to execute...
    done

EXAMPLE: 

    1. Variable "i" printed for each element of the list (1,2,3,4,5)
    2. Variable "i" printed for each element of the expanded list {0..10}
    3. Variable "i" printed for each element of the expanded list with a step increment of 2 {0..10..2}
    4. Variable "i" printed for each to 20. We are using break statement to leave the loop at 15 and continue to hop over 6 - 9 in this loop


forHereDoc

# Syntax 1
for i in 1 2 3 4 5 
do 
    echo $i
done
echo "==="
# Syntax 2
for i in {0..10}
do
    echo $i
done
echo "==="
# Syntax 3
for i in {0..10..2}
do
    echo $i
done
echo "==="
# Syntax 4
for (( i=0; i<20; i++ ))
do
    if [ $i -gt 5 ] && [ $i -lt 10 ]; then
        echo "We hop over the numebr 5 to 10 with continue"
        continue
    fi 
    if [ $i -eq 15 ]; then 
        echo "We break this loop here at 15"
        break
    fi
    echo $i
done
echo "==="