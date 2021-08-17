#! /bin/bash

# Using a HereDoc as comment that will also appear in the terminal
cat << outputHereDoc

=======================
||   Script Output   ||
=======================

The standard output STDOUT and standard error STDERR can be redirected to files using the syntax bellow

SYNTAX: 
    1. Explicit declaration of stdout and stderr
        ls -la 1>stdout.txt 2>stderr.txt
    2. Implicit declaration of stdout
        ls -la >stdout.txt
    3. Implicit declaration of stdout and stderr
        ls -la >stdout.txt 2>&1

    1> : STDOUT redirection
    2> : STDERR redirection
    2>&1 : STDOUT and STDERR redirects to the same file
    >& : STDOUT and STDERR redirects to the same file
    stdout.txt : Standard output file (created if does not exist)
    stderr.txt : Standard error file (created if does not exist)
EXAMPLE: 
    1. ls -al 1>stdout.txt 2>stderr.txt
    2. ls +al 1>stdout.txt 2>stderr.txt
    3. ls -al >stdout.txt 
    4. ls +al >stdout.txt 
    5. ls -la >stdoutAndStderr.txt 2>&1; ls +la >stdoutAndStderr.txt 2>&1

outputHereDoc

# Example 1
cat << example1Start
Exemple 1 outputs: 
example1Start
ls -al 1>>stdout.txt 2>>stderr.txt
cat << example1End

======= Example 1 End =======

example1End

# Example 2
cat << example2Start
Exemple 2 outputs: 
example2Start
ls +al 1>>stdout.txt 2>>stderr.txt
cat << example2End

======= Example 2 End =======

example2End