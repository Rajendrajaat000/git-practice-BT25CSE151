#!/bin/bash
# greet.sh - Greet user with empty input validation
echo -n "Enter your name: "
read name

if [ -z "$name" ]; then
    echo "Hello, Stranger! Welcome to Git Lab."
else
    echo "Hello, $name! Welcome to Git Lab."
fi
