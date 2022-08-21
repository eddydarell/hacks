## Password Butler

Very simple python3 script that helps you copy passwords to the clipboard from a text file containing a list of passwords in a key=value pairs.

#### Usage

```bash
python3 butler.py <password id> <?passwords file path>
```

#### Example

```bash
python3 butler.py facebook # Gives theFacebookPa$$w0rd

python3 butler.py google someOtherPasswordFile.txt # Gives theGooglePa$$w0rd
```

Can also be create a function for it

```bash
# In your .zshrc or .bashrc files

function butler () {
  currentdir=$(pwd)
  cd /the/path/to/password/butler/
  python3 butler.py $1 $2
  exitcode=$?
  cd ${currentdir}
  return $exitcode
}
```

#### Dependencies

- pyperclip
- termcolor
