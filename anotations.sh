#!/usr/bin/env bash 


## How to use grep 

# Find for word
cat /etc/passwd | grep word 

# Find with initial word on file
cat /etc/passwd | grep ^word 

# Find word on end file
cat /etc/passwd | grep word$


## That's options, is the most used on day by day, for more information, in command line, make a "man grep".


---