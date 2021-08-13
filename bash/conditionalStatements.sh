#! /bin/bash

# Using a HereDoc as comment that will also appear in the terminal
cat << ifHereDoc
================================
||   CONDITIONAL STATEMENTS   ||
================================

IF ELSEIF ELSE
==============

Operand for conditional statements

-eq : =   : Equal
-ne : !=  : Not Equal
-gt : >   : Greater Than
-ge : >=  : Greater Than Or Equal
-lt : <   : Less Than
-le : <=  : Less Than Or Equal
-a  : &&  : AND
-o  : ||  : OR

We can also use angle brackets but instead of square brackets for the condition, we use double parentheses

if [ variable -gt 10 ] == if (( variable > 10 ))

When using compound statements, these 2 examples will give the same results

if [ variable -gt 10 ] && [ variable -lt 100 ] == if [[ variable -gt 10 && variable -lt 100 ]]

ifHereDoc

variable=10

if [ $variable -gt 11 ]; then
    echo "The number is equal to 10"
elif (( $variable > 5 )); then
    echo "The number is greater than 5"
else
    echo "The number is not equal to 10"
fi

cat << caseHereDoc


CASE statement
==============

In the example bellow,  the user is require to provide a country and the script will return the language spoken in said country.

caseHereDoc


echo -n "Enter the name of a country: "
read COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in

  Lithuania)
    echo -n "Lithuanian"
    ;;

  Romania | Moldova)
    echo -n "Romanian"
    ;;

  Italy | "San Marino" | Switzerland | "Vatican City")
    echo -n "Italian"
    ;;

  *)
    echo -n "unknown"
    ;;
esac