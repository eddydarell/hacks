#!/usr/bin/env python

try:
    from fileinput import filename
    import sys
    import pyperclip
    from termcolor import colored
except ImportError as err:
    print(colored(err, 'red'))
    sys.exit(1)
    print('Please install the missing module compatible with python 3')
    sys.exit(1)

if len(sys.argv) < 2:
    print(colored('Too few arguments', 'red'))
    print (colored("Usage: python3 butler.py <password id> <?passwords file path>", 'yellow'))
    sys.exit(1)
    
if len(sys.argv) > 2:
    filename = sys.argv[2]
else:
    filename = 'passwords.txt' # default password file name

with open(filename) as f:
    for line in f:
        if '=' in line:
            (key, val) = line.split("=")
            if key.lower() == sys.argv[1].lower():
                pyperclip.copy(val.strip())
                print(colored("Password copied to clipboard.", 'green'))
                sys.exit(0)
        else:
            print(colored('No key pair found', 'red'))
            print(colored('Save your passwords in the format: <key>=<value>', 'yellow'))
            break

error = colored('No password found for id: ' + sys.argv[1], 'red', attrs=['bold'])
print(error)
sys.exit(1)